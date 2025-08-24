import 'package:flutter/material.dart';

class NoGlowScroll extends ScrollBehavior {
  const NoGlowScroll();
  @override
  Widget buildViewportChrome(BuildContext context, Widget child, AxisDirection axisDirection) => child;
  @override
  ScrollPhysics getScrollPhysics(BuildContext context) => const ClampingScrollPhysics();
}