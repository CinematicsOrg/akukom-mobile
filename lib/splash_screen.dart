import 'package:akukom/cores/components/__components.dart';
import 'package:akukom/cores/utils/sizer_utils.dart';
import 'package:akukom/opening_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'cores/constants/__constants.dart';
import 'cores/navigator/app_router.dart';

class SplashScreen extends StatefulWidget {
  static const String routeName = '/';

  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3), () {
      AppRouter.instance.navigateToAndReplace(OpeningScreen.routeName);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return NormalScaffoldWidget(
      bg: kcPrimaryColor,
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(AppImages.logo),
                  Text(
                    AppStrings.appName,
                    style: GoogleFonts.sora(
                      fontSize: sp(36),
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
          TextWidget(
            AppStrings.splashScreenHeaderText,
            fontSize: sp(kfsLarge),
            textColor: kcWhite,
            fontWeight: FontWeight.w500,
            textAlign: TextAlign.center,
          ),
          const VSpace(
            14,
          ),
          TextWidget(
            AppStrings.splashScreenSubText,
            fontSize: sp(kfsMedium),
            textColor: const Color(0xFFD4D4D4),
            textAlign: TextAlign.center,
          ),
          const VSpace(24)
        ],
      ),
      usePadding: true,
      useSingleScroll: false,
    );
  }
}
