import 'package:akukom/cores/components/__components.dart';
import 'package:akukom/cores/constants/__constants.dart';
import 'package:akukom/cores/navigator/navigator.dart';
import 'package:akukom/cores/utils/utils.dart';
import 'package:akukom/features/family_group/__family_group.dart';

import 'package:flutter/material.dart';

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
          const Expanded(
            child: _EmptyFamilyWidget(),
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
