import 'package:akukom/cores/components/components.dart';
import 'package:akukom/cores/constants/__constants.dart';
import 'package:akukom/cores/navigator/app_router.dart';
import 'package:akukom/cores/utils/utils.dart';
import 'package:akukom/features/auth/presentation/views/login_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PasswordResetSuccessfulView extends StatelessWidget {
  static const String routeName = '/password-reset-successful';
  const PasswordResetSuccessfulView({super.key});

  @override
  Widget build(BuildContext context) {
    return NormalScaffoldWidget(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const VSpace(82),
          const Svg(
            path: AppIcons.greenTick,
            svgType: SvgType.asset,
          ),
          const VSpace(24),
          TextWidget(
            AppStrings.passwordResetSuccessful,
            fontSize: sp(24),
            fontWeight: FontWeight.w600,
            textAlign: TextAlign.center,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: TextWidget(
              AppStrings.youHaveSuccessfully,
              fontSize: sp(14),
              fontWeight: FontWeight.w400,
              textAlign: TextAlign.center,
            ),
          ),
          const VSpace(32),
          Button(
            text: AppStrings.continueToLogin,
            onTap: () {
              AppRouter.instance.navigateToAndReplace(LoginView.routeName);
            },
          ),
        ],
      ),
    );
  }
}
