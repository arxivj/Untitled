import 'package:flutter/material.dart';

abstract class AppDimensions {
  static const double small = 8.0;
  static const double medium = 16.0;
  static const double large = 32.0;
  static const double extraLarge = 40.0;
  static const double appBarHeight = 56.0;
}

abstract class AppPadding {
  static const EdgeInsets kHorizontalPadding = EdgeInsets.symmetric(horizontal: 16.0);
  static const EdgeInsets kVerticalSmallPadding = EdgeInsets.symmetric(vertical: 8.0);
  static const EdgeInsets kLeftPadding = EdgeInsets.only(left: 16.0);
  static const EdgeInsets kContentPadding = EdgeInsets.all(16.0);

  static EdgeInsets smallPadding() => const EdgeInsets.all(AppDimensions.small);
  static EdgeInsets mediumPadding() => const EdgeInsets.all(AppDimensions.medium);
  static EdgeInsets largePadding() => const EdgeInsets.all(AppDimensions.large);
}

abstract class AppSizes {
  static const Size kAppBarHeight = Size.fromHeight(56.0);
}

abstract class Spacing {
  static Widget height(double size) => SizedBox(height: size);
  static Widget width(double size) => SizedBox(width: size);

  static Widget smallHeight() => height(AppDimensions.small);
  static Widget mediumHeight() => height(AppDimensions.medium);
  static Widget largeHeight() => height(AppDimensions.large);
  static Widget extraLargeHeight() => height(AppDimensions.extraLarge);
  static Widget appBarHeightSpace() => height(AppDimensions.appBarHeight);

  static Widget smallWidth() => width(AppDimensions.small);
  static Widget mediumWidth() => width(AppDimensions.medium);
  static Widget largeWidth() => width(AppDimensions.large);
}
