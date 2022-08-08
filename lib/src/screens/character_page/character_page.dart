import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marvel/src/config/colors.dart';
import 'package:marvel/src/model/model.dart';
import 'package:marvel/src/model/model_variable.dart';
import 'package:marvel/src/screens/character_page/comics.dart';
import 'package:marvel/src/screens/character_page/more_detail.dart';
import 'package:marvel/src/screens/character_page/series.dart';
import 'package:marvel/src/widget/comman_widget/image_view.dart';
import 'package:marvel/src/widget/comman_widget/sizeboxs.dart';
import 'package:marvel/src/widget/comman_widget/title_widget.dart';
import 'package:marvel/src/widget/loader/loader.dart';

class CharacterPage extends StatefulWidget {
  final index;

  CharacterPage(this.index);

  @override
  State<CharacterPage> createState() => _CharacterPageState();
}

class _CharacterPageState extends State<CharacterPage> {

  static var comics,series,stories,events;
  bool loader = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    data();
  } 

  data() async {
    comics = await getDataWithend(arg: ModelVariable.character['data']['results'][widget.index]['comics']['collectionURI']);
    series = await getDataWithend(arg: ModelVariable.character['data']['results'][widget.index]['series']['collectionURI']);
    stories = await getDataWithend(arg: ModelVariable.character['data']['results'][widget.index]['stories']['collectionURI']);
    events = await getDataWithend(arg: ModelVariable.character['data']['results'][widget.index]['events']['collectionURI']);
    setState(() {
      loader = true;
    });
    Timer.periodic(Duration(seconds: 1), (timer) {
      if(comics != null && series != null && stories != null && events != null)
      {
        setState(() {
          loader = false;
        });
        timer.cancel();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff0D0C11),
      body: loader
      ? load(context: context)
      : SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.height / 2,
                  width: MediaQuery.of(context).size.width,
                  child: Hero(
                    tag: "",
                    child: imageView(
                      shape: BoxShape.rectangle,
                      imageURL: ModelVariable.character['data']['results'][widget.index]['thumbnail']['path']+"."+ModelVariable.character['data']['results'][widget.index]['thumbnail']['extension'],
                      title: ModelVariable.character['data']['results'][widget.index]['name'],
                      isLocalImage: false
                    ),
                  ),
                ),
                Positioned(
                  top: 50,
                  child: IconButton(
                    icon: Icon(
                      Icons.arrow_back_ios,
                      size: 30,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    ModelVariable.character['data']['results'][widget.index]['name'].toUpperCase(),
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    ModelVariable.character['data']['results'][widget.index]['description'],
                    style: TextStyle(
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.justify,
                  ),

                  titleHeading(title: 'Comics'),

                  SizedBox(
                    height: 20,
                  ),

                  Container(
                    height: Get.size.height * 0.4,
                    child: Comics(comics)
                  ),

                  titleHeading(title: 'Series'),

                  SizedBox(
                    height: 20,
                  ),

                  Container(
                    height: Get.size.height * 0.4,
                    child: Series(series)
                  ),

                  SizedBox(
                    height: 20,
                  ),

                  titleHeading(title: 'Stories'),

                  SizedBox(
                    height: 20,
                  ),

                  Container(
                    height: Get.size.height * 0.3,
                    child: Series(stories)
                  ),

                  SizedBox(
                    height: 20,
                  ),
                  
                  titleHeading(title: 'Events'),

                  SizedBox(
                    height: 20,
                  ),

                  Container(
                    height: Get.size.height * 0.3,
                    child: Series(events)
                  ),

                  titleHeading(title: 'More Details'),

                  SizedBox(
                    height: 20,
                  ),

                  Container(
                    child: MoreDetail(detail: ModelVariable.character['data']['results'][widget.index]['urls'],),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

