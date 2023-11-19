import 'package:akukom/cores/components/components.dart';
import 'package:akukom/cores/constants/__constants.dart';
import 'package:akukom/cores/constants/strings.dart';
import 'package:akukom/cores/utils/sizer_utils.dart';
import 'package:akukom/features/auth/__auth.dart';
import 'package:flutter/material.dart';

class ForgotPasswordView extends StatelessWidget {
  static const String routeName = '/forgot-password';
  const ForgotPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return NormalScaffoldWidget(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          verticalSpace(30),
          const AuthHeaderWidget(AppStrings.forgotPassword),
          verticalSpace(35),
          const _ForgotPasswordForm(),
          Align(
            alignment: Alignment.center,
            child: TextWidget(
              AppStrings.goBackToSignIn,
              fontSize: sp(14),
              textColor: kcBlack,
              fontWeight: FontWeight.w500,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}

class _ForgotPasswordForm extends StatefulWidget {
  const _ForgotPasswordForm();

  @override
  State<_ForgotPasswordForm> createState() => __ForgotPasswordFormState();
}

class __ForgotPasswordFormState extends State<_ForgotPasswordForm> {
  final TextEditingController _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFieldWidget(
          hintText: AppStrings.email,
          title: AppStrings.emailHint,
          textEditingController: _emailController,
          textInputType: TextInputType.emailAddress,
        ),
        verticalSpace(32),
        Button(
          text: AppStrings.resetPassword,
          onTap: () {
            Navigator.pushNamed(
              context,
              EmalVerificationOtpView.routeName,
            );
          },
        ),
        verticalSpace(20),
      ],
    );
  }
}
