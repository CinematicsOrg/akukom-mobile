import 'package:akukom/cores/components/__components.dart';
import 'package:akukom/cores/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingsTileWidget extends StatelessWidget {
  final String iconPath;
  final VoidCallback onTap;
  final String title;
  final Color? iconColor;
  final Color? textColor;
  const SettingsTileWidget({
    super.key,
    required this.iconPath,
    required this.onTap,
    required this.title,
    this.iconColor,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: SizedBox(
        height: 48.h,
        child: Row(
          children: [
            Svg(
              path: iconPath,
              color: iconColor,
            ),
            const HSpace(10),
            TextWidget(
              title,
              fontSize: sp(16),
              textColor: textColor,
            ),
            const Spacer(),
            const Icon(
              Icons.arrow_forward_ios,
              size: 15,
            ),
          ],
        ),
      ),
    );
  }
}
