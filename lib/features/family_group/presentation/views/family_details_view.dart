import 'package:akukom/cores/components/__components.dart';
import 'package:akukom/cores/constants/__constants.dart';
import 'package:akukom/cores/utils/utils.dart';
import 'package:akukom/features/family_group/__family_group.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FamilyDetailsView extends StatefulWidget {
  static const routeName = '/family-details-view';
  const FamilyDetailsView({
    super.key,
    this.familyDataEntity,
  });

  final FamilyDataEntity? familyDataEntity;

  @override
  State<FamilyDetailsView> createState() => _FamilyDetailsViewState();
}

class _FamilyDetailsViewState extends State<FamilyDetailsView> {
  @override
  Widget build(BuildContext context) {
    return NormalScaffoldWidget(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          const VSpace(70),
          SizedBox(
            width: 174.w,
            height: 174.w,
            child: ClipOval(
              child: Image.network(
                widget.familyDataEntity?.image ?? AppStrings.defaultImage,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const VSpace(16),
          TextWidget(
            widget.familyDataEntity?.name ?? AppStrings.na,
            fontSize: kfsMedium,
            fontWeight: FontWeight.bold,
          ),
          const VSpace(10),
          Container(
            width: 83.w,
            height: 33.h,
            decoration: BoxDecoration(
              color: kcBlack,
              borderRadius: BorderRadius.circular(820.r),
            ),
            child: const Center(
              child: TextWidget(
                '8 Posts',
                fontSize: kfsMedium,
                textColor: kcWhite,
                fontWeight: FontWeight.w500,
                textAlign: TextAlign.center,
              ),
            ),
          ),
          const VSpace(16),
          Divider(
            color: kcBlack.withOpacity(0.1),
            thickness: 1,
          ),
          const VSpace(16),
          const _MembersList(),
          Divider(
            color: kcBlack.withOpacity(0.1),
            thickness: 1,
          ),
          const VSpace(16),
          const Align(
            alignment: Alignment.centerLeft,
            child: TextWidget(
              'Description',
              fontSize: kfsLarge,
              fontWeight: FontWeight.w500,
              textColor: kcPrimaryColor,
            ),
          ),
          const VSpace(16),
          SizedBox(
            width: 390.w,
            child: TextWidget(
              widget.familyDataEntity?.description ?? AppStrings.na,
              fontSize: kfsMedium,
              fontWeight: FontWeight.w500,
              textColor: kcBlack700,
            ),
          ),
          const VSpace(50),
        ],
      ),
    );
  }
}

class _MembersList extends StatelessWidget {
  const _MembersList();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Row(
          children: [
            TextWidget(
              'Members',
              fontSize: kfsMedium,
              fontWeight: FontWeight.w500,
            ),
            Spacer(),
            TextWidget(
              'See All',
              fontSize: kfsTiny,
              fontWeight: FontWeight.w500,
              textColor: kcPrimaryColor,
            ),
          ],
        ),
        const VSpace(16),
        SizedBox(
          width: 390.w,
          height: 70.h,
          child: ListView.separated(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 10,
            itemBuilder: (context, index) {
              return const _MemberWidget();
            },
            separatorBuilder: (context, index) {
              return const HSpace(16);
            },
          ),
        ),
      ],
    );
  }
}

class _MemberWidget extends StatelessWidget {
  const _MemberWidget();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 40.h,
          width: 40.w,
          child: ClipOval(
            child: Image.network(
              AppStrings.defaultImage,
              fit: BoxFit.cover,
            ),
          ),
        ),
        const VSpace(8),
        const TextWidget(
          'Member Name',
          fontSize: kfsTiny,
          fontWeight: FontWeight.w500,
        ),
      ],
    );
  }
}
