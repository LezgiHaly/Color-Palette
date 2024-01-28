import 'package:flutter/material.dart';
import 'package:surf_flutter_courses_template/core/app_color.dart';
import 'package:surf_flutter_courses_template/core/app_string.dart';
import 'package:surf_flutter_courses_template/core/app_typography.dart';

import '../data/api/ip_photo.dart';
import '../data/convert_response.dart';
import '../domain/model/photos_list.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 155,
        title: Text(
          appBarString,
          style: text30Blood.copyWith(color: textColorDarkBlue),
          maxLines: 2,
        ),
      ),
      body: FutureBuilder<List<IpPhoto>>(
        future: fetchPhotos(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error?.toString() ?? 'Has Error'),
            );
          } else if (snapshot.hasData) {
            return PhotosList(photos: snapshot.data!);
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
