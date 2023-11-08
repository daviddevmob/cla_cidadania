
import 'package:flutter/material.dart';

class Responsive extends StatelessWidget {
  final Widget mobile;
  final Widget smallTablet;
  final Widget largeTablet;
  final Widget laptop;
  final Widget desktop;

  const Responsive({
    Key? key,
    required this.mobile,
    required this.smallTablet,
    required this.largeTablet,
    required this.laptop,
    required this.desktop,
  }) : super(key: key);

  static bool isMobile(BuildContext context) {
    final data = MediaQuery.of(context);
    return data.size.shortestSide < 600;
  }

  static bool isSmallTablet(BuildContext context) =>
      MediaQuery.of(context).size.width < 900 &&
      MediaQuery.of(context).size.width >= 600;
  static bool isLargeTablet(BuildContext context) =>
      MediaQuery.of(context).size.width < 1250 &&
      MediaQuery.of(context).size.width >= 900;
  static bool isLaptop(BuildContext context) =>
      MediaQuery.of(context).size.width < 1450 &&
      MediaQuery.of(context).size.width >= 1250;
  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 1450;




  static bool isPortrait(BuildContext context) {
    return MediaQuery.of(context).orientation == Orientation.portrait;
  }

  static double getMarginScreen(BuildContext context) {
    if (isMobile(context)) {
      return 10;
    } else {
      return 10;
    }
  }


 
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // Desktop
        if (constraints.maxWidth >= 1450) {
          return desktop;
        }
        // Laptop
        else if (constraints.maxWidth >= 1250) {
          return laptop;
        }
        // Large Table
        else if (constraints.maxWidth >= 900) {
          return largeTablet;
        }
        // Small Tablet
        else if (constraints.maxWidth >= 600) {
          return smallTablet;
        }
        // Mobile
        else {
          return mobile;
        }
      },
    );
  }
}