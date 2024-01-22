import 'package:akukom/app/locator.dart';
import 'package:akukom/cores/components/__components.dart';
import 'package:akukom/cores/constants/__constants.dart';
import 'package:akukom/cores/navigator/app_router.dart';
import 'package:akukom/cores/shared_blocs/__shared_bloc.dart';
import 'package:akukom/cores/utils/utils.dart';
import 'package:akukom/features/profile/__profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:share_plus/share_plus.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return NormalScaffoldWidget(
      useSingleScroll: false,
      body: Column(
        children: [
          ProfileAppBar(
            title: AppStrings.profile,
            automaticallyImplyLeading: false,
            actionPath: AppIcons.settingsSvg,
            onActionTap: () {
              AppRouter.instance.navigateTo(SettingView.routeName);
            },
          ),
          const VSpace(20),
          const _ProfileInfo(),
          const VSpace(20),
          const Expanded(
            child: _ProfileTabView(),
          ),
        ],
      ),
    );
  }
}

class _ProfileInfo extends StatelessWidget {
  const _ProfileInfo();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            BlocBuilder<UserBloc, UserState>(
              bloc: getIt<UserBloc>(),
              builder: (context, state) {
                if (state.user?.image != null) {
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(24),
                      child: ImageWidget(
                        imageUrl: state.user!.image!,
                        imageTypes: ImageTypes.network,
                        height: 48.h,
                        width: 48.w,
                      ),
                    );
                  }
                return Container(
                  height: 48.h,
                  width: 48.w,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: kcPrimaryColor,
                  ),
                );
              },
            ),
            const HSpace(8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BlocBuilder<UserBloc, UserState>(
                  bloc: getIt<UserBloc>(),
                  builder: (context, state) {
                    final firstName =
                        state.user?.firstName?.capitalizeFirstLetter ?? '';
                    final lastName =
                        state.user?.lastName?.capitalizeFirstLetter ?? '';
                    return TextWidget.bold(
                      '$firstName $lastName',
                      fontSize: sp(18),
                      textColor: Theme.of(context).textTheme.titleMedium!.color,
                    );
                  },
                ),
                Row(
                  children: [
                    TwoSpanTextWidget(
                      '4 ',
                      AppStrings.memories,
                      fontSize: sp(kfsTiny),
                      fontWeight: FontWeight.bold,
                      fontSize2: sp(kfsTiny),
                      textColor2: kcBlack700,
                      textColor: kcBlack700,
                    ),
                    const HSpace(5),
                    TextWidget.bold(
                      '.',
                      fontSize: sp(18),
                      textColor: Theme.of(context).textTheme.titleMedium!.color,
                    ),
                    const HSpace(5),
                    TwoSpanTextWidget(
                      '4 ',
                      AppStrings.articles,
                      fontSize: sp(kfsTiny),
                      fontWeight: FontWeight.bold,
                      fontSize2: sp(kfsTiny),
                      textColor2: kcBlack700,
                      textColor: kcBlack700,
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
        const VSpace(34),
        Row(
          children: [
            Expanded(
              child: Button(
                text: AppStrings.editProfile,
                onTap: () =>
                    AppRouter.instance.navigateTo(EditProfileView.routeName),
              ),
            ),
            const HSpace(16),
            Expanded(
              child: Button.withBorderLine(
                text: AppStrings.shareProfile,
                color: kcWhite,
                borderColor: kcBlack,
                textColor: kcBlack,
                onTap: shareProfile,
              ),
            )
          ],
        ),
      ],
    );
  }

  void shareProfile() {
    Share.share(
      AppStrings.nothingToShareYet,
    );
  }
}

class _ProfileTabView extends StatelessWidget {
  const _ProfileTabView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3, // Number of tabs
      child: Column(
        children: <Widget>[
          TabBar(
            tabs: const [
              Tab(text: 'Memories'),
              Tab(text: 'Articles'),
              Tab(text: 'Family'),
            ],
            labelPadding: EdgeInsets.zero,
            labelColor: Theme.of(context).primaryColor,
            unselectedLabelColor: Colors.black54,
            indicatorSize: TabBarIndicatorSize.label,
          ),
          const Expanded(
            child: TabBarView(
              children: [
                // Replace with your actual widgets
                _ProfileContentTab(
                  nothingHereYet: AppStrings.whenYouSaveMemories,
                ),
                _ProfileContentTab(
                  nothingHereYet: AppStrings.whenYouCreateArticles,
                ),
                _ProfileContentTab(
                  nothingHereYet: AppStrings.whenYouCreateFamilyTree,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ProfileContentTab extends StatelessWidget {
  final String nothingHereYet;
  const _ProfileContentTab({
    Key? key,
    required this.nothingHereYet,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Svg(path: AppIcons.emptyStateSvg),
        const VSpace(40),
        TextWidget(
          AppStrings.nothingHereYet,
          fontSize: sp(24),
          fontWeight: FontWeight.w600,
          textColor: Theme.of(context).textTheme.titleMedium!.color,
        ),
        const VSpace(5),
        TextWidget(
          nothingHereYet,
          textAlign: TextAlign.center,
          fontSize: sp(16),
          fontWeight: FontWeight.w400,
          textColor: Theme.of(context).textTheme.titleMedium!.color,
        ),
      ],
    );
  }
}
