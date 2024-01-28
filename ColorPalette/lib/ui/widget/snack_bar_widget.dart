import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:surf_flutter_courses_template/core/app_color.dart';
import 'package:surf_flutter_courses_template/core/app_string.dart';
import 'package:surf_flutter_courses_template/core/app_typography.dart';

void snackBarWidget(
  BuildContext context, {
  required data,
}) {
  Clipboard.setData(ClipboardData(text: data)).then((_) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: boxColorDarkBlue,
        width: 180,
        padding: const EdgeInsets.all(24),
        content: Center(
            child: Text(
          copyHex,
          style: text16Regular.copyWith(color: textColorWhite),
        )),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
      ),
    );
  });
}
