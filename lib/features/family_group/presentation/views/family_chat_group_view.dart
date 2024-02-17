import 'package:akukom/cores/components/__components.dart';
import 'package:akukom/cores/constants/__constants.dart';
import 'package:akukom/cores/navigator/navigator.dart';
import 'package:akukom/cores/utils/utils.dart';
import 'package:akukom/features/family_group/__family_group.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FamilyGroupChatView extends StatelessWidget {
  static const String routeName = '/family-group-chat';

  const FamilyGroupChatView({
    super.key,
    required this.familyDataEntity,
  });

  final FamilyDataEntity? familyDataEntity;

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
                familyDataEntity?.image != null
                    ? ClipRRect(
                        borderRadius: BorderRadius.circular(25.r),
                        child: Hero(
                          tag: familyDataEntity!.image!,
                          child: ImageWidget(
                            imageUrl: familyDataEntity!.image!,
                            imageTypes: ImageTypes.network,
                            height: 50.h,
                            width: 50.w,
                          ),
                        ),
                      )
                    : const Svg(
                        path: AppIcons.doubleCircleSvg,
                      ),
                const HSpace(20),
                Hero(
                  tag: familyDataEntity!.name!,
                  child: TextWidget(
                    familyDataEntity?.name
                            .toString()
                            .capitalizeFirstOfEachWord ??
                        AppStrings.na,
                    fontSize: sp(kfsSuperLarge),
                    fontWeight: FontWeight.bold,
                  ),
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
