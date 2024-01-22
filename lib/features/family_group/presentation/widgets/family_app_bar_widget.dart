import 'package:akukom/cores/components/__components.dart';
import 'package:akukom/cores/utils/sizer_utils.dart';
import 'package:flutter/material.dart';

class FamilyAppBar extends StatelessWidget {
  final bool? automaticallyImplyLeading;
  final String? actionPath;
  final String title;
  final bool centerTitle;
  final VoidCallback? onActionTap;
  const FamilyAppBar({
    super.key,
    this.actionPath,
    required this.title,
    this.onActionTap,
    this.automaticallyImplyLeading = true,
    this.centerTitle = false,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: automaticallyImplyLeading ?? true,
      centerTitle: centerTitle,
      title: TextWidget.bold(
        title,
        fontSize: sp(24),
        textColor: Theme.of(context).textTheme.titleMedium!.color,
      ),
      actions: [
        actionPath != null
            ? InkWell(
                onTap: onActionTap,
                child: Svg(
                  path: actionPath!,
                ),
              )
            : Container(),
      ],
    );
  }
}
