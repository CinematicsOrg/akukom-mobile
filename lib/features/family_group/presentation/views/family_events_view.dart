import 'package:akukom/cores/components/__components.dart';
import 'package:akukom/cores/constants/__constants.dart';
import 'package:akukom/cores/navigator/navigator.dart';
import 'package:akukom/cores/utils/utils.dart';
import 'package:akukom/features/family_group/__family_group.dart';
import 'package:flutter/material.dart';

class FamilyEventView extends StatelessWidget {
  static const routeName = '/family-event-view';
  const FamilyEventView({super.key});

  @override
  Widget build(BuildContext context) {
    return NormalScaffoldWidget(
      useSingleScroll: false,
      body: Column(
        children: [
          FamilyAppBar(
            title: AppStrings.events,
            actionPath: AppIcons.addSvg,
            onActionTap: goToCreateEvent,
          ),
          const VSpace(20),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextWidget(
                  AppStrings.noFamilyEventYet,
                  fontSize: sp(kfsSuperLarge),
                  fontWeight: FontWeight.bold,
                ),
                const VSpace(10),
                TextWidget(
                  AppStrings.newEventWillAppear,
                  fontSize: sp(kfsMedium),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  void goToCreateEvent() {
    AppRouter.instance.navigateTo(FamilyView.routeName);
  }
}
