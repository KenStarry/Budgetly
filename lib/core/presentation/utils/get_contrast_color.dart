import 'package:flutter/material.dart';

Color getTextColorForBackground({required Color backgroundColor}) {
  if (ThemeData.estimateBrightnessForColor(backgroundColor) ==
      Brightness.dark) {
    return Colors.white;
  }
  return Colors.black;
}
