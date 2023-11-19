import 'package:akukom/cores/constants/__constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';

// svg container
class Svg extends StatelessWidget {
  const Svg({
    Key? key,
    required this.path,
    this.color,
    this.semanticLabel,
    this.fit = BoxFit.contain,
    this.width,
    this.height,
    this.size,
    this.alignmentGeometry,
    this.svgType = SvgType.asset,
  }) : super(key: key);

  const Svg.scaleDown({
    super.key,
    required this.path,
    this.semanticLabel,
    this.height,
    this.width,
    this.size,
    this.color,
    this.alignmentGeometry,
    this.svgType = SvgType.asset,
  }) : fit = BoxFit.scaleDown;

  final String? semanticLabel;
  final String path;
  final double? height;
  final double? width;
  final double? size;
  final Color? color;
  final AlignmentGeometry? alignmentGeometry;
  final BoxFit fit;
  final SvgType? svgType;

  @override
  Widget build(BuildContext context) {
    if (SvgType.asset == svgType) {
      return SvgPicture.asset(
        path,
        height: height ?? size,
        width: width ?? size,
        colorFilter:
            color != null ? ColorFilter.mode(color!, BlendMode.srcIn) : null,
        alignment: alignmentGeometry ?? Alignment.center,
        semanticsLabel: semanticLabel,
        fit: fit,
      );
    }

    return SvgPicture.network(
      path,
      height: height ?? size,
      width: width ?? size,
      colorFilter:
          color != null ? ColorFilter.mode(color!, BlendMode.srcIn) : null,
      alignment: alignmentGeometry ?? Alignment.center,
      semanticsLabel: semanticLabel,
      fit: fit,
    );
  }
}
