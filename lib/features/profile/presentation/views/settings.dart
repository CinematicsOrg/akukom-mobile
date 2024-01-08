import 'package:akukom/cores/components/__components.dart';
import 'package:akukom/cores/constants/__constants.dart';
import 'package:akukom/cores/navigator/navigator.dart';
import 'package:akukom/cores/utils/utils.dart';
import 'package:akukom/features/profile/__profile.dart';
import 'package:akukom/features/profile/presentation/views/privacy_safety_view.dart';
import 'package:flutter/material.dart';

class SettingView extends StatelessWidget {
  static const String routeName = '/settings';

  const SettingView({super.key});

  @override
  Widget build(BuildContext context) {
    return NormalScaffoldWidget(
      body: Column(
        children: [
          ProfileAppBar(
            title: 'Settings',
            onActionTap: () {},
          ),
          const VSpace(30),
          ListView.builder(
            itemCount: ProfileSettingsList.values.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              final item = ProfileSettingsList.values[index];
              return SettingsTileWidget(
                iconPath: item.icon,
                title: item.label,
                textColor:
                    ProfileSettingsList.logout == item ? kcErrorColor : null,
                iconColor:
                    ProfileSettingsList.logout == item ? kcErrorColor : null,
                onTap: () => onTap(item),
              );
            },
          ),
          const VSpace(60),
          TextWidget(
            'App Version',
            fontSize: sp(18),
            fontWeight: FontWeight.w500,
            textColor: Theme.of(context).textTheme.titleMedium!.color,
          ),
          const VSpace(5),
          TextWidget(
            '8.25.0 (22163)',
            textAlign: TextAlign.center,
            fontSize: sp(16),
            fontWeight: FontWeight.w400,
            textColor: Theme.of(context).textTheme.titleMedium!.color,
          ),
        ],
      ),
    );
  }

  void onTap(ProfileSettingsList item) {
    switch (item) {
      case ProfileSettingsList.account:
        AppRouter.instance.navigateTo(AccountProfileView.routeName);
        break;
      case ProfileSettingsList.notificationPreferences:
        AppRouter.instance.navigateTo(NotificationPrefrencesView.routeName);
        break;
      case ProfileSettingsList.privacyAndSafety:
        AppRouter.instance.navigateTo(PrivacySafetyView.routeName);
        break;
      case ProfileSettingsList.logout:
        AppRouter.instance.logOut();
        break;
    }
  }
}
