import 'package:akukom/app/locator.dart';
import 'package:akukom/cores/components/components.dart';
import 'package:akukom/cores/constants/__constants.dart';
import 'package:akukom/cores/utils/utils.dart';
import 'package:akukom/features/auth/__auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
  final CreateNewPasswordCubit _createNewPasswordCubit =
      getIt<CreateNewPasswordCubit>();
  final ChangePasswordBloc _changePasswordBloc = getIt<ChangePasswordBloc>();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _passwordController.dispose();
    _changePasswordBloc.close();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateNewPasswordCubit, CreateNewPasswordState>(
      bloc: _createNewPasswordCubit,
      builder: (context, state) {
        return Column(
          children: [
            TextFieldWidget(
              hintText: AppStrings.password,
              title: AppStrings.passwordHint,
              textEditingController: _passwordController,
              onChanged: _createNewPasswordCubit.passwordChanged,
              isPassword: true,
            ),
            verticalSpace(20),
            TextFieldWidget(
              hintText: AppStrings.confirmPassword,
              title: AppStrings.confirmPasswordHint,
              textEditingController: _confirmPasswordController,
              onChanged: _createNewPasswordCubit.confirmPasswordChanged,
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
            BlocConsumer<ChangePasswordBloc, ChangePasswordState>(
              bloc: _changePasswordBloc,
              listener: onNewPasswordChanged,
              builder: (context, state) {
                if (state.status == ChangePasswordStatus.loading) {
                  return const Button.loading(
                    color: kcPrimaryColor,
                  );
                }
                return Button(
                  text: AppStrings.changePassword,
                  active: _createNewPasswordCubit.state.isValid,
                  color: _createNewPasswordCubit.state.isValid
                      ? kcPrimaryColor
                      : kcGrey400.withOpacity(0.5),
                  onTap: submitPassword,
                  // onTap: () {
                  //   Navigator.pushNamed(
                  //       context, PasswordResetSuccessfulView.routeName);
                  // },
                );
              },
            ),
          ],
        );
      },
    );
  }

  void submitPassword() {
    final ForgotPasswordCubit forgotPasswordCubit =
        getIt<ForgotPasswordCubit>();
    final passoword = _createNewPasswordCubit.state.password.value;
    final confirmPassword = _createNewPasswordCubit.state.confirmPassword.value;
    final emil = forgotPasswordCubit.state.email.value;

    final ChangePasswordParam param = ChangePasswordParam(
      email: emil,
      password: passoword,
      confirmNewPassword: confirmPassword,
    );


    _changePasswordBloc.add(
      ChangePasswordButtonPressed(
        param: param,
      ),
    );
  }
}

extension _NewPasswordFormListener on _NewPasswordFormState {
  void onNewPasswordChanged(BuildContext context, ChangePasswordState state) {
    if (state.status == ChangePasswordStatus.success) {
      Navigator.pushNamed(context, PasswordResetSuccessfulView.routeName);
    }
    if (state.status == ChangePasswordStatus.failure) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: TextWidget(
            state.failures!.message,
            fontSize: sp(14),
            textColor: kcWhite,
            fontWeight: FontWeight.w400,
            textAlign: TextAlign.left,
          ),
          backgroundColor: kcErrorColor,
        ),
      );
    }
  }
}
