import 'package:akukom/cores/components/custom_text_widget.dart';
import 'package:akukom/cores/utils/sizer_utils.dart';
import 'package:flutter/material.dart';

class AuthHeaderWidget extends StatelessWidget {
  final String text;
  const AuthHeaderWidget(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return TextWidget.bold(
      text,
      fontSize: sp(24),
      textColor: Theme.of(context).textTheme.titleMedium!.color,
    );
  }
}
