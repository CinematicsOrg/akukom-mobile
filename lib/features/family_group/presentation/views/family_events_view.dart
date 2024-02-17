import 'package:akukom/app/locator.dart';
import 'package:akukom/cores/components/__components.dart';
import 'package:akukom/cores/constants/__constants.dart';
import 'package:akukom/cores/navigator/navigator.dart';
import 'package:akukom/cores/utils/utils.dart';
import 'package:akukom/features/family_group/__family_group.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FamilyEventView extends StatelessWidget {
  static const routeName = '/family-event-view';
  const FamilyEventView({super.key});

  @override
  Widget build(BuildContext context) {
    return NormalScaffoldWidget(
      useSingleScroll: false,
      body: Column(
        children: [
          FamilyAppBar(
            title: AppStrings.events,
            actionPath: AppIcons.addSvg,
            onActionTap: goToCreateEvent,
          ),
          const VSpace(20),
          // GetFamilyEventsBloc
          Expanded(
            child: BlocBuilder<GetFamilyEventsBloc, GetFamilyEventsState>(
              bloc: getIt<GetFamilyEventsBloc>()
                ..add(
                  const GetFamilyEventsList(),
                ),
              builder: (context, state) {
                if (state.status == GetFamilyEventsStateStatus.loading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state.status == GetFamilyEventsStateStatus.loaded) {
                  return _EventListWidget(
                    events: state.familyEvents,
                  );
                } else {
                  return const _NoEventsWidget();
                }
              },
            ),
          )
        ],
      ),
    );
  }

  void goToCreateEvent() {
    AppRouter.instance.navigateTo(CreateFamilyEventView.routeName);
  }
}

class _NoEventsWidget extends StatelessWidget {
  const _NoEventsWidget();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextWidget(
          AppStrings.noFamilyEventYet,
          fontSize: sp(kfsSuperLarge),
          fontWeight: FontWeight.bold,
        ),
        const VSpace(10),
        TextWidget(
          AppStrings.newEventWillAppear,
          fontSize: sp(kfsMedium),
        ),
      ],
    );
  }
}

class _EventListWidget extends StatelessWidget {
  final List<EventsEntity>? events;
  const _EventListWidget({
    required this.events,
  });

  @override
  Widget build(BuildContext context) {
    return events?.isEmpty ?? true
        ? const _NoEventsWidget()
        : ListView.builder(
            itemCount: events?.length,
            itemBuilder: (context, index) {
              final event = events?[index];
              return _EventItemWidget(event: event);
            },
          );
  }
}

class _EventItemWidget extends StatelessWidget {
  final EventsEntity? event;
  const _EventItemWidget({
    required this.event,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: kcGrey200,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextWidget(
                      event?.startDate?.timeAgo() ?? AppStrings.na,
                      fontSize: sp(kfsMedium),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const HSpace(10),
              SizedBox(
                width: 259.w,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        height: 151.h,
                        width: 259.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            image: NetworkImage(event?.coverImageUrl ?? ''),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    const VSpace(10),
                    TextWidget(
                      event?.name?.capitalizeFirstOfEachWord ?? AppStrings.na,
                      fontSize: sp(kfsMedium),
                      fontWeight: FontWeight.bold,
                    ),
                    const VSpace(10),
                    Row(
                      children: [
                        const Icon(
                          Icons.calendar_month_outlined,
                          color: kcTextGrey,
                        ),
                        const HSpace(5),
                        TextWidget(
                          event?.startDate?.formattedDateTimeShort ??
                              AppStrings.na,
                          fontSize: sp(kfsMedium),
                          textColor: kcTextGrey,
                        ),
                      ],
                    ),
                    const VSpace(10),
                    Row(
                      children: [
                        const Icon(
                          Icons.timer_outlined,
                          color: kcTextGrey,
                        ),
                        const HSpace(5),
                        TextWidget(
                          event?.stopDate?.formattedDateTimeShort ??
                              AppStrings.na,
                          fontSize: sp(kfsMedium),
                          textColor: kcTextGrey,
                        ),
                      ],
                    ),
                    const VSpace(10),
                    Row(
                      children: [
                        const Icon(
                          Icons.location_on_outlined,
                          color: kcTextGrey,
                        ),
                        const HSpace(5),
                        TextWidget(
                          event?.location ?? AppStrings.na,
                          fontSize: sp(kfsMedium),
                          textColor: kcTextGrey,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const VSpace(20),
        const Divider(
          color: kcGrey200,
          thickness: 1,
        ),
        const VSpace(10),
      ],
    );
  }
}
