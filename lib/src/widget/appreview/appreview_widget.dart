import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marvel/src/config/colors.dart';
import 'package:marvel/src/config/text_style.dart';

appReviewHome({
  @required String? name,
  @required String? msg,
  @required var rate,
  bool isRate = true,
}) {
  return Container(
    margin: EdgeInsets.only(right: 10),
    height: Get.size.height * 0.2,
    child: Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8)
      ),
      child: Container(
        width: Get.size.width * 0.8 + 10 + 10,
        padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            SizedBox(height: 10),

            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name!,
                    style: AppTextStyle.regular18,
                  ),

                  isRate
                  ? Row(
                    children: [
                      for (var i = 0; i < rate; i++) 
                      Icon(Icons.star,
                        size: 17,
                        color: AppColors.primaryYellowColor,
                      ),

                      for (var i = 0; i < 5 - rate; i++) 
                      Icon(Icons.star_border,
                        size: 17,
                        color: AppColors.primaryYellowColor,
                      ),
                    ]
                  )
                  : SizedBox(),
                ],
              ),
            ),

            SizedBox(height: 10),

            Text('"$msg"',
              maxLines: 3,
              textAlign: TextAlign.justify,
              overflow: TextOverflow.ellipsis,
              style: AppTextStyle.regular15.copyWith(color: Colors.grey[600],fontFamily: "Quintessential",height: 1.2),
            ),
          ],
        ),
      ),
    ),
  );
}


appReview({
  @required String? name,
  @required String? msg,
  @required var rate,
  bool isRate = true,
}) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 10),
    height: Get.size.height * 0.2,
    child: Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8)
      ),
      child: Container(
        width: Get.size.width,
        padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            SizedBox(height: 10),

            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name!,
                    style: AppTextStyle.regular18,
                  ),

                  isRate
                  ? Row(
                    children: [
                      for (var i = 0; i < rate; i++) 
                      Icon(Icons.star,
                        size: 17,
                        color: AppColors.primaryYellowColor,
                      ),

                      for (var i = 0; i < 5 - rate; i++) 
                      Icon(Icons.star_border,
                        size: 17,
                        color: AppColors.primaryYellowColor,
                      ),
                    ]
                  )
                  : SizedBox(),
                ],
              ),
            ),

            SizedBox(height: 10),

            Text('"$msg"',
              maxLines: 7,
              textAlign: TextAlign.justify,
              overflow: TextOverflow.ellipsis,
              style: AppTextStyle.regular15.copyWith(color: Colors.grey[600],fontFamily: "Quintessential",height: 1.2),
            ),
          ],
        ),
      ),
    ),
  );
}

