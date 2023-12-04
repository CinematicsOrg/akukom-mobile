import 'package:akukom/cores/constants/__constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// return a percentage of the screen height in respect to the  value given
double sh(double value) => (value / 100).sh;

/// return a percentage of the screen width in respect to the  value given
double sw(double value) => (value / 100).sw;

/// Calculates the sp (Scalable Pixel) depending on the device's screen size
double sp(double value) => value.sp;

double h(double value) => value.h;

double w(double value) => value.w;

double sr(double value) => value.r;

SizedBox vSpace([double value = 10]) => SizedBox(height: value.sp);

SizedBox hSpace([double value = 10]) => SizedBox(width: value.sp);

class VSpace extends StatelessWidget {
  const VSpace(this.size, {Key? key, this.unit = SizeUnit.pixel})
      : super(key: key);
  final double size;
  final SizeUnit unit;

  @override
  Widget build(BuildContext context) {
    final double size = unit == SizeUnit.pixel ? this.size : this.size.h;
    return SizedBox(height: size);
  }
}

class HSpace extends StatelessWidget {
  const HSpace(this.size, {Key? key, this.unit = SizeUnit.pixel})
      : super(key: key);
  final double size;
  final SizeUnit unit;

  @override
  Widget build(BuildContext context) {
    final double size = unit == SizeUnit.pixel ? this.size : this.size.w;
    return SizedBox(width: size);
  }
}
