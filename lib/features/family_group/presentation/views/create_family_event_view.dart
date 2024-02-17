import 'package:akukom/app/locator.dart';
import 'package:akukom/cores/components/__components.dart';
import 'package:akukom/cores/components/toast.dart';
import 'package:akukom/cores/constants/__constants.dart';
import 'package:akukom/cores/utils/utils.dart';
import 'package:akukom/features/family_group/__family_group.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

class CreateFamilyEventView extends StatelessWidget {
  static const routeName = '/create-family-event-view';
  const CreateFamilyEventView({super.key});

  @override
  Widget build(BuildContext context) {
    return const NormalScaffoldWidget(
      body: Column(
        children: [
          FamilyAppBar(
            title: AppStrings.createEvent,
          ),
          VSpace(20),
          _FamilyCreateEventForm(),
        ],
      ),
    );
  }
}

class _FamilyCreateEventForm extends StatefulWidget {
  const _FamilyCreateEventForm();

  @override
  State<_FamilyCreateEventForm> createState() => __FamilyCreateEventFormState();
}

class __FamilyCreateEventFormState extends State<_FamilyCreateEventForm> {
  final CreateEventCubit _createEventCubit = getIt<CreateEventCubit>();
  final CreateFamilyEventBloc _createFamilyEventBloc =
      getIt<CreateFamilyEventBloc>();
  final TextEditingController _eventNameController = TextEditingController();
  final TextEditingController _eventLocationController =
      TextEditingController();
  final TextEditingController _eventStartDateController =
      TextEditingController();
  final TextEditingController _eventEndDateController = TextEditingController();

  @override
  void initState() {
    _createEventCubit.addADefaultImage();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _eventNameController.dispose();
    _eventLocationController.dispose();
    _eventStartDateController.dispose();
    _eventEndDateController.dispose();
    _createEventCubit.resetForm();
    _createFamilyEventBloc.close();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateEventCubit, CreateEventState>(
      bloc: _createEventCubit,
      builder: (context, state) {
        return Column(
          children: [
            const VSpace(24),
            InkWell(
              onTap: _pickImageFromGallery,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: SizedBox(
                  height: 184.h,
                  width: 350.w,
                  child: ImageWidget(
                    imageUrl: state.eventImage.value?.path,
                    imageTypes: ImageTypes.asset,
                  ),
                ),
              ),
            ),
            const VSpace(24),
            TextFieldWidget(
              hintText: AppStrings.eventName,
              textEditingController: _eventNameController,
              onChanged: _createEventCubit.eventNameChanged,
            ),
            const VSpace(24),
            TextFieldWidget(
              hintText: AppStrings.start,
              textEditingController: _eventStartDateController,
              onTap: () async {
                final DateTime? picked = await selectDateTime(context);
                if (picked != null) {
                  _createEventCubit.eventStartDateChanged(picked);
                  _eventStartDateController.text = picked.formattedDateTime;
                }
              },
              suffixWidget: const Padding(
                padding: EdgeInsets.all(14.0),
                child: Svg(
                  path: AppIcons.calendarMonthSvg,
                ),
              ),
            ),
            const VSpace(24),
            TextFieldWidget(
              hintText: AppStrings.stop,
              textEditingController: _eventEndDateController,
              onTap: () async {
                final DateTime? picked = await selectDateTime(context);
                if (picked != null) {
                  _createEventCubit.eventEndDateChanged(picked);
                  _eventEndDateController.text = picked.formattedDateTime;
                }
              },
              suffixWidget: const Padding(
                padding: EdgeInsets.all(14.0),
                child: Icon(
                  Icons.timer_outlined,
                ),
              ),
            ),
            const VSpace(24),
            TextFieldWidget(
              textEditingController: _eventLocationController,
              hintText: AppStrings.location,
              onChanged: _createEventCubit.eventLocationChanged,
            ),
            const VSpace(24),
            BlocConsumer<CreateFamilyEventBloc, CreateFamilyEventState>(
              bloc: _createFamilyEventBloc,
              listener: _onCreateFamilyEventListener,
              builder: (context, _) {
                return _createFamilyEventBloc.state.status ==
                        CreateFamilyEventStateStatus.loading
                    ? const Button.loading()
                    : Button(
                        active: state.isValid,
                        text: AppStrings.createEvent,
                        onTap: _onCreateEvent,
                      );
              },
            ),
            Button(
              text: AppStrings.cancel,
              color: kcWhite,
              textColor: kcBlack,
              onTap: () => Navigator.pop(context),
            ),
            const VSpace(24),
          ],
        );
      },
    );
  }
}

extension _FamilyCreateEventFormStateExtension on __FamilyCreateEventFormState {
  void _onCreateEvent() {
    final id = getIt<CurrentFamilyCubit>().state.currentFamily?.id ?? '';
    final params = CreateFamilyEventsParams(
      image: _createEventCubit.state.eventImage.value!,
      name: _eventNameController.text,
      startDate: _createEventCubit.state.eventStartDate.value!,
      stopDate: _createEventCubit.state.eventEndDate.value!,
      location: _eventLocationController.text,
      id: id,
    );
    _createFamilyEventBloc.add(CreateFamilysEvent(params: params));
  }

  void _onCreateFamilyEventListener(
      BuildContext context, CreateFamilyEventState state) {
    if (state.status == CreateFamilyEventStateStatus.loaded) {
      Navigator.pop(context);
      getIt<GetFamilyEventsBloc>().add(const GetFamilyEventsList());
      Toast.showSuccess(AppStrings.eventCreated);
    } else if (state.status == CreateFamilyEventStateStatus.error) {
      Toast.showError(state.failure!.message);
    }
  }

  Future<void> _pickImageFromGallery() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(
      source: ImageSource.gallery,
    );

    if (image != null) {
      _createEventCubit.eventImageChanged(image);
    }
  }
}
