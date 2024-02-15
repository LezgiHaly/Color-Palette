import 'package:flutter/material.dart';

// Модель

class IpColors {
  final String name;
  final String value;

  const IpColors({
    required this.name,
    required this.value,
  });

  // Конструктор для создания нового IpPhoto экземпляра

  factory IpColors.fromJson(Map<String, Object?> json) {
    return IpColors(
      name: json['name'] as String,
      value: json['value'] as String,
    );
  }

  Color get color {
    final colorValue = value.replaceFirst('#', "0xFF");
    final colorInt = int.parse(colorValue);
    return Color(colorInt);
  }

  String get colorHex {
    final colorHex = value.split('#').toString();
    return colorHex;
  }
}
