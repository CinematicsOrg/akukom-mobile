import 'package:akukom/cores/components/components.dart';
import 'package:akukom/cores/constants/color.dart';
import 'package:akukom/cores/constants/extensions.dart';
import 'package:akukom/cores/constants/strings.dart';
import 'package:akukom/cores/navigator/app_router.dart';
import 'package:akukom/cores/utils/sizer_utils.dart';
import 'package:akukom/features/auth/__auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OpeningAccountScreen extends StatelessWidget {
  static const String routeName = '/opening-account';
  const OpeningAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return NormalScaffoldWidget(
      bg: kcGreyLight,
      useSingleScroll: false,
      useSafeArea: false,
      usePadding: false,
      body: Stack(
        children: [
          Positioned(
            bottom: 0,
            child: Container(
              height: sp(422),
              width: sp(390),
              color: kcWhite,
              child: const _OpeningAccountWidget(),
            ),
          ),
        ],
      ),
    );
  }
}

class _OpeningAccountWidget extends StatelessWidget {
  const _OpeningAccountWidget();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: Column(
        children: [
          verticalSpace(44),
          Align(
            alignment: Alignment.topLeft,
            child: TextWidget(
              AppStrings.appName.capitalizeFirstLetter,
              textStyle: GoogleFonts.poppins(
                fontSize: sp(26),
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          verticalSpace(16),
          SizedBox(
            child: Align(
              alignment: Alignment.topLeft,
              child: TextWidget(
                AppStrings.startJourney,
                fontSize: sp(15),
                textColor: kcBlack700,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          verticalSpace(45),
          Button(
            text: AppStrings.signIn,
            onTap: () {
              AppRouter.instance.navigateTo(
                LoginView.routeName,
              );
            },
          ),
          verticalSpace(14),
          Button.withBorderLine(
            text: AppStrings.createAccount,
            onTap: () {
              AppRouter.instance.navigateTo(
                CreateAccountView.routeName,
              );
            },
            color: kcWhite,
            textColor: kcBlack,
            borderColor: kcBlack,
          ),
          verticalSpace(25),
          TextWidget(
            AppStrings.byContinuing,
            fontSize: sp(15),
            textColor: kcBlack700,
            fontWeight: FontWeight.w400,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextWidget(
                AppStrings.termsAndConditions,
                fontSize: sp(15),
                textColor: kcPrimaryColor,
                fontWeight: FontWeight.w400,
                decoration: TextDecoration.underline,
              ),
              TextWidget(
                AppStrings.and,
                fontSize: sp(15),
                textColor: kcBlack700,
                fontWeight: FontWeight.w400,
              ),
              TextWidget(
                AppStrings.privacyPolicy,
                fontSize: sp(15),
                textColor: kcPrimaryColor,
                fontWeight: FontWeight.w400,
                decoration: TextDecoration.underline,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
