import 'package:akukom/cores/components/__components.dart';
import 'package:akukom/cores/constants/__constants.dart';
import 'package:akukom/cores/utils/utils.dart';
import 'package:akukom/features/family_group/__family_group.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ReceivedRequestView extends StatelessWidget {
  static const routeName = '/received-request-view';
  const ReceivedRequestView({super.key});

  @override
  Widget build(BuildContext context) {
    return const NormalScaffoldWidget(
      useSingleScroll: false,
      body: Column(
        children: [
          FamilyAppBar(
            title: AppStrings.requests,
          ),
          _RequestTileWidget(),
          _RequestTileWidget(),
        ],
      ),
    );
  }
}

class _RequestTileWidget extends StatelessWidget {
  const _RequestTileWidget();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 132.h,
      child: Row(
        children: [
          Container(
            height: 40.h,
            width: 40.w,
            decoration: const BoxDecoration(
              color: kcPrimaryColor,
              shape: BoxShape.circle,
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: kcWhite,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  const HSpace(16),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const TextWidget(
                          'John Doe',
                          fontSize: kfsMedium,
                          fontWeight: FontWeight.bold,
                        ),
                        const VSpace(8),
                        Row(
                          children: [
                            Expanded(
                              child: Button.withBorderLine(
                                height: 40.h,
                                text: AppStrings.decline,
                                textColor: kcBlack,
                                color: kcWhite,
                                borderColor: kcGrey400,
                                onTap: () {},
                              ),
                            ),
                            const HSpace(8),
                            Expanded(
                              child: Button(
                                height: 40.h,
                                text: AppStrings.accept,
                                onTap: () {},
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
