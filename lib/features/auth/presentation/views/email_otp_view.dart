import 'package:akukom/app/locator.dart';
import 'package:akukom/cores/components/components.dart';
import 'package:akukom/cores/constants/__constants.dart';
import 'package:akukom/cores/navigator/app_router.dart';
import 'package:akukom/cores/utils/utils.dart';
import 'package:akukom/features/auth/__auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';

class EmalVerificationOtpView extends StatelessWidget {
  static const String routeName = '/email-verification-otp';
  const EmalVerificationOtpView({super.key});

  @override
  Widget build(BuildContext context) {
    final ForgotPasswordCubit forgotPasswordCubit =
        getIt<ForgotPasswordCubit>();
    final email = forgotPasswordCubit.state.email.value;

    return NormalScaffoldWidget(
      useSingleScroll: false,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const VSpace(30),
          const AuthHeaderWidget(AppStrings.verifyEmailAdress),
          const VSpace(15),
          SizedBox(
            width: sp(328),
            child: TwoSpanTextWidget(
              AppStrings.kindlyEnterTheCode,
              email,
              fontSize: sp(kfsTiny),
              fontSize2: sp(kfsTiny),
              textColor2: kcBlack700,
              textColor: kcBlack700,
            ),
          ),
          const VSpace(77),
          _VerifyEmailForm(
            email,
          ),
          const VSpace(50),
          Align(
            alignment: Alignment.center,
            child: TwoSpanTextWidget(
              AppStrings.sendAgain,
              '  00:20',
              fontSize: sp(kfsTiny),
              fontSize2: sp(kfsTiny),
              textColor2: kcBlack,
              textColor: kcBlack700,
            ),
          ),
        ],
      ),
    );
  }
}

class _VerifyEmailForm extends StatefulWidget {
  final String email;
  const _VerifyEmailForm(
    this.email,
  );

  @override
  State<_VerifyEmailForm> createState() => __VerifyEmailFormState();
}

class __VerifyEmailFormState extends State<_VerifyEmailForm> {
  final OtpFieldController _otpController = OtpFieldController();
  final VerifyForgotPasswordOtpBloc _verifyForgotPasswordOtpBloc =
      getIt<VerifyForgotPasswordOtpBloc>();

  @override
  void dispose() {
    _verifyForgotPasswordOtpBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<VerifyForgotPasswordOtpBloc,
        VerifyForgotPasswordOtpState>(
      bloc: _verifyForgotPasswordOtpBloc,
      listener: onForgotPasswordChanged,
      builder: (context, state) {
        return OTPTextField(
          controller: _otpController,
          length: 4,
          otpFieldStyle: OtpFieldStyle(
            focusBorderColor: kcBlack,
            disabledBorderColor: kcBlack700,
            borderColor: kcBlack700,
            enabledBorderColor: kcBlack700,
            backgroundColor: kcWhite,
          ),
          width: MediaQuery.of(context).size.width,
          outlineBorderRadius: 10,
          fieldWidth: sp(64),
          style: GoogleFonts.inter(
            fontSize: sp(kfsLarge),
            fontWeight: FontWeight.w700,
            color: kcBlack,
          ),
          contentPadding: EdgeInsets.symmetric(vertical: sp(20)),
          textFieldAlignment: MainAxisAlignment.spaceAround,
          fieldStyle: FieldStyle.box,
          onCompleted: submitPin,
        );
      },
    );
  }

  void submitPin(pin) {
    final code = pin;
    final email = widget.email;
    final param = VerifyEmailParam(
      email: email,
      code: code,
    );

    _verifyForgotPasswordOtpBloc.add(
      VerifyForgotPasswordOtpButtonPressed(
        param: param,
      ),
    );
  }
}

extension _VerifyEmailFormStateX on __VerifyEmailFormState {
  void onForgotPasswordChanged(
      BuildContext context, VerifyForgotPasswordOtpState state) {
    if (state.status == VerifyForgotPasswordOtpStatus.success) {
      AppRouter.instance.navigateTo(NewPasswordView.routeName);
    } else if (state.status == VerifyForgotPasswordOtpStatus.failure) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(state.failures!.message),
          backgroundColor: kcErrorColor,
        ),
      );
    }
  }
}
