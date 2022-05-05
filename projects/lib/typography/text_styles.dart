import 'package:flutter/widgets.dart';
import 'package:projects/colors/colors.dart';

import 'font_weights.dart';

/// Defines text styles for the puzzle UI.
class MondayTextStyle {
  /// Headline 1 text style
  static TextStyle get headline1 {
    return _baseTextStyle.copyWith(
      fontSize: 74,
      fontWeight: MondayFontWeight.bold,
    );
  }

  /// Headline 2 text style
  static TextStyle get headline2 {
    return _baseTextStyle.copyWith(
      fontSize: 54,
      height: 1.1,
      fontWeight: MondayFontWeight.bold,
    );
  }

  /// Headline 3 text style
  static TextStyle get headline3 {
    return _baseTextStyle.copyWith(
      fontSize: 34,
      height: 1.12,
      fontWeight: MondayFontWeight.bold,
    );
  }

  /// Headline 3 Soft text style
  static TextStyle get headline3Soft {
    return _baseTextStyle.copyWith(
      fontSize: 34,
      height: 1.17,
      fontWeight: MondayFontWeight.regular,
    );
  }

  /// Headline 4 text style
  static TextStyle get headline4 {
    return _baseTextStyle.copyWith(
      fontSize: 24,
      height: 1.15,
      fontWeight: MondayFontWeight.bold,
    );
  }

  /// Headline 4 Soft text style
  static TextStyle get headline4Soft {
    return _baseTextStyle.copyWith(
      fontSize: 24,
      height: 1.15,
      fontWeight: MondayFontWeight.regular,
    );
  }

  /// Headline 5 text style
  static TextStyle get headline5 {
    return _baseTextStyle.copyWith(
      fontSize: 16,
      height: 1.25,
      fontWeight: MondayFontWeight.bold,
    );
  }

  /// Body Large Bold text style
  static TextStyle get bodyLargeBold {
    return _baseTextStyle.copyWith(
      fontSize: 46,
      height: 1.17,
      fontWeight: MondayFontWeight.bold,
    );
  }

  /// Body Large text style
  static TextStyle get bodyLarge {
    return _baseTextStyle.copyWith(
      fontSize: 46,
      height: 1.17,
      fontWeight: MondayFontWeight.regular,
    );
  }

  /// Body text style
  static TextStyle get body {
    return _bodyTextStyle.copyWith(
      fontSize: 20,
      height: 1.33,
      fontWeight: MondayFontWeight.regular,
    );
  }

  /// Body Small text style
  static TextStyle get bodySmall {
    return _bodyTextStyle.copyWith(
      fontSize: 18,
      height: 1.22,
      fontWeight: MondayFontWeight.regular,
    );
  }

  /// Body XSmall text style
  static TextStyle get bodyXSmall {
    return _bodyTextStyle.copyWith(
      fontSize: 12,
      height: 1.27,
      fontWeight: MondayFontWeight.regular,
    );
  }

  /// Label text style
  static TextStyle get label {
    return _baseTextStyle.copyWith(
      fontSize: 14,
      height: 1.27,
      fontWeight: MondayFontWeight.regular,
    );
  }

  /// Countdown text style
  static TextStyle get countdownTime {
    return _baseTextStyle.copyWith(
      fontSize: 300,
      height: 1,
      fontWeight: MondayFontWeight.bold,
    );
  }

  static const _baseTextStyle = TextStyle(
    fontFamily: 'Roboto',
    color: MondayColors.black,
    fontWeight: MondayFontWeight.regular,
  );

  static const _bodyTextStyle = TextStyle(
    fontFamily: 'Roboto',
    color: MondayColors.black,
    fontWeight: MondayFontWeight.regular,
  );
}
