import 'package:flutter/material.dart';

import 'package:surf_flutter_courses_template/core/app_color.dart';

import 'package:surf_flutter_courses_template/core/app_typography.dart';
import 'package:surf_flutter_courses_template/domain/model/datail_screen.dart';

import '../widget/snack_bar_widget.dart';

class BoxModel extends StatefulWidget {
  const BoxModel(
      {super.key,
      required this.color,
      required this.title,
      required this.hexValue});
  final Color color;
  final String title;
  final String hexValue;

  @override
  State<BoxModel> createState() => _BoxModelState();
}

class _BoxModelState extends State<BoxModel> {
  bool _value = false;

  get hexValue => widget.hexValue;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DatailScreen(
              boxModel: BoxModel(
                color: widget.color,
                title: widget.title,
                hexValue: widget.hexValue,
              ),
            ),
          ),
        );
      },
      onLongPress: () {
        setState(() {
          _doCalc();
        });
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
              color: widget.color,
              borderRadius: BorderRadius.circular(16),
            ),
          ),
          Text(
            widget.title,
            style: text12Regular.copyWith(color: textColorDarkBlue),
          ),
          Row(
            children: [
              Text(
                widget.hexValue,
                style: text12Regular.copyWith(color: textColorDarkBlue),
              ),
              const SizedBox(
                width: 5,
              ),
              _value
                  ? const Icon(
                      Icons.copy,
                      size: 12,
                      color: iconColor,
                    )
                  : Container()
            ],
          ),
        ],
      ),
    );
  }

  void _doCalc() async {
    _value = true;
    snackBarWidget(context, data: hexValue);

    await Future.delayed(
      const Duration(milliseconds: 4500),
    );
    _setCal(false);
  }

  void _setCal(bool value) {
    setState(() {
      _value = value;
    });
  }
}
