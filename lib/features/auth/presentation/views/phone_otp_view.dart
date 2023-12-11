import 'package:akukom/app/locator.dart';
import 'package:akukom/cores/components/__components.dart';
import 'package:akukom/cores/constants/__constants.dart';
import 'package:akukom/cores/navigator/app_router.dart';
import 'package:akukom/cores/utils/utils.dart';
import 'package:akukom/features/auth/__auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';

class PhoneVerificationOtpView extends StatelessWidget {
  static const String routeName = '/phone-verification-otp';
  final String phone;
  const PhoneVerificationOtpView({
    super.key,
    required this.phone,
  });

  @override
  Widget build(BuildContext context) {
    return NormalScaffoldWidget(
      useSingleScroll: false,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const VSpace(30),
          const AuthHeaderWidget(AppStrings.verifyYourNumber),
          const VSpace(35),
          SizedBox(
            width: sp(328),
            child: TwoSpanTextWidget(
              AppStrings.aFourDigitCode,
              ' +$phone',
              fontSize: sp(kfsTiny),
              fontSize2: sp(kfsTiny),
              textColor2: kcBlack700,
              textColor: kcBlack700,
            ),
          ),
          const VSpace(77),
          const _VerifyPhoneForm(),
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

class _VerifyPhoneForm extends StatefulWidget {
  const _VerifyPhoneForm();

  @override
  State<_VerifyPhoneForm> createState() => __VerifyPhoneFormState();
}

class __VerifyPhoneFormState extends State<_VerifyPhoneForm> {
  final OtpFieldController _otpController = OtpFieldController();
  final VerifyPhoneBloc _verifyPhoneBloc = getIt<VerifyPhoneBloc>();

  @override
  void dispose() {
    _verifyPhoneBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<VerifyPhoneBloc, VerifyPhoneState>(
      bloc: _verifyPhoneBloc,
      listener: onVerifyPhoneChanged,
      child: OTPTextField(
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
        onCompleted: verifyPhone,
        // onCompleted: (pin) {
        //   AppRouter.instance.navigateTo(VerificationSuccessfulView.routeName);
        // },
      ),
    );
  }

  void verifyPhone(pin) {
    final VerifyPhoneOtpParams param = VerifyPhoneOtpParams(code: pin);
    _verifyPhoneBloc.add(
      VerifyPhoneButtonEvent(
        param: param,
      ),
    );
  }
}

extension _VerifyPhoneFormListener on __VerifyPhoneFormState {
  void onVerifyPhoneChanged(BuildContext context, VerifyPhoneState state) {
    if (state.status == VerifyPhoneStatus.success) {
      AppRouter.instance.navigateTo(
        VerificationSuccessfulView.routeName,
      );
    } else if (state.status.isFailure) {
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
