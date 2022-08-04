import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marvel/src/config/colors.dart';
import 'package:marvel/src/config/text_style.dart';

class MoreDetail extends StatelessWidget {
  final detail;
  MoreDetail({Key? key,this.detail}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: (Get.size.height * 0.06) * detail.length + 11,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey.withOpacity(0.5),
      ),
      child: ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        padding: EdgeInsets.all(0),
        itemCount: detail.length,
        itemBuilder: (context, index) {
          return Container(
            padding: EdgeInsets.all(10),
      width: Get.size.width,
      
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  detail[index]['type'].toString().toUpperCase() + " : ",
                  style: AppTextStyle.regular15.copyWith(color: AppColors.whiteColor),
                ),

                Expanded(
                  child: InkWell(
                    child: Text(detail[index]['url'],
                    style: AppTextStyle.regular15.copyWith(color: AppColors.whiteColor,fontWeight: FontWeight.normal),
                    maxLines: 2,
                    ),
                  ),
                )
              ],
            ),
          );
        }
      ),
    );
  }
}