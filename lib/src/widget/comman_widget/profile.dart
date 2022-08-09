import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marvel/src/config/colors.dart';
import 'package:marvel/src/config/text_style.dart';
import 'package:marvel/src/widget/comman_widget/image_view.dart';

profile({
    required String name,
    required String path,
    required BuildContext context,
  }) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(30),
        topRight: Radius.circular(30),
        bottomRight: Radius.circular(40),
      ),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.darkBlackColor,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Flexible(
              flex: 5,
              child: Container(
                width: MediaQuery.of(context).size.width / 2,
                height: Get.size.height * 0.3,
                child: Hero(
                  tag: name,
                  child: imageView(
                    shape: BoxShape.rectangle,
                    imageURL: path,
                    title: name,
                    isLocalImage: false)
                ),
              ),
            ),
            Container(
              height: 5,
              width: MediaQuery.of(context).size.width / 2,
              color: Colors.red,
            ),
            Container(
              color: AppColors.darkBlackColor,
              width: MediaQuery.of(context).size.width / 2,
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text(
                    name,
                    style: AppTextStyle.regular13.copyWith(color: AppColors.whiteColor)
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
