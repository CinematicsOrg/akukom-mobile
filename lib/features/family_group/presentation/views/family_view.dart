import 'package:akukom/app/locator.dart';
import 'package:akukom/cores/components/__components.dart';
import 'package:akukom/cores/constants/__constants.dart';
import 'package:akukom/cores/navigator/navigator.dart';
import 'package:akukom/cores/usecase/usecase.dart';
import 'package:akukom/cores/utils/utils.dart';
import 'package:akukom/features/family_group/__family_group.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FamilyView extends StatelessWidget {
  static const routeName = '/family-view';
  const FamilyView({super.key});

  @override
  Widget build(BuildContext context) {
    return NormalScaffoldWidget(
      useSingleScroll: false,
      body: Column(
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              decoration: BoxDecoration(
                color: kcWhite,
                borderRadius: BorderRadius.circular(
                  8,
                ),
              ),
              child: PopupMenuButton<FamilyRequestType>(
                onSelected: goToDedicatedView,
                color: kcWhite,
                itemBuilder: (BuildContext context) {
                  return FamilyRequestType.values.map((e) {
                    return PopupMenuItem<FamilyRequestType>(
                      value: e,
                      child: Container(
                        padding: const EdgeInsets.all(
                          10,
                        ), // Add padding for a smaller size
                        decoration: BoxDecoration(
                          color: Colors.white, // Set background color to white
                          borderRadius: BorderRadius.circular(
                            8,
                          ), // Set border radius for rounded corners
                        ),
                        child: Row(
                          children: [
                            Svg(
                              path: e.icon,
                              color: kcGrey600,
                            ),
                            const HSpace(10),
                            TextWidget(
                              e.label,
                              fontSize: kfsMedium,
                            ),
                          ],
                        ),
                      ),
                    );
                  }).toList();
                },
              ),
            ),
          ),
          BlocBuilder<GetUserFamilyBloc, GetUserFamilyState>(
            bloc: getIt<GetUserFamilyBloc>()
              ..add(
                const GetUserFamilyUserEvent(
                  param: NoParams(),
                ),
              ),
            builder: (context, state) {
              if (state.status == GetUserFamilyStatus.loading) {
                return const Expanded(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              }
              if (state.status == GetUserFamilyStatus.success) {
                if (state.familyData?.isEmpty ?? true) {
                  return const Expanded(
                    child: _EmptyFamilyWidget(),
                  );
                }
                return Expanded(
                  child: ListView.builder(
                    itemCount: state.familyData?.length ?? 0,
                    itemBuilder: (context, index) {
                      final data = state.familyData?[index];
                      return _FamilyCardWidget(
                        familyDataEntity: data,
                      );
                    },
                  ),
                );
              }
              return const Expanded(
                child: _EmptyFamilyWidget(),
              );
            },
          ),
        ],
      ),
    );
  }

  void goToDedicatedView(FamilyRequestType type) {
    switch (type) {
      case FamilyRequestType.sent:
        AppRouter.instance.navigateTo(SendRequestView.routeName);
        break;
      case FamilyRequestType.received:
        AppRouter.instance.navigateTo(ReceivedRequestView.routeName);
        break;
      case FamilyRequestType.addFamily:
        AppRouter.instance.navigateTo(FamilyGroupScreen.routeName);
        break;
      default:
    }
  }
}

class _EmptyFamilyWidget extends StatelessWidget {
  const _EmptyFamilyWidget();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Svg(path: AppIcons.emptyStateSvg),
        const VSpace(20),
        const TextWidget(
          AppStrings.noFamilyEventYet,
          fontSize: kfsSuperLarge,
          fontWeight: FontWeight.w600,
        ),
        const VSpace(10),
        const TextWidget(
          AppStrings.wouldYouLikeToCreate,
          fontSize: kfsMedium,
          fontWeight: FontWeight.w400,
        ),
        const VSpace(20),
        Button(
          width: 150,
          text: AppStrings.createGroup,
          onTap: goToCreateEvent,
        )
      ],
    );
  }

  void goToCreateEvent() {
    AppRouter.instance.navigateTo(FamilyGroupScreen.routeName);
  }
}

class _FamilyCardWidget extends StatelessWidget {
  final FamilyDataEntity? familyDataEntity;
  const _FamilyCardWidget({
    Key? key,
    required this.familyDataEntity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 16.h),
      child: InkWell(
        onTap: goToFamilyDetailsView,
        child: SizedBox(
          height: 41.h,
          child: Row(
            children: [
              Container(
                height: 40.h,
                width: 40.w,
                decoration: const BoxDecoration(
                  color: kcPrimaryColor,
                  shape: BoxShape.circle,
                ),
                child: ClipOval(
                  child: Image.network(
                    familyDataEntity?.image ?? AppStrings.na,
                    height: 40.h,
                    width: 40.w,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const HSpace(16),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextWidget(
                      familyDataEntity?.name ?? AppStrings.na,
                      fontSize: kfsMedium,
                      fontWeight: FontWeight.bold,
                    ),
                    const VSpace(4),
                    TextWidget(
                      familyDataEntity?.description ?? AppStrings.na,
                      fontSize: kfsTiny,
                      textColor: kcBlack700,
                    ),
                  ],
                ),
              ),
              const HSpace(16),
              const Icon(
                Icons.info_outline,
                color: kcGrey600,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void goToFamilyDetailsView() {
    AppRouter.instance.navigateTo(
      FamilyDetailsView.routeName,
      arguments: familyDataEntity,
    );
  }
}
