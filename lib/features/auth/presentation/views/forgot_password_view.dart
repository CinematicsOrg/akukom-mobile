import 'package:akukom/app/locator.dart';
import 'package:akukom/cores/components/__components.dart';
import 'package:akukom/cores/constants/__constants.dart';
import 'package:akukom/cores/navigator/navigator.dart';
import 'package:akukom/cores/utils/sizer_utils.dart';
import 'package:akukom/features/auth/__auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForgotPasswordView extends StatelessWidget {
  static const String routeName = '/forgot-password';
  const ForgotPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return NormalScaffoldWidget(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const VSpace(30),
          const AuthHeaderWidget(AppStrings.forgotPassword),
          const VSpace(35),
          const _ForgotPasswordForm(),
          Align(
            alignment: Alignment.center,
            child: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: TextWidget(
                AppStrings.goBackToSignIn,
                fontSize: sp(14),
                textColor: kcBlack,
                fontWeight: FontWeight.w500,
                textAlign: TextAlign.center,
              ),
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
  final ForgotPasswordCubit _forgotPasswordCubit = getIt<ForgotPasswordCubit>();
  final ForgotPasswordOtpBloc _forgotPasswordOtpBloc =
      getIt<ForgotPasswordOtpBloc>();

  @override
  void dispose() {
    _emailController.dispose();
    _forgotPasswordCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ForgotPasswordCubit, ForgotPasswordState>(
      bloc: _forgotPasswordCubit,
      builder: (context, state) {
        return Column(
          children: [
            TextFieldWidget(
              hintText: AppStrings.email,
              title: AppStrings.emailHint,
              textEditingController: _emailController,
              textInputType: TextInputType.emailAddress,
              onChanged: _forgotPasswordCubit.emailChanged,
            ),
            const VSpace(32),
            BlocConsumer<ForgotPasswordOtpBloc, ForgotPasswordOtpState>(
              bloc: _forgotPasswordOtpBloc,
              listener: onForgotPasswordChanged,
              builder: (context, state) {
                if (state.statusUI == ForgotPasswordOtpStatusUI.loading) {
                  return const Button.loading(
                    color: kcPrimaryColor,
                  );
                }
                return Button(
                  text: AppStrings.resetPassword,
                  onTap: resetPassword,
                  active: _forgotPasswordCubit.state.isValid,
                  color: _forgotPasswordCubit.state.isValid
                      ? kcPrimaryColor
                      : kcGrey400.withOpacity(0.5),
                );
              },
            ),
            const VSpace(20),
          ],
        );
      },
    );
  }

  void resetPassword() {
    final email = _forgotPasswordCubit.state.email.value;
    final ForgotPasswordParams params = ForgotPasswordParams(
      email: email,
    );

    _forgotPasswordOtpBloc.add(
      ForgotPasswordOtpButtonPressed(
        param: params,
      ),
    );
  }
}

extension _ForgotPasswordFormExtension on __ForgotPasswordFormState {
  void onForgotPasswordChanged(
      BuildContext context, ForgotPasswordOtpState state) {
    if (state.statusUI == ForgotPasswordOtpStatusUI.done) {
      AppRouter.instance.navigateTo(
        EmalVerificationOtpView.routeName,
      );
    } else if (state.statusUI == ForgotPasswordOtpStatusUI.error) {
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(
          SnackBar(
            content: TextWidget(
              state.failure!.message,
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
