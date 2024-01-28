import 'package:flutter/material.dart';

import 'package:surf_flutter_courses_template/ui/model/box_model.dart';
import 'package:surf_flutter_courses_template/ui/model/datai_box_model.dart';

class DatailScreen extends StatelessWidget {
  const DatailScreen(
     {
    super.key, required this.boxModel,  
  });

  final BoxModel boxModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DeteilBoxModel(
          color: boxModel.color,
          title: boxModel.title,
          hexValue: boxModel.hexValue,
          rgbRed: boxModel.color.red,
          rgbGreen: boxModel.color.green,
          rgbBlue: boxModel.color.blue),
    );
  }
}
