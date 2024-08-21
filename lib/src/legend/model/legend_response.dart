import 'package:flutter/material.dart';

class LegendResponse {
  String id;
  String color;
  String ownerId;
  String description;

  LegendResponse({
    required this.id,
    required this.color,
    required this.ownerId,
    required this.description,
  });

  static LegendResponse fromMap(Map map) {
    return LegendResponse(
        id: map['id'],
        color: map['color'],
        ownerId: map['ownerId'],
        description: map['description']);
  }

  Color get colorValue {
    String hexColor = color.replaceAll('#', '');
    if (hexColor.length == 6) {
      hexColor = 'FF$hexColor';
      return Color(int.parse(hexColor, radix: 16));
    }
    return Colors.black;
  }
}
