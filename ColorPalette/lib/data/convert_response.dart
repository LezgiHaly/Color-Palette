import 'dart:convert';
import 'package:surf_flutter_courses_template/data/api/ip_colors.dart';
import 'package:surf_flutter_courses_template/data/source.dart';

// Преобразование

Future<List<IpColors>> fetchColros() async {
  await Future.delayed(const Duration(seconds: 2));
  final List<Map<String, Object?>> colorList =
      List<Map<String, Object?>>.from(source["colors"] as List);

  return colorList
      .where((json) => json.containsKey('value'))
      .map((e) => IpColors.fromJson(e))
      .toList();
}

List<IpColors> parseColors(String responseBody) {
  final parsed =
      (jsonDecode(responseBody) as List).cast<Map<String, dynamic>>();

  return parsed.map<IpColors>((json) => IpColors.fromJson(json)).toList();
}
