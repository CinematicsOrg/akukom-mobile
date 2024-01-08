import 'package:akukom/cores/components/__components.dart';
import 'package:akukom/cores/constants/__constants.dart';
import 'package:akukom/cores/utils/utils.dart';
import 'package:akukom/features/profile/__profile.dart';
import 'package:flutter/material.dart';

class ContactSyncingView extends StatelessWidget {
  static const String routeName = '/contact-syncing';
  const ContactSyncingView({super.key});

  @override
  Widget build(BuildContext context) {
    return const NormalScaffoldWidget(
      body: Column(
        children: [
          ProfileAppBar(
            title: AppStrings.contactSyncing,
          ),
          VSpace(20),
          SettingsSwitchWidget(
            header: AppStrings.connectContact,
            content: AppStrings.weWillSyncContacts,
          ),
        ],
      ),
    );
  }
}
