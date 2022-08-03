import 'package:flutter/material.dart';
import 'package:marvel/src/config/colors.dart';
import 'package:marvel/src/config/images.dart';


loader({
  @required BuildContext? context,
}) {
  return Center(
    child: Material(
      color: Colors.transparent,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                  width: 80,
                  height: 80,
                  child: const CircularProgressIndicator(
                    strokeWidth: 2,
                    valueColor: AlwaysStoppedAnimation<Color>(
                        AppColors.appGreenColor),
                  )),
              Container(
                  alignment: Alignment.center,
                  width: 70,
                  height: 70,
                  child: Image.asset(ImagePath.roundLogo)),
            ],
          ),
        ],
      ),
    ),
  );
}


