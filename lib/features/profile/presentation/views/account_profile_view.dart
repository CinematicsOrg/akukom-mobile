import 'package:akukom/cores/components/__components.dart';
import 'package:akukom/cores/constants/__constants.dart';
import 'package:akukom/cores/navigator/app_router.dart';
import 'package:akukom/cores/utils/utils.dart';
import 'package:akukom/features/profile/__profile.dart';
import 'package:flutter/material.dart';

class AccountProfileView extends StatelessWidget {
  static const String routeName = '/account-profile';
  const AccountProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return NormalScaffoldWidget(
      body: Column(
        children: [
          const ProfileAppBar(
            title: AppStrings.yourAccount,
          ),
          const VSpace(20),
          ListView.builder(
            itemCount: AccountSettingsList.values.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              final item = AccountSettingsList.values[index];
              return SettingsTileWidget(
                iconPath: item.icon,
                title: item.label,
                onTap: () => onTap(item),
              );
            },
          ),
        ],
      ),
    );
  }

  void onTap(AccountSettingsList item) {
    switch (item) {
      case AccountSettingsList.accountInfo:
        AppRouter.instance.navigateTo(YourAccountInfoView.routeName);
        break;
      case AccountSettingsList.changePassword:
        AppRouter.instance.navigateTo(ProfileChangePasswordView.routeName);
        break;
      case AccountSettingsList.contactSync:
        AppRouter.instance.navigateTo(ContactSyncingView.routeName);
        break;
      case AccountSettingsList.deactivateAccount:
        // AppRouter.instance.navigateTo(ChangeThemeView.routeName);
        break;
      default:
        break;
    }
  }
}
