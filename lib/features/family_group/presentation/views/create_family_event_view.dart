import 'package:akukom/cores/components/__components.dart';
import 'package:akukom/cores/constants/__constants.dart';
import 'package:akukom/cores/utils/utils.dart';
import 'package:akukom/features/family_group/__family_group.dart';
import 'package:flutter/material.dart';

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
  final TextEditingController _eventNameController = TextEditingController();
  final TextEditingController _eventLocationController =
      TextEditingController();
  final TextEditingController _eventStartDateController =
      TextEditingController();
  final TextEditingController _eventEndDateController = TextEditingController();
  final TextEditingController _addAttendeesController = TextEditingController();
  bool _isAllDayEvent = false;
  String alertType = 'Alert';

  @override
  void dispose() {
    _eventNameController.dispose();
    _eventLocationController.dispose();
    _eventStartDateController.dispose();
    _eventEndDateController.dispose();
    _addAttendeesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFieldWidget(
          hintText: AppStrings.eventName,
          title: AppStrings.eventName,
          textEditingController: _eventNameController,
        ),
        const VSpace(24),
        TextFieldWidget(
          hintText: AppStrings.location,
          title: AppStrings.location,
          textEditingController: _eventLocationController,
        ),
        const VSpace(24),
        Row(
          children: [
            Expanded(
              child: TextFieldWidget(
                hintText: AppStrings.start,
                title: AppStrings.date,
                textEditingController: _eventStartDateController,
                suffixWidget: const Padding(
                  padding: EdgeInsets.all(14.0),
                  child: Svg(
                    path: AppIcons.calendarMonthSvg,
                  ),
                ),
              ),
            ),
            const HSpace(24),
            Expanded(
              child: TextFieldWidget(
                hintText: AppStrings.stop,
                title: AppStrings.date,
                textEditingController: _eventEndDateController,
                suffixWidget: const Padding(
                  padding: EdgeInsets.all(14.0),
                  child: Svg(
                    path: AppIcons.calendarMonthSvg,
                  ),
                ),
              ),
            ),
          ],
        ),
        Row(
          children: [
            Checkbox(
              value: _isAllDayEvent,
              onChanged: (value) {
                setState(() {
                  _isAllDayEvent = value!;
                });
              },
            ),
            TextWidget(
              AppStrings.allDay,
              fontSize: sp(kfsMedium),
            ),
          ],
        ),
        const VSpace(24),
        DropDownWidget(
          value: alertType,
          items: const [
            'Alert',
          ],
          title: AppStrings.alert,
        ),
        const VSpace(24),
        TextFieldWidget(
          hintText: AppStrings.addAttendees,
          title: AppStrings.addAttendees,
          textEditingController: _addAttendeesController,
          suffixWidget: const Padding(
            padding: EdgeInsets.all(14.0),
            child: Svg(
              path: AppIcons.personAddSvg,
            ),
          ),
        ),
        const VSpace(24),
        Button(
          text: AppStrings.createEvent,
          onTap: () {},
        ),
        Button(
          text: AppStrings.cancel,
          color: kcWhite,
          textColor: kcBlack,
          onTap: () {},
        ),
        const VSpace(24),
      ],
    );
  }
}
