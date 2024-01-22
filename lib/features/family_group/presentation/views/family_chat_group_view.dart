import 'package:akukom/cores/components/__components.dart';
import 'package:akukom/cores/constants/__constants.dart';
import 'package:akukom/cores/navigator/navigator.dart';
import 'package:akukom/cores/utils/utils.dart';
import 'package:akukom/features/family_group/__family_group.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FamilyGroupChatView extends StatelessWidget {
  static const String routeName = '/family-group-chat';
  const FamilyGroupChatView({super.key});

  @override
  Widget build(BuildContext context) {
    return NormalScaffoldWidget(
      useSingleScroll: false,
      body: Column(
        children: [
          const VSpace(20),
          SizedBox(
            height: 70.h,
            child: Row(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(
                    Icons.arrow_back_ios,
                    color: kcBlack,
                  ),
                ),
                const HSpace(20),
                const Svg(
                  path: AppIcons.doubleCircleSvg,
                ),
                const HSpace(20),
                TextWidget(
                  'Family Group',
                  fontSize: sp(kfsSuperLarge),
                  fontWeight: FontWeight.bold,
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () =>
                      AppRouter.instance.navigateTo(FamilyEventView.routeName),
                  child: const Svg(
                    path: AppIcons.calendarClockSvg,
                    color: kcPrimaryColor,
                  ),
                ),
              ],
            ),
          ),
          const Expanded(
            child: _ChatTabView(),
          )
        ],
      ),
    );
  }
}

class _ChatTabView extends StatelessWidget {
  const _ChatTabView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2, // Number of tabs
      child: Column(
        children: <Widget>[
          TabBar(
            tabs: const [
              Tab(text: 'Conversations'),
              Tab(text: 'Media'),
            ],
            labelPadding: EdgeInsets.zero,
            labelColor: Theme.of(context).primaryColor,
            unselectedLabelColor: Colors.black54,
            indicatorSize: TabBarIndicatorSize.label,
          ),
          Expanded(
            child: TabBarView(
              children: [
                // Replace with your actual widgets
                Container(),
                Container(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
