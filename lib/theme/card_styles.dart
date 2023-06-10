import 'package:flutter/material.dart';
import '../core/presentation/components/account_card/styles/rounded_lines_style.dart';

class CardStyles {
  /// Rounded Lines Style
  static CustomPainter roundedLinesStyle({required Color color, double strokeWidth = 20.0}) =>
      RoundedLinesStyle(color: color, strokeWidth: strokeWidth);
}
