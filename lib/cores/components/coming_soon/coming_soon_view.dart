import 'package:akukom/cores/constants/__constants.dart';
import 'package:flutter/material.dart';
import '../../navigator/navigator.dart';
import '../__components.dart';
import '../../utils/utils.dart';

class ComingSoonPage extends StatelessWidget {
  static const String routeName = "coming_soon";

  const ComingSoonPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaffoldWidget(
      useSingleScroll: false,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          hSpace(double.infinity),
          Container(
            color: Colors.grey.shade100,
            child: ImageWidget(
              imageUrl: "assets/images/intro/jumping.png",
              imageTypes: ImageTypes.asset,
              height: h(212),
              width: w(270),
            ),
          ),
          vSpace(),
          TextWidget(
            'Recon Premium is \ncoming soon!',
            fontSize: sp(24),
            fontWeight: FontWeight.w600,
            textAlign: TextAlign.center,
          ),
          vSpace(20),
          Button(
            text: "Okay",
            onTap: AppRouter.instance.goBack,
          ),
        ],
      ),
    );
  }
}
