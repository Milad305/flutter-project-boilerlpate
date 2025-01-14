import 'package:flutter/material.dart';

import '../../utils/size_utils.dart';
import '../custom_icon_button.dart';
import '../custom_image_view.dart';

// ignore: must_be_immutable
class AppbarIconbutton extends StatelessWidget {
  AppbarIconbutton({
    Key? key,
    this.imagePath,
    this.svgPath,
    this.margin,
    this.onTap,
    this.color,
  }) : super(
          key: key,
        );

  String? imagePath;

  String? svgPath;

  EdgeInsetsGeometry? margin;

  Function? onTap;

  Color? color;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap?.call();
      },
      child: Padding(
        padding: margin ?? EdgeInsets.zero,
        child: CustomIconButton(
          height: 48,
          width: 48,
          padding: getPadding(
            all: 14,
          ),
          child: CustomImageView(
            svgPath: svgPath,
            imagePath: imagePath,
            color: color,
          ),
        ),
      ),
    );
  }
}
