import 'package:akukom/cores/components/components.dart';
import 'package:akukom/cores/constants/__constants.dart';
import 'package:akukom/cores/navigator/app_router.dart';
import 'package:akukom/cores/utils/utils.dart';
import 'package:akukom/features/auth/presentation/views/__views.dart';
import 'package:flutter/material.dart';

class VerificationSuccessfulView extends StatelessWidget {
  static const String routeName = '/verification-successful';
  const VerificationSuccessfulView({super.key});

  @override
  Widget build(BuildContext context) {
    return NormalScaffoldWidget(
      useSingleScroll: false,
      body: Column(
        children: [
          const Expanded(
            child: Center(
              child: SizedBox(
                height: 152,
                width: 226,
                child: ImageWidget(
                  imageTypes: ImageTypes.asset,
                  imageUrl: AppImages.bigGreenTick,
                ),
              ),
            ),
          ),
          Expanded(
            child: SizedBox(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextWidget(
                    AppStrings.gladToHaveYou,
                    fontSize: sp(23),
                    fontWeight: FontWeight.w600,
                    textAlign: TextAlign.center,
                  ),
                  TextWidget(
                    'Name',
                    fontSize: sp(23),
                    fontWeight: FontWeight.w600,
                    textAlign: TextAlign.center,
                    textColor: kcPrimaryColor,
                  ),
                  verticalSpace(16),
                  TextWidget(
                    AppStrings.letSetYou,
                    fontSize: sp(16),
                    fontWeight: FontWeight.w400,
                    textAlign: TextAlign.center,
                    textColor: kcBlack700,
                  ),
                  verticalSpace(96),
                  Button(
                    text: AppStrings.home,
                    // onTap: () => AppRouter.instance.goToAndRemoveUntil(
                    //   HomeView.routeName,
                    //   predicate: (route) => false,
                    // ),
                    onTap: () => AppRouter.instance.navigateTo(
                      LoginView.routeName,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
