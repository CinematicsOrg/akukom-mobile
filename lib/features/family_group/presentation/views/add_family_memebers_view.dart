import 'package:akukom/app/locator.dart';
import 'package:akukom/cores/components/__components.dart';
import 'package:akukom/cores/constants/__constants.dart';
import 'package:akukom/cores/utils/utils.dart';
import 'package:akukom/features/family_group/__family_group.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddFamilyMembersView extends StatelessWidget {
  static const String routeName = '/add-family-members';
  const AddFamilyMembersView({super.key});

  @override
  Widget build(BuildContext context) {
    return NormalScaffoldWidget(
      useSingleScroll: false,
      bg: kcBlack,
      body: Column(
        children: [
          const VSpace(20),
          Expanded(
            child: Column(
              children: [
                const VSpace(20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Spacer(),
                    const Expanded(
                      child: SizedBox(),
                    ),
                    TextWidget(
                      AppStrings.addFamilyMembers,
                      fontSize: sp(kfsMedium),
                      fontWeight: FontWeight.bold,
                      textColor: kcWhite,
                    ),
                    const Spacer(),
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: TextWidget(
                          AppStrings.done,
                          fontSize: sp(kfsMedium),
                          fontWeight: FontWeight.bold,
                          textColor: kcPrimaryColor,
                        ),
                      ),
                    ),
                  ],
                ),
                const _AddFamilyTags(),
                const VSpace(20),
                BlocBuilder<GetUserListBloc, GetUserListState>(
                  bloc: getIt<GetUserListBloc>()
                    ..add(
                      GetUserListUserEvent(
                        param: GetUsersParam(
                          search: 'a',
                          refresh: true,
                        ),
                      ),
                    ),
                  builder: (context, state) {
                    if (state.status == GetUserListStatus.loading) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (state.status == GetUserListStatus.success) {
                      return Expanded(
                        child: ListView.builder(
                          itemCount: state.usersList?.length,
                          shrinkWrap: true,
                          // physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            final user = state.usersList?[index];
                            return _FamilyUserItem(
                              user: user!,
                            );
                          },
                        ),
                      );
                    }
                    return Container();
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _AddFamilyTags extends StatelessWidget {
  const _AddFamilyTags();

  @override
  Widget build(BuildContext context) {
    final AddFamilyMemberListCubit addFamilyMemberListCubit =
        getIt<AddFamilyMemberListCubit>();
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const VSpace(40),
        Row(
          children: [
            TextWidget(
              AppStrings.tag,
              fontSize: sp(kfsMedium),
              fontWeight: FontWeight.bold,
              textColor: kcWhite,
            ),
            const HSpace(10),
            BlocBuilder<AddFamilyMemberListCubit, AddFamilyMemberListState>(
              bloc: addFamilyMemberListCubit,
              builder: (context, state) {
                return Expanded(
                    child: Wrap(
                  direction: Axis.horizontal,
                  spacing: 8.0, // Space between each text container
                  runSpacing: 8.0, // Space between the lines
                  children: <Widget>[
                    if (state.familyMembers != null)
                      ...state.familyMembers!
                          .map(
                            (e) => _Tags(
                              tagName: e,
                            ),
                          )
                          .toList(),
                  ],
                ));
              },
            )
          ],
        ),
        const VSpace(10),
        const Divider(
          color: kcGrey800,
        ),
      ],
    );
  }
}

class _Tags extends StatelessWidget {
  final UsersListDocEntity tagName;
  const _Tags({
    required this.tagName,
  });

  @override
  Widget build(BuildContext context) {
    final name = tagName.firstName ?? AppStrings.na;
    return Container(
      padding: const EdgeInsets.all(8.0), // Padding inside the container
      decoration: BoxDecoration(
        border: Border.all(color: kcGrey800), // Border color
        borderRadius: BorderRadius.circular(20.0), // Border radius
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: TextWidget(
          name,
          fontSize: sp(kfsMedium),
          fontWeight: FontWeight.bold,
          textColor: kcWhite,
        ),
      ),
    );
  }
}

class _FamilyUserItem extends StatelessWidget {
  final UsersListDocEntity user;
  const _FamilyUserItem({
    required this.user,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => addToTagList(user),
      child: SizedBox(
        height: 50.h,
        child: Row(
          children: [
            // const Svg(
            //   path: 'https://www.flaticon.com/svg/vstati',
            //   svgType: SvgType.network,
            // ),

            Container(
              height: 40.h,
              width: 40.w,
              decoration: BoxDecoration(
                color: kcPrimaryColor.withOpacity(0.5),
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            const HSpace(10),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextWidget(
                  '${user.firstName ?? AppStrings.na} ${user.lastName ?? AppStrings.na}',
                  fontSize: sp(kfsMedium),
                  fontWeight: FontWeight.bold,
                  textColor: kcWhite,
                ),
                TextWidget(
                  user.email ?? AppStrings.na,
                  fontSize: sp(kfsTiny),
                  textColor: kcWhite,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void addToTagList(UsersListDocEntity user) {
    final AddFamilyMemberListCubit addFamilyMemberListCubit =
        getIt<AddFamilyMemberListCubit>();
    addFamilyMemberListCubit.addFamilyMember(user);
  }
}
