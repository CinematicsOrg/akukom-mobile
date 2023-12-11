import 'package:akukom/cores/components/__components.dart';
import 'package:akukom/cores/constants/__constants.dart';
import 'package:akukom/cores/utils/utils.dart';
import 'package:flutter/material.dart';

class NotificationsView extends StatelessWidget {
  static const String routeName = '/notification';

  const NotificationsView({super.key});

  @override
  Widget build(BuildContext context) {
    return NormalScaffoldWidget(
      useSingleScroll: false,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const VSpace(20),
          TextWidget.bold(
            'Notifications',
            fontSize: sp(24),
            textColor: Theme.of(context).textTheme.titleMedium!.color,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                const Svg(
                  path: AppIcons.noNotificationSvg,
                ),
                const VSpace(16),
                TextWidget(
                  'No notifications yet',
                  fontSize: sp(24),
                  fontWeight: FontWeight.w600,
                  textColor: Theme.of(context).textTheme.titleMedium!.color,
                ),
                const VSpace(5),
                TextWidget(
                  'You’ll get updates  on new and shared  posts, when people interact with your posts, and more. ',
                  textAlign: TextAlign.center,
                  fontSize: sp(16),
                  fontWeight: FontWeight.w400,
                  textColor: Theme.of(context).textTheme.titleMedium!.color,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
