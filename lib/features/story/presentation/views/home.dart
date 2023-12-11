import 'package:akukom/cores/components/__components.dart';
import 'package:akukom/cores/constants/__constants.dart';
import 'package:akukom/cores/utils/utils.dart';
import 'package:akukom/features/story/__story.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return NormalScaffoldWidget(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const VSpace(10),
          const HomeStoryHeaderWidget(),
          const VSpace(4),
          TextWidget(
            'Ready to learn about Africa today?',
            fontSize: sp(14),
            textColor: kcGrey800,
          ),
          const VSpace(84),
          const _HomeStoryList(),
          const VSpace(38),
          const _EventWidget(),
        ],
      ),
    );
  }
}

class _HomeStoryList extends StatelessWidget {
  const _HomeStoryList();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 105.h,
      child: ListView.builder(
        itemCount: 7,
        padding: EdgeInsets.zero,
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemBuilder: (context, index) => Padding(
          padding: EdgeInsets.only(
            right: 10.w,
          ),
          child: Container(
            height: 102.h,
            width: 101.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                5.r,
              ),
              color: kcGreyLight,
            ),
            child: Visibility(
              visible: index == 0,
              child: Icon(
                Icons.add,
                size: 40.h,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _EventWidget extends StatelessWidget {
  const _EventWidget();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextWidget(
          'Events',
          fontSize: sp(14),
          fontWeight: FontWeight.w600,
        ),
        const VSpace(12),
        Container(
          height: 101.h,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              5.r,
            ),
            color: kcGreyLight
          ),
        ),
      ],
    );
  }
}
