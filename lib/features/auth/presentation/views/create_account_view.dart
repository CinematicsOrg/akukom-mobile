import 'package:akukom/app/locator.dart';
import 'package:akukom/cores/navigator/app_router.dart';
import 'package:akukom/cores/utils/utils.dart';
import 'package:flutter/material.dart';

import 'package:akukom/cores/components/components.dart';
import 'package:akukom/features/auth/presentation/__presentation.dart';

import 'package:akukom/cores/constants/__constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreateAccountView extends StatelessWidget {
  static const String routeName = '/create-account';
  const CreateAccountView({super.key});

  @override
  Widget build(BuildContext context) {
    return NormalScaffoldWidget(
      // useSingleScroll: false,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          verticalSpace(30),
          const AuthHeaderWidget(AppStrings.joinUs),
          verticalSpace(35),
          const _CreateAccountForm(),
        ],
      ),
    );
  }
}

class _CreateAccountForm extends StatefulWidget {
  const _CreateAccountForm();

  @override
  State<_CreateAccountForm> createState() => _CreateAccountFormState();
}

class _CreateAccountFormState extends State<_CreateAccountForm> {
  final SignupCubit _signupCubit = getIt<SignupCubit>();
  final SignupBloc _signupBloc = getIt<SignupBloc>();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  @override
  void initState() {
    _signupCubit.reset();
    super.initState();
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _passwordController.dispose();
    _emailController.dispose();
    _signupBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignupCubit, SignupCubitState>(
      bloc: _signupCubit,
      builder: (context, state) {
        return SizedBox(
          child: Column(
            children: [
              TextFieldWidget(
                hintText: AppStrings.firstName,
                title: AppStrings.firstNameHint,
                textEditingController: _firstNameController,
                onChanged: _signupCubit.firstnameChanged,
              ),
              verticalSpace(24),
              TextFieldWidget(
                hintText: AppStrings.lastName,
                title: AppStrings.lastNameHint,
                textEditingController: _lastNameController,
                onChanged: _signupCubit.lastnameChanged,
              ),
              verticalSpace(24),
              TextFieldWidget(
                hintText: AppStrings.email,
                title: AppStrings.emailHint,
                textEditingController: _emailController,
                textInputType: TextInputType.emailAddress,
                onChanged: _signupCubit.emailChanged,
              ),
              verticalSpace(24),
              TextFieldWidget(
                hintText: AppStrings.password,
                title: AppStrings.passwordHint,
                textEditingController: _passwordController,
                isPassword: true,
                onChanged: _signupCubit.passwordChanged,
              ),
              verticalSpace(12),
              Row(
                children: [
                  Checkbox(
                    value: _signupCubit.state.agree,
                    onChanged: _signupCubit.agreeChanged,
                  ),
                  TextWidget(
                    AppStrings.iAccept,
                    fontSize: sp(14),
                    textColor: kcBlack700,
                    fontWeight: FontWeight.w400,
                  ),
                ],
              ),
              verticalSpace(56),
              BlocConsumer<SignupBloc, SignupState>(
                bloc: _signupBloc,
                listener: onSignupStateChanged,
                builder: (context, state) {
                  if (state.status == SignupStatus.loading) {
                    return const Button.loading(
                      color: kcPrimaryColor,
                    );
                  }
                  return Button(
                    text: AppStrings.signUp,
                    active: _signupCubit.state.isValid,
                    color: _signupCubit.state.isValid
                        ? kcPrimaryColor
                        : kcGrey400.withOpacity(0.5),
                    onTap: onSignup,
                    // onTap: () {
                    //   AppRouter.instance
                    //       .navigateTo(CompleteCreateAccountView.routeName);
                    // },
                  );
                },
              ),
              verticalSpace(12),
              Row(
                children: [
                  const Expanded(
                    child: Divider(
                      color: kcGrey400,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextWidget(
                      AppStrings.orRegisterWith,
                      fontSize: sp(14),
                      textColor: kcBlack700,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const Expanded(
                    child: Divider(
                      color: kcGrey400,
                    ),
                  ),
                ],
              ),
              verticalSpace(16),
              Row(
                children: [
                  const _SignUpOptions(
                    imagePath: AppIcons.facebook,
                  ),
                  horizontalSpace(13),
                  const _SignUpOptions(
                    imagePath: AppIcons.google,
                  ),
                  horizontalSpace(13),
                  const _SignUpOptions(
                    imagePath: AppIcons.apple,
                  ),
                ],
              ),
              verticalSpace(30),
              const Center(
                child: TwoSpanTextWidget(
                  AppStrings.alreadyHaveAnAccount,
                  AppStrings.login,
                  textColor: kcBlack700,
                  textColor2: kcPrimaryColor,
                  fontWeight2: FontWeight.w700,
                ),
              ),
              verticalSpace(40),
            ],
          ),
        );
      },
    );
  }

  void onSignup() {
    final email = _signupCubit.state.email.value;
    final password = _signupCubit.state.password.value;
    final firstName = _signupCubit.state.firstname.value;
    final lastName = _signupCubit.state.lastname.value;

    final signupParam = SignUpParams(
      firstName: firstName,
      lastName: lastName,
      email: email,
      password: password,
    );

    _signupBloc.add(SignupButtonPressed(param: signupParam));
  }
}

extension _CreateAccountFormListener on _CreateAccountFormState {
  void onSignupStateChanged(BuildContext context, SignupState state) async {
    if (state.status == SignupStatus.success) {
      await SessionManager.instance
          .setToken(state.signupEntity?.data?.accessToken ?? '');
      AppRouter.instance.navigateTo(CompleteCreateAccountView.routeName);
    } else if (state.status == SignupStatus.failure) {
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
    // Add more conditions as needed
  }
}

class _SignUpOptions extends StatelessWidget {
  final String imagePath;
  const _SignUpOptions({required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        // height: ,
        decoration: BoxDecoration(
          border: Border.all(
            color: kcGrey400,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: sp(18), vertical: sp(21)),
          child: Svg(
            path: imagePath,
            svgType: SvgType.asset,
          ),
        ),
      ),
    );
  }
}
