import 'package:flutter/material.dart';
import 'package:surf_flutter_courses_template/core/app_color.dart';
import 'package:surf_flutter_courses_template/core/app_strings.dart';
import 'package:surf_flutter_courses_template/core/app_typography.dart';
import 'package:surf_flutter_courses_template/data/api/ip_colors.dart';
import 'package:surf_flutter_courses_template/data/convert_response.dart';
import 'package:surf_flutter_courses_template/domain/model/colors_list.dart';

// Главный экран

class MyHomePage extends StatelessWidget {
  const MyHomePage({
    super.key,
  });

  @override
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 155,
        title: Text(
          AppStrings.appTitle,
          style:
              AppTypography.textText30Blood.copyWith(color: AppColor.darkBlue),
          maxLines: 2,
        ),
      ),
      body: FutureBuilder<List<IpColors>>(
        future: fetchColros(),
        builder: (_, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error?.toString() ?? 'Has Error'),
            );
          } else if (snapshot.hasData) {
            return ColorsList(photos: snapshot.data!);
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
