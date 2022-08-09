import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:marvel/src/config/colors.dart';
import 'package:marvel/src/config/text_style.dart';

text({
  String? title1,
  String? title2,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(title1!,
        style: AppTextStyle.regular16.copyWith(color: AppColors.whiteColor,fontSize: 20)
      ),

      SizedBox(height: 10),

      Text(title2!,
        style: AppTextStyle.regular13.copyWith(color: AppColors.whiteColor)
      )
    ],
  );
}