import 'package:flutter/material.dart';

import '../../theme/theme_helper.dart';
import '../utils/size_utils.dart';
import 'custom_text_style.dart';

class CommonWidgets {
  static Widget primaryButton({
    required String text,
    required VoidCallback onPressed,
  }) {
    return SizedBox(
      width: double.infinity,
      height: getSize(46),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: appTheme.blue400,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
        child: Text(
          text,
          style: CustomTextStyles.titleMediumWhiteA700,
        ),
      ),
    );
  }
}
