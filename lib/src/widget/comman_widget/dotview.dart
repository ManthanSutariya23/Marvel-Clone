import 'package:flutter/material.dart';
import 'package:marvel/src/config/colors.dart';

Widget dotView({
  @required BuildContext? context,
  @required int? dotindex,
}) {
  return Container(
    padding: const EdgeInsets.only(right: 10),
    child: Icon(
      Icons.circle,
      color: dotindex == 0
          ? AppColors.primaryPurpleColor
          : dotindex == 1
              ? AppColors.primaryPurpleColor
              : dotindex == 2
                  ? AppColors.primaryPurpleColor
                  : AppColors.primaryGreyColor,
      size: dotindex == 0 ? 15 : 10,
    ),
  );
}
