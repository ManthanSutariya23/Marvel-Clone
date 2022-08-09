import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marvel/src/config/colors.dart';
import 'package:marvel/src/config/text_style.dart';
import 'package:marvel/src/widget/url_launcher/url_launcher.dart';

class MoreDetail extends StatelessWidget {
  final detail;
  MoreDetail({Key? key,this.detail}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 
      detail.length == 4 || detail.length == 3
        ? Get.size.height * 0.18
        : Get.size.height * 0.1,
      child: GridView.builder(
        physics: NeverScrollableScrollPhysics(),
        padding: EdgeInsets.all(0),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 10,
          childAspectRatio: Get.size.height * 0.003,
        ),
        itemCount: detail.length,
        itemBuilder: (BuildContext context, int i) {

          return GestureDetector(
            onTap: () {
              launchInBrowser(detail[i]['url']);
            },
            child: Container(
              margin: EdgeInsets.only(right: 8),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: AppColors.appGreenColor,
                borderRadius: BorderRadius.circular(10)
              ),
              child: Text('${detail[i]['type'].toString().toUpperCase()}',
                style: TextStyle(
                  color: AppColors.whiteColor,
                ),
              ),
            ),
          );
        }
      ),
    );
  }
}