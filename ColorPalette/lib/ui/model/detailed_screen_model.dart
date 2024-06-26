import 'package:flutter/material.dart';
import 'package:surf_flutter_courses_template/core/app_color.dart';
import 'package:surf_flutter_courses_template/core/app_strings.dart';
import 'package:surf_flutter_courses_template/core/app_typography.dart';
import 'package:surf_flutter_courses_template/ui/widget/datail_container_widget.dart';

// Экран дельной компановки цвета

class DetailedScreenModel extends StatelessWidget {
  const DetailedScreenModel(
      {super.key,
      required this.color,
      required this.title,
      required this.hexValue,
      required this.rgbRed,
      required this.rgbGreen,
      required this.rgbBlue});

  final Color color;
  final String title;
  final String hexValue;
  final int rgbRed;
  final int rgbGreen;
  final int rgbBlue;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(children: [
          SizedBox(
            width: 500,
            height: 375,
            child: DecoratedBox(
              decoration: BoxDecoration(color: color),
            ),
          ),
          Positioned(
            top: 54,
            left: 16,
            child: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(
                Icons.arrow_back_ios_new,
                color: Colors.white,
                size: 24,
              ),
            ),
          ),
        ]),
        const SizedBox(height: 32),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: AppTypography.textText30Blood
                    .copyWith(color: AppColor.darkBlue),
              ),
              const SizedBox(height: 16),
              DatailContainerWidagetWithBUtton(
                title: AppStrings.hex,
                value: hexValue,
              ),
              const SizedBox(height: 36),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  DatailContainerWidaget(
                    title: AppStrings.red,
                    value: '$rgbRed',
                  ),
                  DatailContainerWidaget(
                    title: AppStrings.green,
                    value: '$rgbGreen',
                  ),
                  DatailContainerWidaget(
                    title: AppStrings.blue,
                    value: '$rgbBlue',
                  ),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
