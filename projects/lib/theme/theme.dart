import 'package:flutter/material.dart';

import '../colors/colors.dart';
import '../typography/text_styles.dart';

class MondayComTheme {
  static ThemeData get standard {
    return ThemeData(
      colorScheme: const ColorScheme.light(primary: MondayColors.red50),
      bottomNavigationBarTheme: _bottomNavigationBarTheme,
      iconTheme: _iconTheme,
      textTheme: _textTheme,
      listTileTheme: _listTileTheme,
      floatingActionButtonTheme: _floatingActionButtonTheme,
      elevatedButtonTheme: _elevatedButtonTheme,
      appBarTheme: _appBarTheme,
    );
  }

  static AppBarTheme get _appBarTheme {
    return AppBarTheme(
      backgroundColor: MondayColors.red50,
      titleTextStyle: MondayTextStyle.headline4.copyWith(
        color: MondayColors.white,
      ),
    );
  }

  static ElevatedButtonThemeData get _elevatedButtonTheme {
    return ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        shape: const StadiumBorder(),
        fixedSize: const Size(double.infinity, 54),
        textStyle: MondayTextStyle.bodySmall,
        primary: MondayColors.red50,
      ),
    );
  }

  static FloatingActionButtonThemeData get _floatingActionButtonTheme {
    return const FloatingActionButtonThemeData(
      backgroundColor: MondayColors.red50,
    );
  }

  static ListTileThemeData get _listTileTheme {
    return const ListTileThemeData();
  }

  static IconThemeData get _iconTheme {
    return const IconThemeData(
      color: MondayColors.white,
      size: 24,
    );
  }

  static BottomNavigationBarThemeData get _bottomNavigationBarTheme {
    return BottomNavigationBarThemeData(
      showSelectedLabels: false,
      showUnselectedLabels: false,
      unselectedIconTheme: _iconTheme.copyWith(
        color: MondayColors.black,
      ),
      selectedIconTheme: _iconTheme.copyWith(
        color: MondayColors.red50,
      ),
    );
  }

  static TextTheme get _textTheme {
    return TextTheme(
      headline4: MondayTextStyle.headline4,
      bodyText2: MondayTextStyle.bodySmall,
      subtitle1: MondayTextStyle.bodyXSmall,
    );
  }
}
