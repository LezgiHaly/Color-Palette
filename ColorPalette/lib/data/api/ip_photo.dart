import 'package:flutter/material.dart';

class IpPhoto {
  final String name;
  final String value;

  const IpPhoto({
    required this.name,
    required this.value,
  });

  factory IpPhoto.fromJson(Map<String, Object?> json) {
    return IpPhoto(
      name: json['name'] as String,
      value: json['value'] as String,
    );
  }

  Color get color {
    final colorValue = value.replaceFirst('#', "0xFF");
    final colorint = int.parse(colorValue);
    return Color(colorint);
  }

  String get colorHex {
    final colorHex = value.split('#').toString();
    return colorHex;
  }
}
