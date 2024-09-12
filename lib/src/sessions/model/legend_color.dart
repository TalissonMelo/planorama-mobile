import 'package:flutter/material.dart';

class LegendColor {
  String primary;
  String secondary;

  LegendColor({
    required this.primary,
    required this.secondary,
  });

  static LegendColor fromMap(Map map) {
    return LegendColor(
      primary: map['primary'],
      secondary: map['secondary'],
    );
  }

  Color get colorValue {
    String hexColor = primary.replaceAll('#', '');
    if (hexColor.length == 6) {
      hexColor = 'FF$hexColor';
      return Color(int.parse(hexColor, radix: 16));
    }
    return Colors.black;
  }
}
