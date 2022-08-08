import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marvel/src/config/colors.dart';
import 'package:marvel/src/config/text_style.dart';
import 'package:marvel/src/widget/comman_widget/image_view.dart';

class Series extends StatelessWidget {
  final comics;

  Series(this.comics);

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      options: CarouselOptions(
        viewportFraction: 0.6,
        height: Get.size.height * 0.35,
        enlargeCenterPage: true,
      ),
      itemCount: comics['data']['count'],
      itemBuilder: (context,index,i) {
        return Container(
          margin: EdgeInsets.only(right: 10),
          width: Get.size.width * 0.5,
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.primaryGreyColor,width: 1),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Flexible(
                flex: 5,
                child: Container(
                  width: Get.size.width * 0.5,
                  height: Get.size.height * 0.19,
                  child: imageView(
                    imageURL: comics['data']['results'][index]['thumbnail'] == null 
                  ? "http://i.annihil.us/u/prod/marvel/i/mg/b/40/image_not_available.jpg"
                  : comics['data']['results'][index]['thumbnail']['path'] + "." + comics['data']['results'][index]['thumbnail']['extension'],
                  title: "C",
                    boxFit: BoxFit.fill,
                    height: Get.size.height * 0.15,
                    borderColor: AppColors.darkBlackColor, 
                    isLocalImage: false,
                    shape: BoxShape.rectangle
                  ),
                ),
              ),
              Container(
                width: Get.size.width * 0.5,
                height: Get.size.height * 0.15,
                padding: EdgeInsets.symmetric(horizontal: 7),
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
