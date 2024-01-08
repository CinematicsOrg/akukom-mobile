import 'package:akukom/app/locator.dart';
import 'package:akukom/cores/components/__components.dart';
import 'package:akukom/cores/constants/__constants.dart';
import 'package:akukom/cores/shared_blocs/user_bloc/user_bloc.dart';
import 'package:akukom/cores/utils/sizer_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FamilyGroupScreen extends StatelessWidget {
  static const String routeName = '/family-group';
  const FamilyGroupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const NormalScaffoldWidget(
      useSingleScroll: false,
      body: Column(
        children: [
          VSpace(20),
          Expanded(
            child: Center(
              child: Svg(
                path: AppIcons.storyImage,
              ),
            ),
          ),
          Expanded(
            child: _FamilyGroupInfo(),
          ),
        ],
      ),
    );
  }
}

class _FamilyGroupInfo extends StatelessWidget {
  const _FamilyGroupInfo();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const VSpace(20),
        BlocBuilder<UserBloc, UserState>(
          bloc: getIt<UserBloc>(),
          builder: (context, state) {
            return TextWidget(
              'Hello ${getIt<UserBloc>().state.user?.firstName?.capitalizeFirstLetter}',
              fontSize: sp(
                kfsSuperLarge,
              ),
              fontWeight: FontWeight.bold,
            );
          },
        ),
        const VSpace(16),
        Padding(
          padding: EdgeInsets.only(right: 70.w),
          child: TextWidget(
            'No more missed fun family moments. You will not even have to do much.',
            fontSize: sp(
              kfsLarge,
            ),
            textColor: kcTextGrey,
          ),
        ),
        const VSpace(16),
        Padding(
          padding: EdgeInsets.only(right: 70.w),
          child: TextWidget(
            'Now we need some information about you. Are you ready to move on?',
            fontSize: sp(
              kfsLarge,
            ),
            textColor: kcTextGrey,
          ),
        ),
        const VSpace(
          60,
        ),
        Button(text: 'Next', onTap: () {})
      ],
    );
  }
}
