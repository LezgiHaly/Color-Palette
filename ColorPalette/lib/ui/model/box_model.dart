import 'package:flutter/material.dart';
import 'package:surf_flutter_courses_template/core/app_color.dart';
import 'package:surf_flutter_courses_template/core/app_typography.dart';
import 'package:surf_flutter_courses_template/domain/model/detailed_screen.dart';
import 'package:surf_flutter_courses_template/ui/widget/snack_bar_widget.dart';

// Карточка контейнера с цветом

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
  bool _copying = false;

  get hexValue => widget.hexValue;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailedScreen(
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
          SizedBox(
            height: 100,
            width: 100,
            child: SizedBox(
              height: 100,
              width: 100,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: widget.color,
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
            ),
          ),
          Text(
            widget.title,
            style: AppTypography.textText12Regular
                .copyWith(color: AppColor.darkBlue),
          ),
          Expanded(
            child: Row(
              children: [
                Text(
                  widget.hexValue,
                  style: AppTypography.textText12Regular
                      .copyWith(color: AppColor.darkBlue),
                ),
                const SizedBox(width: 5),
                _copying
                    ? const Icon(
                        Icons.copy,
                        size: 12,
                        color: AppColor.iconColor,
                      )
                    : const SizedBox.shrink()
              ],
            ),
          ),
        ],
      ),
    );
  }

// метод копирования  и вызова модального окна с сообщением
  void _doCalc() async {
    _copying = true;
    snackBar(context, data: hexValue);

    await Future.delayed(
      const Duration(milliseconds: 4500),
    );
    _setCal(false);
  }

// метод изменения булевого значения на выбранный
  void _setCal(bool value) {
    setState(() {
      _copying = value;
    });
  }
}
