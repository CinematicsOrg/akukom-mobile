import 'package:flutter/material.dart';
// import 'package:lottie/lottie.dart';

import '../../utils/utils.dart';
import '../__components.dart';

class SuccessStateWidget extends StatelessWidget {
  static const String routeName = '/successStateWidget';

  final String title;
  final String message;
  final VoidCallback? onTap;

  const SuccessStateWidget({
    super.key,
    this.title = "Success",
    this.message = "Operation was successful",
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        vSpace(20),
        TextWidget(
          title,
          fontSize: sp(20),
          fontWeight: FontWeight.w400,
        ),
        vSpace(5),
        // Lottie.asset(
        //   "assets/lottie/state_status/success_state_three.json",
        //   height: h(150),
        //   width: w(150),
        //   repeat: false,
        //   fit: BoxFit.fill,
        // ),
        vSpace(20),
        SizedBox(
          width: sw(75),
          child: TextWidget(
            message,
            fontSize: sp(15),
            fontWeight: FontWeight.w400,
            textAlign: TextAlign.center,
          ),
        ),
        vSpace(25),
        Button.icon(text: "Next", onTap: onTap ?? () {}),
        vSpace(),
      ],
    );
  }
}
