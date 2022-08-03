import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marvel/src/config/colors.dart';
import 'package:marvel/src/config/text_style.dart';

Widget buttonView(
    {@required String? title,
    Color? titleColor,
    Color? backgroundColor,
    double? height,
    double? width,
    Widget? value,
    bool? isValueBox,
    double? borderRadius,
    double? leftPadding,
    double? rightPadding,
    double? topPadding,
    double? bottomPadding,
    Color? borderColor,
    double buttonPadding = 16,
    double? borderSize,
    Function()? onPressed}) {
  return Container(
    padding: EdgeInsets.only(
        left: leftPadding ?? 0,
        right: rightPadding ?? 0,
        top: topPadding ?? 0,
        bottom: bottomPadding ?? 0),
    child: GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: buttonPadding),
        width: width ?? Get.size.width / 6,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            border: Border.all(
              color: borderColor ?? AppColors.appGreenColor,
              width: borderSize ?? 1,
            ),
            color: backgroundColor ?? AppColors.appGreenColor,
            borderRadius: BorderRadius.circular(borderRadius ?? 10)),
        child: value ??
            Text(
              title!,
              style: AppTextStyle.regular15.copyWith(color: titleColor ?? AppColors.whiteColor),
            ),
      ),
    ),
  );
}
