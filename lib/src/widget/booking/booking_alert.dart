import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:marvel/src/config/colors.dart';

AwesomeDialog cancleDialog(BuildContext context,Function() ontap) {
  return AwesomeDialog(
    context: context,
    dialogType: DialogType.NO_HEADER,
    borderSide: BorderSide(color: AppColors.appGreenColor, width: 1),
    width: 350,
    btnOkColor: AppColors.appGreenColor,
    btnCancelColor: AppColors.appGreenColor,
    buttonsBorderRadius: BorderRadius.all(Radius.circular(2)),
    headerAnimationLoop: false,
    animType: AnimType.SCALE,
    title: 'Are You Sure ',
    showCloseIcon: true,
    btnCancelOnPress: () {},
    btnOkOnPress: ontap,
  )..show();
}

  


