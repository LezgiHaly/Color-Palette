import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../core/app_color.dart';
import '../../core/app_typography.dart';

class DatailContainerWidaget extends StatelessWidget {
  const DatailContainerWidaget(
      {super.key, required this.title, required this.value});

  final String title;
  final dynamic value;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
              color: colorShadow, spreadRadius: 1, offset: const Offset(0, 17)),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: text16Regular.copyWith(color: textColorDarkBlue),
            ),
            const SizedBox(
              width: 14,
            ),
            Text(
              value,
              style: text16Regular.copyWith(color: textColorDarkBlue),
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
  final dynamic value;

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
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
              color: colorShadow, spreadRadius: 1, offset: const Offset(0, 17)),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              widget.title,
              style: text16Regular.copyWith(color: textColorDarkBlue),
            ),
            const SizedBox(
              width: 14,
            ),
            const SizedBox(
              width: 180,
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  _doCalc();
                });
              },
              child: Text(
                widget.value,
                style: text16Regular.copyWith(color: textColorDarkBlue),
              ),
            ),
            _value
                ? const Icon(
                    Icons.copy,
                    size: 12,
                    color: iconColor,
                  )
                : const Text('')
          ],
        ),
      ),
    );
  }

  void _doCalc() async {
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
