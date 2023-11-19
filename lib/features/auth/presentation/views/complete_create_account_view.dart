import 'package:akukom/cores/components/components.dart';
import 'package:akukom/cores/constants/__constants.dart';
import 'package:akukom/cores/navigator/app_router.dart';
import 'package:akukom/cores/utils/sizer_utils.dart';
import 'package:akukom/features/auth/__auth.dart';
import 'package:flutter/material.dart';

class CompleteCreateAccountView extends StatelessWidget {
  static const String routeName = '/complete-create-account';
  const CompleteCreateAccountView({super.key});

  @override
  Widget build(BuildContext context) {
    return NormalScaffoldWidget(
      useSingleScroll: false,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          verticalSpace(30),
          const AuthHeaderWidget(AppStrings.almostThere),
          verticalSpace(35),
          const Expanded(child: _CompleteCreateAccountForm()),
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
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController countryController = TextEditingController();

  @override
  void dispose() {
    phoneNumberController.dispose();
    countryController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFieldWidget(
          hintText: AppStrings.phoneNumberHint,
          title: AppStrings.phoneNumber,
          textEditingController: phoneNumberController,
          textInputType: TextInputType.phone,
        ),
        verticalSpace(20),
        TextFieldWidget(
          hintText: AppStrings.countryOfResidenceHint,
          title: AppStrings.countryOfResidence,
          textEditingController: countryController,
        ),
        verticalSpace(60),
        Button(
          text: AppStrings.signUp,
          onTap: () {
            AppRouter.instance.navigateTo(PhoneVerificationOtpView.routeName);
          },
        ),
      ],
    );
  }
}
