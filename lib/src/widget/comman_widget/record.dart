
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marvel/src/config/text_style.dart';

record() {
  return Container(
    width: Get.size.width,
    alignment: Alignment.center,
    child: Text('No Record Found',style: AppTextStyle.regular16.copyWith(fontWeight: FontWeight.bold))
  );
}

