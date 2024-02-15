import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:surf_flutter_courses_template/core/app_color.dart';
import 'package:surf_flutter_courses_template/core/app_strings.dart';
import 'package:surf_flutter_courses_template/core/app_typography.dart';

// модельное окно с сообщением о копировании

void snackBar(
  BuildContext context, {
  required data,
}) {
  Clipboard.setData(ClipboardData(text: data)).then((_) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: AppColor.boxColorDarkBlueOp60,
        width: 180,
        padding: const EdgeInsets.all(24),
        content: Center(
            child: Text(
          AppStrings.copyHex,
          style: AppTypography.textText16Regular
              .copyWith(color: AppColor.colorWhite),
        )),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
      ),
    );
  });
}
