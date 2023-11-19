import 'package:akukom/cores/components/components.dart';
import 'package:akukom/cores/constants/color.dart';
import 'package:akukom/cores/utils/sizer_utils.dart';
import 'package:flutter/material.dart';

class OpeningAccountScreen extends StatelessWidget {
  static const String routeName = '/opening-account';
  const OpeningAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return NormalScaffoldWidget(
      bg: kcGreyLight,
      useSingleScroll: false,
      useSafeArea: false,
      usePadding: false,
      body: Stack(
        children: [
          Positioned(
            bottom: 0,
            child: Container(
              height: sp(422),
              width: double.maxFinite,
              color: kcWhite,
              child: const _OpeningAccountWidget(),
            ),
          ),
        ],
      ),
    );
  }
}

class _OpeningAccountWidget extends StatelessWidget {
  const _OpeningAccountWidget();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        verticalSpace(44),
        
      ],
    );
  }
}
