import 'package:akukom/cores/components/custom_text_widget.dart';
import 'package:akukom/cores/constants/__constants.dart';
import 'package:akukom/cores/navigator/app_router.dart';
import 'package:akukom/cores/utils/utils.dart';
import 'package:akukom/features/story/__story.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeStoryHeaderWidget extends StatelessWidget {
  const HomeStoryHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextWidget.bold(
          'Hi Irede',
          fontSize: sp(24),
          textColor: Theme.of(context).textTheme.titleMedium!.color,
        ),
        InkWell(
          onTap: () =>
              AppRouter.instance.navigateTo(NotificationsView.routeName),
          child: SvgPicture.asset(
            AppIcons.notificationSvg,
          ),
        ),
      ],
    );
  }
}
