import 'dart:ui';

import 'package:flutter/material.dart';

class MyColors {
  /// Light theme colors
  static Map<String, Color> lightColors = {
    'accent_1': Color(0xff03045e),
    'accent_2': Color(0xff0077b6),
    'accent_3': Color(0xff00b4d8),
    'accent_4': Color(0xff90e0ef),
    'accent_5': Color(0xffcaf0f3),
    'scaffold_bg': Color(0xffffffff),
    'scaffold_bg_alt': Color(0xffEFFEFF),
    'success': Colors.greenAccent.shade700,
    'error': Colors.redAccent.shade700,
    'icon_color': Colors.black54,
    'text_black': Colors.black,
    'text_black_87': Colors.black87,
    'text_black_54': Colors.black54,
  };

  /// Dark theme colors
  static Map<String, Color> darkColors = {
    'accent_1': const Color(0xff03045e),
    'accent_2': const Color(0xff0077b6),
    'accent_3': const Color(0xff00b4d8),
    'accent_4': const Color(0xff90e0ef),
    'accent_5': const Color(0xffcaf0f8),
    'success': Colors.greenAccent.shade700,
    'error': Colors.redAccent.shade700,
    'scaffold_bg': const Color(0xff2F3237),
    'scaffold_bg_alt': const Color(0xff1C1E21),
    'icon_color': Colors.white54,
    'text_white': Colors.white,
    'text_white_70': Colors.white70,
    'text_white_60': Colors.white60,
  };
}
