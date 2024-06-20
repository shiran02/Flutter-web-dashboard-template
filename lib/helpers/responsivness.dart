import 'package:flutter/material.dart';

const int largeScreenSize = 1366; // laptops
const int mediumScreenSize = 768;
const int smallScreenSize = 360;
const int customScreenSize = 1100; // this is not needed every project

class ResponsiveWidget extends StatelessWidget {
  final Widget largeScreen;
  final Widget mediumScreen;
  final Widget smallScreen;

  const ResponsiveWidget({
    super.key,
    required this.largeScreen,
    required this.mediumScreen,
    required this.smallScreen,
  });

  static bool isSmallScreen(BuildContext context) {
    return MediaQuery.of(context).size.width < smallScreenSize;
  }

  static bool isMediumScreen(BuildContext context) {
    return MediaQuery.of(context).size.width >= mediumScreenSize &&
        MediaQuery.of(context).size.width < largeScreenSize;
  }

  static bool isLargeScreen(BuildContext context) {
    return MediaQuery.of(context).size.width >= largeScreenSize;
  }

  static bool isCustomScreen(BuildContext context) {
    return MediaQuery.of(context).size.width >= mediumScreenSize &&
        MediaQuery.of(context).size.width <= customScreenSize;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double _width = constraints.maxWidth;

        if (_width >= largeScreenSize) {
          return largeScreen;
        } else if (_width < largeScreenSize && _width >= mediumScreenSize) {
          return mediumScreen ?? largeScreen;
        } else {
          return smallScreen ?? largeScreen;
        }
      },
    );
  }
}
