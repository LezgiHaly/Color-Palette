import 'dart:convert';

import 'api/ip_photo.dart';
import 'source.dart';

Future<List<IpPhoto>> fetchPhotos() async {
  await Future.delayed(const Duration(seconds: 2));
  final List<Map<String, Object?>> colorList =
      List<Map<String, Object?>>.from(source["colors"] as List);

  return colorList
      .where((json) => json.containsKey('value'))
      .map((e) => IpPhoto.fromJson(e))
      .toList();
}

List<IpPhoto> parsePhotos(String responseBody) {
  final parsed =
      (jsonDecode(responseBody) as List).cast<Map<String, dynamic>>();

  return parsed.map<IpPhoto>((json) => IpPhoto.fromJson(json)).toList();
}