import 'package:flutter/material.dart';

import 'my_colors.dart';

class MyTheme {

  /// Light Theme color implementations
  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: MyColors.lightColors['scaffold_bg'],
    fontFamily: 'Poppins',
    textTheme: TextTheme(
      titleLarge: TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.bold,
        fontFamily: 'Poppins',
        color: MyColors.lightColors['text_black']
      ),
      titleMedium: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          fontFamily: 'Poppins',
          color: MyColors.lightColors['text_black_87']
      ),
      titleSmall: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w700,
          fontFamily: 'Poppins',
          color: MyColors.lightColors['text_black_87'],
      ),
      bodyLarge: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w500,
          fontFamily: 'Poppins',
          color: MyColors.lightColors['text_black_54']
      ),
      bodyMedium: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w300,
          fontFamily: 'Poppins',
          color: MyColors.lightColors['text_black_54']
      ),
      bodySmall: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w300,
        fontFamily: 'Poppins',
        color: MyColors.lightColors['text_black_54'],
      ),
    )
  );

  /// Dark Theme color implementations
  static ThemeData darkTheme = ThemeData(
      scaffoldBackgroundColor: MyColors.darkColors['scaffold_bg'],
      fontFamily: 'Poppins',
      textTheme: TextTheme(
        titleLarge: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.bold,
            fontFamily: 'Poppins',
            color: MyColors.darkColors['text_white']
        ),
        titleMedium: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            fontFamily: 'Poppins',
            color: MyColors.darkColors['text_white_70']
        ),
        titleSmall: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w700,
          fontFamily: 'Poppins',
          color: MyColors.darkColors['text_white_70'],
        ),
        bodyLarge: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            fontFamily: 'Poppins',
            color: MyColors.darkColors['text_white_60']
        ),
        bodyMedium: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w300,
            fontFamily: 'Poppins',
            color: MyColors.darkColors['text_white_60']
        ),
        bodySmall: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w300,
          fontFamily: 'Poppins',
          color: MyColors.darkColors['text_white_60'],
        ),
      )
  );
}