import 'package:flutter/material.dart';
import 'package:surf_flutter_courses_template/data/api/ip_photo.dart';
import 'package:surf_flutter_courses_template/ui/model/box_model.dart';

class PhotosList extends StatelessWidget {
  const PhotosList({super.key, required this.photos});

  final List<IpPhoto> photos;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
      ),
      itemCount: photos.length,
      itemBuilder: (context, index) {
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
