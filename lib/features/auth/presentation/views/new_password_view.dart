import 'package:akukom/cores/components/components.dart';
import 'package:akukom/cores/constants/__constants.dart';
import 'package:akukom/cores/constants/strings.dart';
import 'package:akukom/cores/utils/utils.dart';
import 'package:akukom/features/auth/__auth.dart';
import 'package:flutter/material.dart';

class NewPasswordView extends StatelessWidget {
  static const String routeName = '/new-password';
  const NewPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return NormalScaffoldWidget(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          verticalSpace(30),
          const AuthHeaderWidget(AppStrings.createNewPassword),
          verticalSpace(35),
          const _NewPasswordForm(),
        ],
      ),
    );
  }
}

class _NewPasswordForm extends StatefulWidget {
  const _NewPasswordForm();

  @override
  State<_NewPasswordForm> createState() => _NewPasswordFormState();
}

class _NewPasswordFormState extends State<_NewPasswordForm> {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFieldWidget(
          hintText: AppStrings.password,
          title: AppStrings.passwordHint,
          textEditingController: _passwordController,
          isPassword: true,
        ),
        verticalSpace(20),
        TextFieldWidget(
          hintText: AppStrings.confirmPassword,
          title: AppStrings.confirmPasswordHint,
          textEditingController: _confirmPasswordController,
          isPassword: true,
        ),
        verticalSpace(20),
        Align(
          alignment: Alignment.centerRight,
          child: TextWidget(
            AppStrings.passRequirement,
            fontSize: sp(14),
            textColor: kcBlack700,
            fontWeight: FontWeight.w400,
            textAlign: TextAlign.left,
          ),
        ),
        verticalSpace(32),
        Button(
          text: AppStrings.changePassword,
          onTap: () {
            Navigator.pushNamed(context, PasswordResetSuccessfulView.routeName);
          },
        ),
      ],
    );
  }
}
