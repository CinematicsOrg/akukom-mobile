import 'package:akukom/cores/constants/__constants.dart';
import 'package:akukom/cores/utils/utils.dart';
import 'package:akukom/features/profile/__profile.dart';
import 'package:flutter/material.dart';

import '../../../../cores/components/custom_normal_scaffold_widget.dart';

class NotificationPrefrencesView extends StatelessWidget {
  static const String routeName = '/notification-prefrences';
  const NotificationPrefrencesView({super.key});

  @override
  Widget build(BuildContext context) {
    return const NormalScaffoldWidget(
      body: Column(
        children: [
          ProfileAppBar(
            title: AppStrings.notificationPreferences,
          ),
          VSpace(20),
          SettingsSwitchWidget(header: AppStrings.emailNotifications),
          SettingsSwitchWidget(header: AppStrings.activties),
        ],
      ),
    );
  }
}
