import 'package:akukom/app/locator.dart';
import 'package:akukom/cores/components/__components.dart';
import 'package:akukom/cores/constants/__constants.dart';
import 'package:akukom/cores/navigator/navigator.dart';
import 'package:akukom/cores/utils/utils.dart';
import 'package:akukom/features/family_group/__family_group.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SendRequestView extends StatefulWidget {
  static const routeName = '/send-request-view';
  const SendRequestView({super.key});

  @override
  State<SendRequestView> createState() => _SendRequestViewState();
}

class _SendRequestViewState extends State<SendRequestView> {
  final GetFamilyFamilyUserCanJoinBloc _getFamilyFamilyUserCanJoinBloc =
      getIt<GetFamilyFamilyUserCanJoinBloc>();

  @override
  void initState() {
    super.initState();
    _getFamilyFamilyUserCanJoinBloc.add(
      GetFamilyFamilyUserCanJoinUserEvent(
        param: ListFamilyUserCanJoinParam(
          search: 'a',
        ),
      ),
    );
  }

  @override
  void dispose() {
    _getFamilyFamilyUserCanJoinBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return NormalScaffoldWidget(
      useSingleScroll: false,
      body: Column(
        children: [
          const FamilyAppBar(
            title: AppStrings.sendRequests,
          ),
          const VSpace(20),
          const TextFieldWidget(
            hintText: AppStrings.search,
            prefix: Icon(
              Icons.search,
              color: kcGrey600,
            ),
          ),
          const VSpace(20),
          BlocBuilder<GetFamilyFamilyUserCanJoinBloc,
              GetFamilyFamilyUserCanJoinState>(
            bloc: _getFamilyFamilyUserCanJoinBloc,
            builder: (context, state) {
              if (state.status == GetFamilyFamilyUserCanJoinStatus.loading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state.status ==
                  GetFamilyFamilyUserCanJoinStatus.success) {
                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: state.familyList?.length,
                  itemBuilder: (context, index) {
                    final data = state.familyList?[index];
                    return _RequestList(
                      familyDataEntity: data,
                    );
                  },
                );
              }
              return const SizedBox();
            },
          ),
        ],
      ),
    );
  }
}

class _RequestList extends StatelessWidget {
  final FamilyDataEntity? familyDataEntity;
  const _RequestList({
    Key? key,
    required this.familyDataEntity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 16.h),
      child: InkWell(
        onTap: goToFamilyDetailsJoinView,
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

  void goToFamilyDetailsJoinView() {
    AppRouter.instance.navigateTo(
      FamilyDetailsJoinView.routeName,
      arguments: familyDataEntity,
    );
  }
}
