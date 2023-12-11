import 'package:akukom/app/locator.dart';
import 'package:akukom/cores/components/__components.dart';
import 'package:akukom/cores/constants/__constants.dart';
import 'package:akukom/cores/navigator/app_router.dart';
import 'package:akukom/cores/utils/sizer_utils.dart';
import 'package:akukom/features/auth/__auth.dart';
import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CompleteCreateAccountView extends StatelessWidget {
  static const String routeName = '/complete-create-account';
  const CompleteCreateAccountView({super.key});

  @override
  Widget build(BuildContext context) {
    return const NormalScaffoldWidget(
      useSingleScroll: false,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          VSpace(30),
          AuthHeaderWidget(AppStrings.almostThere),
          VSpace(35),
          Expanded(child: _CompleteCreateAccountForm()),
        ],
      ),
    );
  }
}

class _CompleteCreateAccountForm extends StatefulWidget {
  const _CompleteCreateAccountForm();

  @override
  State<_CompleteCreateAccountForm> createState() =>
      __CompleteCreateAccountFormState();
}

class __CompleteCreateAccountFormState
    extends State<_CompleteCreateAccountForm> {
  final SignupCompleteCubit _signupCompleteCubit = getIt<SignupCompleteCubit>();
  final CompleteSignupBloc _completeSignupBloc = getIt<CompleteSignupBloc>();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController countryController = TextEditingController();
  final TextEditingController tribeController = TextEditingController();

  @override
  void initState() {
    _signupCompleteCubit.reset();
    super.initState();
  }

  @override
  void dispose() {
    phoneNumberController.dispose();
    countryController.dispose();
    tribeController.dispose();
    _completeSignupBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignupCompleteCubit, SignupCompleteState>(
      bloc: _signupCompleteCubit,
      builder: (context, state) {
        final showCode = _signupCompleteCubit.state.countryPhoneCode.isValid;
        return Column(
          children: [
            TextFieldWidget(
              hintText: AppStrings.countryOfResidenceHint,
              title: AppStrings.countryOfResidence,
              textEditingController: countryController,
              readOnly: true,
              onTap: () {
                showCountryPicker(
                  context: context,
                  showPhoneCode: true,
                  onSelect: selectCountry,
                );
              },
              onChanged: _signupCompleteCubit.countryOfResidenceChanged,
            ),
            const VSpace(16),
            TextFieldWidget(
              hintText: AppStrings.phoneNumberHint,
              title: AppStrings.phoneNumber,
              textEditingController: phoneNumberController,
              textInputType: TextInputType.phone,
              onChanged: _signupCompleteCubit.phoneChanged,
              prefix: showCode
                  ? SizedBox(
                      width: 50,
                      child: Center(
                        child: TextWidget(
                          _signupCompleteCubit.state.countryPhoneCode.value,
                          fontSize: sp(15),
                          textColor:
                              Theme.of(context).textTheme.titleMedium!.color,
                        ),
                      ),
                    )
                  : null,
            ),
            const VSpace(16),
            TextFieldWidget(
              hintText: AppStrings.tribeHint,
              title: AppStrings.tribe,
              textEditingController: tribeController,
              textInputType: TextInputType.text,
              onChanged: _signupCompleteCubit.tribeChanged,
            ),
            const VSpace(20),
            const VSpace(60),
            BlocConsumer<CompleteSignupBloc, CompleteSignupState>(
              bloc: _completeSignupBloc,
              listener: onCompleteSignupChanged,
              builder: (context, state) {
                if (state.status == CompleteSignupStatus.loading) {
                  return const Button.loading(
                    color: kcPrimaryColor,
                  );
                }
                return Button(
                  active: _signupCompleteCubit.state.isValid,
                  color: _signupCompleteCubit.state.isValid
                      ? kcPrimaryColor
                      : kcGrey400.withOpacity(0.5),
                  text: AppStrings.signUp,
                  onTap: completeSignup,
                  // onTap: () async => printValue(),
                  // onTap: () {
                  //   AppRouter.instance
                  //       .navigateTo(PhoneVerificationOtpView.routeName);
                  // },
                );
              },
            ),
          ],
        );
      },
    );
  }

  void selectCountry(Country country) {
    final countryName = country.name;
    final countryPhoneCode = '+${country.phoneCode}';
    countryController.text = countryName;
    _signupCompleteCubit.countryOfResidenceChanged(countryName);
    _signupCompleteCubit.countryPhoneCodeChanged(countryPhoneCode);
  }

  void completeSignup() {
    final phoneCode = _signupCompleteCubit.state.countryPhoneCode.value;
    final phoneNumber = _signupCompleteCubit.state.phone.value;
    final country = _signupCompleteCubit.state.countryOfResidence.value;
    final tribe = _signupCompleteCubit.state.tribe.value;
    final CompleteSignupParams param = CompleteSignupParams(
      phoneNumber: '$phoneCode$phoneNumber',
      country: country,
      tribe: tribe,
    );
    _completeSignupBloc.add(
      CompleteSignupButtonPressed(
        param: param,
      ),
    );
  }
}

extension _CreateAccountFormListener on __CompleteCreateAccountFormState {
  void onCompleteSignupChanged(
      BuildContext context, CompleteSignupState state) {
    if (state.status == CompleteSignupStatus.success) {
      AppRouter.instance.navigateTo(
        PhoneVerificationOtpView.routeName,
        arguments: _signupCompleteCubit.state.phone.value,
      );
    } else if (state.status.isFailure) {
      AppRouter.instance.navigateTo(
        PhoneVerificationOtpView.routeName,
        arguments: _signupCompleteCubit.state.phone.value,
      );
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(
          SnackBar(
            content: TextWidget(
              state.failures!.message,
              fontSize: sp(14),
              textColor: kcWhite,
              fontWeight: FontWeight.w400,
            ),
            backgroundColor: kcErrorColor,
          ),
        );
    }
  }
}
