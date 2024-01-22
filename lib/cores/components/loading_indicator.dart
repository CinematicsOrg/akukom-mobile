import 'package:flutter/material.dart';

class LoadingIndicatorWidget extends StatelessWidget {
  const LoadingIndicatorWidget({
    Key? key,
    this.strokeWidth,
    this.value,
  }) : super(key: key);

  final double? strokeWidth;
  final double? value;

  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator.adaptive(
      // color: Colors.grey[200],
      backgroundColor: Colors.black,
      strokeWidth: strokeWidth ?? 8.0,
      value: value,
    );
  }
}
