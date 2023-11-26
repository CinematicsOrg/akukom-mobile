import 'package:akukom/app/locator.dart';
import 'package:akukom/cores/components/components.dart';
import 'package:akukom/cores/constants/__constants.dart';
import 'package:akukom/cores/navigator/app_router.dart';
import 'package:akukom/cores/utils/utils.dart';
import 'package:akukom/features/auth/__auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
            child: GestureDetector(
              onTap: () =>
                  AppRouter.instance.navigateTo(CreateAccountView.routeName),
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
          ),
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
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final LoginCubit _loginCubit = getIt<LoginCubit>();
  final SigninBloc _signinBloc = getIt<SigninBloc>();

  @override
  void initState() {
    _loginCubit.reset();
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    _signinBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      bloc: _loginCubit,
      builder: (context, state) {
        return Column(
          children: [
            TextFieldWidget(
              hintText: AppStrings.emailHint,
              title: AppStrings.email,
              textEditingController: emailController,
              textInputType: TextInputType.emailAddress,
              onChanged: _loginCubit.emailChanged,
            ),
            verticalSpace(20),
            TextFieldWidget(
              hintText: AppStrings.passwordHint,
              title: AppStrings.password,
              textEditingController: passwordController,
              textInputType: TextInputType.visiblePassword,
              onChanged: _loginCubit.passwordChanged,
              isPassword: true,
            ),
            verticalSpace(16),
            Align(
              alignment: Alignment.bottomRight,
              child: GestureDetector(
                onTap: () =>
                    AppRouter.instance.navigateTo(ForgotPasswordView.routeName),
                child: TextWidget(
                  AppStrings.forgotPassword,
                  fontSize: sp(14),
                  decoration: TextDecoration.underline,
                  fontWeight: FontWeight.w400,
                  textAlign: TextAlign.end,
                  textColor: kcPrimaryColor,
                ),
              ),
            ),
            verticalSpace(81),
            BlocConsumer<SigninBloc, SigninState>(
              bloc: _signinBloc,
              listener: onLoginListener,
              builder: (context, state) {
                if (state.status == SigninStatus.loading) {
                  return const Button.loading(
                    color: kcPrimaryColor,
                  );
                }
                return Button(
                  text: AppStrings.login,
                  active: _loginCubit.state.isValid,
                  color: _loginCubit.state.isValid
                      ? kcPrimaryColor
                      : kcGrey400.withOpacity(0.5),
                  onTap: login,
                );
              },
            ),
          ],
        );
      },
    );
  }

  void login() {
    final email = _loginCubit.state.email.value;
    final password = _loginCubit.state.password.value;
    final LoginParams params = LoginParams(
      email: email,
      password: password,
    );

    _signinBloc.add(
      SigninButtonPressed(
        param: params,
      ),
    );
  }
}

extension __LoginFormListener on __LoginFormState {
  void onLoginListener(BuildContext context, SigninState state) {
    if (state.status == SigninStatus.success) {
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(
          SnackBar(
            content: TextWidget(
              state.signupEntity!.message!,
              fontSize: sp(14),
              textColor: kcWhite,
              fontWeight: FontWeight.w400,
            ),
            backgroundColor: kcPrimaryColor,
          ),
        );
    } else if (state.status == SigninStatus.failure) {
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
