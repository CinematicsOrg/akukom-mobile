import 'package:akukom/app/locator.dart';
import 'package:akukom/cores/components/__components.dart';
import 'package:akukom/cores/constants/__constants.dart';
import 'package:akukom/cores/navigator/app_router.dart';
import 'package:akukom/cores/utils/utils.dart';
import 'package:akukom/features/auth/__auth.dart';
import 'package:flutter/material.dart';

class VerificationSuccessfulView extends StatelessWidget {
  static const String routeName = '/verification-successful';
  const VerificationSuccessfulView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final SignupCubit signupCubit = getIt<SignupCubit>();
    final email = signupCubit.state.email.value;
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
                    email,
                    fontSize: sp(23),
                    fontWeight: FontWeight.w600,
                    textAlign: TextAlign.center,
                    textColor: kcPrimaryColor,
                  ),
                  vSpace(16),
                  TextWidget(
                    AppStrings.letSetYou,
                    fontSize: sp(16),
                    fontWeight: FontWeight.w400,
                    textAlign: TextAlign.center,
                    textColor: kcBlack700,
                  ),
                  vSpace(96),
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
