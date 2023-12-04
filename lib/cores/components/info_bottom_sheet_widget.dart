import 'package:flutter/material.dart';

import '../constants/__constants.dart';
import '../utils/utils.dart';
import 'components.dart';

class InfoBottomSheetWidget extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;
  final VoidCallback? onTap;

  const InfoBottomSheetWidget({
    Key? key,
    this.icon = Icons.info,
    this.title = "Info",
    required this.description,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const VSpace(0),
        Icon(icon, color: kcSoftTextColor, size: sp(40)),
        const VSpace(40),
        TextWidget(
          title,
          fontSize: sp(16),
          fontWeight: FontWeight.w600,
        ),
        TextWidget(
          description,
          fontSize: sp(14),
          fontWeight: FontWeight.w300,
          textColor: kcSoftTextColor,
        ),
        const VSpace(40),
        Button(text: "Try Again", onTap: onTap),
        const VSpace(0),
      ],
    );
  }
}
