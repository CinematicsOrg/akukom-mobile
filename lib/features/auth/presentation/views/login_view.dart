import 'package:akukom/cores/components/components.dart';
import 'package:akukom/cores/constants/__constants.dart';
import 'package:akukom/cores/navigator/app_router.dart';
import 'package:akukom/cores/utils/utils.dart';
import 'package:akukom/features/auth/__auth.dart';
import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  static const String routeName = '/login';
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return NormalScaffoldWidget(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          verticalSpace(30),
          const AuthHeaderWidget(AppStrings.welcomeBack),
          verticalSpace(35),
          const _LoginForm(),
          verticalSpace(250),
          Align(
            alignment: Alignment.center,
            child: TwoSpanTextWidget(
              AppStrings.dontHaveAnAccount,
              AppStrings.signUp,
              fontSize: sp(14),
              fontSize2: sp(14),
              textColor: kcBlack700,
              textColor2: kcPrimaryColor,
              textAlign: TextAlign.center,
            ),
          ),
          // verticalSpace(58),
        ],
      ),
    );
  }
}

class _LoginForm extends StatefulWidget {
  const _LoginForm();

  @override
  State<_LoginForm> createState() => __LoginFormState();
}

class __LoginFormState extends State<_LoginForm> {
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    phoneController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFieldWidget(
          hintText: AppStrings.phoneNumberHint,
          title: AppStrings.phoneNumber,
          textEditingController: phoneController,
          textInputType: TextInputType.phone,
        ),
        verticalSpace(20),
        TextFieldWidget(
          hintText: AppStrings.passwordHint,
          title: AppStrings.password,
          textEditingController: passwordController,
          textInputType: TextInputType.visiblePassword,
          isPassword: true,
        ),
        verticalSpace(16),
        Align(
          alignment: Alignment.bottomRight,
          child: TextWidget(
            AppStrings.forgotPassword,
            fontSize: sp(14),
            decoration: TextDecoration.underline,
            fontWeight: FontWeight.w400,
            textAlign: TextAlign.end,
            textColor: kcPrimaryColor,
          ),
        ),
        verticalSpace(81),
        Button(
          text: AppStrings.login,
          onTap: () {
            AppRouter.instance.navigateTo(CompleteCreateAccountView.routeName);
          },
        ),
      ],
    );
  }
}
