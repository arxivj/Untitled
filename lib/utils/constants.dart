import 'package:flutter/material.dart';

class AppPadding {
  static const EdgeInsets kHorizontalPadding = EdgeInsets.symmetric(horizontal: 16.0);
  static const EdgeInsets kVerticalSmallPadding = EdgeInsets.symmetric(vertical: 8.0);
  static const EdgeInsets kLeftPadding = EdgeInsets.only(left: 16.0);
}

class AppSizes {
  static const Size kAppBarHeight = Size.fromHeight(56.0);
}

class Spacing {
  static const double small = 8.0;
  static const double medium = 16.0;
  static const double large = 32.0;
  static const double extraLarge = 40.0;
  static const double appBarHeight = 56.0;

  static Widget height(double size) => SizedBox(height: size);
  static Widget width(double size) => SizedBox(width: size);

  static Widget smallHeight() => height(small);
  static Widget mediumHeight() => height(medium);
  static Widget largeHeight() => height(large);
  static Widget extraLargeHeight() => height(extraLarge);
  static Widget appBarHeightSpace() => height(appBarHeight);

  static Widget smallWidth() => width(small);
  static Widget mediumWidth() => width(medium);
  static Widget largeWidth() => width(large);
}