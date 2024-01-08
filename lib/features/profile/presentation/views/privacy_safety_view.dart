import 'package:akukom/cores/components/__components.dart';
import 'package:akukom/cores/constants/__constants.dart';
import 'package:akukom/cores/utils/sizer_utils.dart';
import 'package:akukom/features/profile/__profile.dart';
import 'package:flutter/material.dart';

class PrivacySafetyView extends StatelessWidget {
  static const String routeName = '/privacy-safety';
  const PrivacySafetyView({super.key});

  @override
  Widget build(BuildContext context) {
    return const NormalScaffoldWidget(
      body: Column(
        children: [
          ProfileAppBar(
            title: AppStrings.privacyAndSafety,
          ),
          VSpace(20),
          SettingsSwitchWidget(
            header: AppStrings.allowOthersToFindMe,
            content: AppStrings.ifYouDisable,
          ),
        ],
      ),
    );
  }
}
