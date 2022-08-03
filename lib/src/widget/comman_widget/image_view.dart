import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marvel/src/config/colors.dart';
import 'package:marvel/src/config/text_style.dart';

Widget imageView({
  @required imageURL,
  @required String? title,
  @required bool? isLocalImage,
  Color? borderColor,
  Color? backgroundColor,
  double? height,
  double? width,
  double? rightMargin,
  double? topMargin,
  double? bottomMargin,
  double? leftMargin,
  BoxShape? shape,
}) {
  return Container(
    height: height ?? Get.size.width / 6,
    width: width ?? Get.size.width / 6,
    margin:
        EdgeInsets.only(right: rightMargin ?? 0, bottom: bottomMargin ?? 0, left: leftMargin ?? 0, top: topMargin ?? 0),
    decoration: BoxDecoration(
        shape: shape ?? BoxShape.circle,
        color: backgroundColor ?? AppColors.primaryWhiteBackgroundColor.withOpacity(0.5),
        borderRadius: shape != null && shape == BoxShape.rectangle ? BorderRadius.circular(10) : null,
        border: Border.all(color: borderColor ?? AppColors.transparentColor)),
    child: imageURL != null && imageURL != "null" && imageURL != "" && imageURL.toString().isNotEmpty
        ? (imageURL!.toString().startsWith("http") || imageURL!.toString().startsWith("https"))
            ? ClipRRect(
                borderRadius: BorderRadius.circular(shape != null && shape == BoxShape.rectangle ? 10 : 500),
                child: CachedNetworkImage(
                  height: Get.size.width / 6,
                  width: Get.size.width / 6,
                  fit: BoxFit.cover,
                  errorWidget: (context, url, error) => Center(
                    child: Text(
                      title == null || title == "" ? " " : title.split(" ")[0],
                      style: AppTextStyle.regular16
                          .copyWith(fontSize: 20, color: AppColors.whiteColor, fontWeight: FontWeight.bold),
                    ),
                  ),
                  imageUrl: imageURL,
                  filterQuality: FilterQuality.high,
                  imageBuilder: (context, imageProvider) => Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(image: imageProvider, fit: BoxFit.fill),
                    ),
                  ),
                  placeholder: (context, url) => Center(
                    child: Text(
                      title == null || title == "" ? " " : title[0],
                      style: AppTextStyle.regular16
                          .copyWith(fontSize: 20, color: AppColors.whiteColor, fontWeight: FontWeight.bold),
                    ),
                  ),
                ))
            : isLocalImage!
                ? ClipRRect(
                    borderRadius: BorderRadius.circular(shape != null && shape == BoxShape.rectangle ? 10 : 500),
                    child: Image.asset(
                      imageURL!,
                      height: Get.size.width / 6,
                      width: Get.size.width / 6,
                      fit: BoxFit.cover,
                    ))
                : ClipRRect(
                    borderRadius: BorderRadius.circular(shape != null && shape == BoxShape.rectangle ? 10 : 500),
                    child: Image.file(
                      File(imageURL!),
                      height: Get.size.width / 6,
                      width: Get.size.width / 6,
                      fit: BoxFit.cover,
                    ))
        : Center(
            child: Text(
              title == null || title == "" ? " " : title[0],
              style: AppTextStyle.regular16
                  .copyWith(fontSize: 20, color: AppColors.whiteColor, fontWeight: FontWeight.bold),
            ),
          ),
  );
}
