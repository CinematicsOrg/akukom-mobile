import 'package:akukom/app/locator.dart';
import 'package:akukom/cores/components/__components.dart';
import 'package:akukom/cores/components/toast.dart';
import 'package:akukom/cores/constants/__constants.dart';
import 'package:akukom/cores/navigator/navigator.dart';
import 'package:akukom/cores/utils/sizer_utils.dart';
import 'package:akukom/features/family_group/__family_group.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FamilyDetailsJoinView extends StatelessWidget {
  static const routeName = '/family-details-join-view';
  const FamilyDetailsJoinView({
    super.key,
    required this.familyDataEntity,
  });

  final FamilyDataEntity? familyDataEntity;

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
                familyDataEntity?.image ?? AppStrings.defaultImage,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const VSpace(16),
          TextWidget(
            familyDataEntity?.name ?? AppStrings.na,
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
              familyDataEntity?.description ?? AppStrings.na,
              fontSize: kfsMedium,
              fontWeight: FontWeight.w500,
              textColor: kcBlack700,
            ),
          ),
          const VSpace(50),
          _Button(
            id: familyDataEntity?.id ?? AppStrings.na,
          ),
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

class _Button extends StatefulWidget {
  final String id;
  const _Button({
    Key? key,
    required this.id,
  }) : super(key: key);

  @override
  State<_Button> createState() => __ButtonState();
}

class __ButtonState extends State<_Button> {
  final RequestsToJoinFamilyBloc _requestsToJoinFamilyBloc =
      getIt<RequestsToJoinFamilyBloc>();

  @override
  void dispose() {
    _requestsToJoinFamilyBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RequestsToJoinFamilyBloc, RequestsToJoinFamilyState>(
      bloc: _requestsToJoinFamilyBloc,
      listener: _requestToJoinListener,
      builder: (context, state) {
        if (state.status == RequestsToJoinFamilyStatus.loading) {
          return const Button.loading();
        }
        return Button(
          text: 'Ask to join',
          onTap: _requestToJoin,
        );
      },
    );
  }
}

extension _ButtonListener on __ButtonState {
  void _requestToJoinListener(
      BuildContext context, RequestsToJoinFamilyState state) {
    if (state.status == RequestsToJoinFamilyStatus.success) {
      Toast.showSuccess(state.message ?? AppStrings.na);
      AppRouter.instance.navigateToADashboard();
    } else if (state.status == RequestsToJoinFamilyStatus.failure) {
      Toast.showError(state.message ?? AppStrings.na);
    }
  }

  void _requestToJoin() {
    _requestsToJoinFamilyBloc.add(
      RequestsToJoinFamilyUserEvent(
        param: RequestToJoinFamilyParam(
          familyId: widget.id,
        ),
      ),
    );
  }
}
