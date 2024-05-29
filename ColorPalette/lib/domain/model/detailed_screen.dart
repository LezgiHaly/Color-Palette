import 'package:flutter/material.dart';
import 'package:surf_flutter_courses_template/ui/model/box_model.dart';
import 'package:surf_flutter_courses_template/ui/model/detailed_screen_model.dart';

// модель детального экрана компоновки

class DetailedScreen extends StatelessWidget {
  const DetailedScreen({
    super.key,
    required this.boxModel,
  });

  final BoxModel boxModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DetailedScreenModel(
          color: boxModel.color,
          title: boxModel.title,
          hexValue: boxModel.hexValue,
          rgbRed: boxModel.color.red,
          rgbGreen: boxModel.color.green,
          rgbBlue: boxModel.color.blue),
    );
  }
}
