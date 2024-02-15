import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:surf_flutter_courses_template/core/app_color.dart';
import 'package:surf_flutter_courses_template/core/app_typography.dart';

// Карточка с данными о названии и RGB выбранного цвета в детельном экране

class DatailContainerWidaget extends StatelessWidget {
  const DatailContainerWidaget(
      {super.key, required this.title, required this.value});

  final String title;
  final dynamic value;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
              color: AppColor.colorShadowOp02,
              spreadRadius: 1,
              offset: const Offset(0, 17)),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: AppTypography.textText16Regular
                  .copyWith(color: AppColor.darkBlue),
            ),
            const SizedBox(width: 14),
            Text(
              value,
              style: AppTypography.textText16Regular
                  .copyWith(color: AppColor.darkBlue),
            ),
          ],
        ),
      ),
    );
  }
}

class DatailContainerWidagetWithBUtton extends StatefulWidget {
  const DatailContainerWidagetWithBUtton(
      {super.key, required this.title, required this.value});

  final String title;
  final String value;

  @override
  State<DatailContainerWidagetWithBUtton> createState() =>
      _DatailContainerWidagetWithBUttonState();
}

class _DatailContainerWidagetWithBUttonState
    extends State<DatailContainerWidagetWithBUtton> {
  get hexValue => widget.value;

  bool _value = false;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
              color: AppColor.colorShadowOp02,
              spreadRadius: 1,
              offset: const Offset(0, 17)),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              widget.title,
              style: AppTypography.textText16Regular
                  .copyWith(color: AppColor.darkBlue),
            ),
            const SizedBox(width: 14),
            const SizedBox(width: 180),
            GestureDetector(
              onTap: () {
                setState(() {
                  _doCalc();
                });
              },
              child: Text(
                widget.value,
                style: AppTypography.textText16Regular
                    .copyWith(color: AppColor.darkBlue),
              ),
            ),
            _value
                ? const Icon(
                    Icons.copy,
                    size: 12,
                    color: AppColor.iconColor,
                  )
                : const SizedBox.shrink()
          ],
        ),
      ),
    );
  }

  Future<void> _doCalc() async {
    Clipboard.setData(ClipboardData(text: hexValue));
    _value = true;

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
