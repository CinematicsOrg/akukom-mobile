import 'package:akukom/cores/utils/utils.dart';
import 'package:flutter/material.dart';

import 'package:akukom/cores/components/components.dart';
import 'package:akukom/features/auth/presentation/__presentation.dart';

import 'package:akukom/cores/constants/__constants.dart';

class CreateAccountView extends StatelessWidget {
  static const String routeName = '/create-account';
  const CreateAccountView({super.key});

  @override
  Widget build(BuildContext context) {
    return NormalScaffoldWidget(
      useSingleScroll: false,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          verticalSpace(30),
          const AuthHeaderWidget(AppStrings.joinUs),
          verticalSpace(35),
          const Expanded(
            child: _CreateAccountForm(),
          )
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
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        children: [
          TextFieldWidget(
            hintText: AppStrings.firstName,
            title: AppStrings.firstNameHint,
            textEditingController: _firstNameController,
          ),
          verticalSpace(24),
          TextFieldWidget(
            hintText: AppStrings.lastName,
            title: AppStrings.lastNameHint,
            textEditingController: _lastNameController,
          ),
          verticalSpace(24),
          TextFieldWidget(
            hintText: AppStrings.password,
            title: AppStrings.passwordHint,
            textEditingController: _passwordController,
            isPassword: true,
          ),
          verticalSpace(12),
          Row(
            children: [
              Checkbox(
                value: false,
                onChanged: (value) {},
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
          Button(
            text: AppStrings.signUp,
            onTap: () {},
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
          const Expanded(
            child: Center(
              child: TwoSpanTextWidget(
                AppStrings.alreadyHaveAnAccount,
                AppStrings.login,
                textColor: kcBlack700,
                textColor2: kcPrimaryColor,
                fontWeight2: FontWeight.w700,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _SignUpOptions extends StatelessWidget {
  final String imagePath;
  const _SignUpOptions({required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
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
