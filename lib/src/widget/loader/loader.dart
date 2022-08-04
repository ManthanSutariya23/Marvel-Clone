import 'package:flutter/material.dart';
import 'package:marvel/src/config/colors.dart';
import 'package:marvel/src/config/images.dart';


load({
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
                  width: 100,
                  height: 100,
                  child: const CircularProgressIndicator(
                    strokeWidth: 3,
                    valueColor: AlwaysStoppedAnimation<Color>(
                        AppColors.whiteColor),
                  )),
              Container(
                  alignment: Alignment.center,
                  width: 70,
                  height: 70,
                  child: Image.asset(ImagePath.pngLogo)),
            ],
          ),
        ],
      ),
    ),
  );
}


