import 'package:akukom/cores/components/__components.dart';
import 'package:akukom/cores/constants/__constants.dart';
import 'package:akukom/cores/utils/utils.dart';
import 'package:flutter/material.dart';

class SettingsSwitchWidget extends StatefulWidget {
  final String header;
  final String? content;
  const SettingsSwitchWidget({
    super.key,
    required this.header,
    this.content,
  });

  @override
  State<SettingsSwitchWidget> createState() => _SettingsSwitchWidgetState();
}

class _SettingsSwitchWidgetState extends State<SettingsSwitchWidget> {
  bool isSwitched = true; // You can set the initial state of the switch here

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: widget.content != null
          ? CrossAxisAlignment.start
          : CrossAxisAlignment.center,
      children: [
        Expanded(
          child: widget.content != null
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextWidget(
                      AppStrings.connectContact,
                      fontSize: sp(
                        kfsLarge,
                      ),
                      fontWeight: FontWeight.w500,
                    ),
                    const VSpace(5),
                    TextWidget(
                      widget.content ?? '',
                      fontSize: sp(
                        kfsMedium,
                      ),
                      fontWeight: FontWeight.w400,
                      textColor: kcGrey600,
                    ),
                  ],
                )
              : Expanded(
                  child: TextWidget(
                    AppStrings.connectContact,
                    fontSize: sp(
                      kfsLarge,
                    ),
                    fontWeight: FontWeight.w500,
                  ),
                ),
        ),
        const HSpace(35),
        Switch(
          value: isSwitched,
          onChanged: (value) {
            setState(() {
              isSwitched = value;
            });
          },
        ),
      ],
    );
  }
}
