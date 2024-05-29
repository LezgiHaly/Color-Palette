import 'package:flutter/material.dart';
import 'package:surf_flutter_courses_template/data/api/ip_colors.dart';
import 'package:surf_flutter_courses_template/ui/model/box_model.dart';


// Экран с списком цветов

class ColorsList extends StatelessWidget {
  const ColorsList({super.key, required this.photos});

  final List<IpColors> photos;

  @override
  Widget build(context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        mainAxisSpacing: 10,
        crossAxisCount: 3,
      ),
      itemCount: photos.length,
      itemBuilder: (_, index) {
        final photo = photos[index];

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: BoxModel(
            color: photo.color,
            title: photo.name,
            hexValue: photo.value,
          ),
        );
      },
    );
  }
}
