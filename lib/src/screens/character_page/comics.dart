import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marvel/src/config/colors.dart';
import 'package:marvel/src/config/text_style.dart';
import 'package:marvel/src/constant/constants.dart';
import 'package:marvel/src/widget/comman_widget/image_view.dart';
import 'package:marvel/src/widget/comman_widget/sizeboxs.dart';

class Comics extends StatelessWidget {
  final comics;

  Comics(this.comics);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.all(0),
      physics: NeverScrollableScrollPhysics(),
      itemCount: comics['data']['count'],
      itemBuilder: (context,index) {
        return Container(
          height: Get.size.height * 0.15,
          margin: EdgeInsets.only(top: index == 0 ? 0 : 10),
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.primaryGreyColor,width: 1),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width / 2 - 25,
                height: Get.size.height * 0.15,
                child: imageView(
                  imageURL: comics['data']['results'][index]['thumbnail']['path'] + "." + comics['data']['results'][index]['thumbnail']['extension'],
                  title: "C",
                  borderColor: AppColors.darkBlackColor, 
                  isLocalImage: false,
                  shape: BoxShape.rectangle
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width / 2 - 25,
                height: Get.size.height * 0.15,
                padding: EdgeInsets.only(right: 5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      comics['data']['results'][index]['title'],
                      maxLines: 3,
                      style: AppTextStyle.regular14.copyWith(color: AppColors.whiteColor)
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      comics['data']['results'][index]['description'] ?? "",
                      maxLines: 3,
                      style: AppTextStyle.regular11.copyWith(color: AppColors.whiteColor,fontWeight: FontWeight.normal),
                      textAlign: TextAlign.justify,
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      }
    );
  }
}
