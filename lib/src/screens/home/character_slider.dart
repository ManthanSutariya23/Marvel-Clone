import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';
import 'package:marvel/src/config/colors.dart';
import 'package:marvel/src/config/text_style.dart';
import 'package:marvel/src/model/model_variable.dart';
import 'package:marvel/src/screens/character_page/character_page.dart';
import 'package:marvel/src/widget/comman_widget/image_view.dart';

class CharacterSlider extends StatefulWidget {
  @override
  _CharacterSliderState createState() => _CharacterSliderState();
}

class _CharacterSliderState extends State<CharacterSlider> {
  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: ModelVariable.character['data']['results'].length,
      itemBuilder: (context, index, i) => CharacterCard(index), 
      options: CarouselOptions(
        viewportFraction: 0.6,
        height: 340,
        enlargeCenterPage: true,
      ),
    );
  }
}

class CharacterCard extends StatelessWidget {
  final index;

  CharacterCard(this.index);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => CharacterPage(index)));
      },
      child: ClipRRect(
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
                  height: Get.size.height * 0.4,
                  child: Hero(
                    tag: ModelVariable.character['data']['results'][index]['name'],
                    child: imageView(
                      shape: BoxShape.rectangle,
                      imageURL: ModelVariable.character['data']['results'][index]['thumbnail']['path']+"."+ModelVariable.character['data']['results'][index]['thumbnail']['extension'],
                      title: ModelVariable.character['data']['results'][index]['name'],
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
                child: Text(
                  ModelVariable.character['data']['results'][index]['name'].toUpperCase(),
                  style: AppTextStyle.regular13.copyWith(color: AppColors.whiteColor)
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
