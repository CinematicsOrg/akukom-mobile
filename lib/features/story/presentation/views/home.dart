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
          const VSpace(25),
          const _PopularViewWidget(),
          const VSpace(25),
          const _RecommendedListWidget(),
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
              color: kcGreyLight),
        ),
      ],
    );
  }
}

class _PopularViewWidget extends StatelessWidget {
  const _PopularViewWidget();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextWidget(
                'Popular',
                fontSize: sp(14),
                fontWeight: FontWeight.w600,
              ),
              const HSpace(10),
              TextWidget(
                'See all',
                fontSize: sp(14),
                fontWeight: FontWeight.w600,
                textColor: kcPrimaryColor,
              ),
            ],
          ),
          const VSpace(12),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 101.h,
                width: 122.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    5.r,
                  ),
                  color: kcGrey600,
                ),
              ),
              const HSpace(10),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 212.w,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 167.w,
                          child: TextWidget(
                            'Lorem Ipsum enim ad minimamet ',
                            fontSize: sp(14),
                            textAlign: TextAlign.start,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const Spacer(),
                        Icon(
                          Icons.favorite_border_rounded,
                          size: 20.h,
                        ),
                      ],
                    ),
                  ),
                  const VSpace(7),
                  SizedBox(
                    width: 212.w,
                    child: const TextWidget(
                      'or incididunt ut labore et dolore magna aliqua. Ut enim ad min veniam.Lorem ipsum dolor sit amet, consectetur...,',
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _RecommendedListWidget extends StatelessWidget {
  const _RecommendedListWidget();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            TextWidget(
              'Recommended',
              fontSize: sp(14),
              fontWeight: FontWeight.w600,
            ),
            const Spacer(),
            TextWidget(
              'See all',
              fontSize: sp(14),
              fontWeight: FontWeight.w600,
              textColor: kcPrimaryColor,
            ),
          ],
        ),
        const VSpace(11),
        // recoomendation widget in a list
        SizedBox(
          height: 230.h,
          child: ListView.builder(
            itemCount: 3,
            padding: EdgeInsets.zero,
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemBuilder: (context, index) => Padding(
              padding: EdgeInsets.only(
                right: 10.w,
              ),
              child: const _RecommedationWidget(),
            ),
          ),
        ),
      ],
    );
  }
}

class _RecommedationWidget extends StatelessWidget {
  const _RecommedationWidget();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 230.h,
      width: 204.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          10.r,
        ),
        boxShadow: [
          BoxShadow(
            color: kcGreyLight,
            blurRadius: 10.r,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            height: 105.h,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(
                  10.r,
                ),
                topRight: Radius.circular(
                  10.r,
                ),
              ),
              color: kcGrey800,
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(
                    10.r,
                  ),
                  bottomRight: Radius.circular(
                    10.r,
                  ),
                ),
                color: kcWhite,
              ),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    Row(
                      children: [
                        TextWidget(
                          'Lorem Ipsum ',
                          fontSize: sp(14),
                          textAlign: TextAlign.start,
                          fontWeight: FontWeight.w600,
                        ),
                        const Spacer(),
                        const Icon(
                          Icons.keyboard_arrow_down_outlined,
                        )
                      ],
                    ),
                    const VSpace(7),
                    const TextWidget(
                      'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s',
                      overflow: TextOverflow.ellipsis,
                      maxLines: 4,
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
