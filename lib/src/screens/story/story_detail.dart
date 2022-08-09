import 'dart:async';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:marvel/src/config/colors.dart';
import 'package:marvel/src/config/text_style.dart';
import 'package:marvel/src/model/model.dart';
import 'package:marvel/src/screens/character_page/series.dart';
import 'package:marvel/src/widget/comman_widget/image_view.dart';
import 'package:marvel/src/widget/comman_widget/profile.dart';
import 'package:marvel/src/widget/comman_widget/text.dart';
import 'package:marvel/src/widget/comman_widget/title_widget.dart';
import 'package:marvel/src/widget/loader/loader.dart';
import 'package:marvel/src/widget/url_launcher/url_launcher.dart';

class Story_Detail extends StatefulWidget {
  var comics;
  int index;
  Story_Detail({Key? key,this.comics,required this.index}) : super(key: key);

  @override
  State<Story_Detail> createState() => _Story_DetailState();
}

class _Story_DetailState extends State<Story_Detail> {
  bool loader = true;
  static var creater,series,comics,events,character;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    data();
  }

  data() async {
    creater = await getDataWithend(arg: widget.comics['data']['results'][widget.index]['creators']['collectionURI']);
    character = await getDataWithend(arg: widget.comics['data']['results'][widget.index]['characters']['collectionURI']);
    comics = await getDataWithend(arg: widget.comics['data']['results'][widget.index]['comics']['collectionURI']);
    events = await getDataWithend(arg: widget.comics['data']['results'][widget.index]['events']['collectionURI']);
    series = await getDataWithend(arg: widget.comics['data']['results'][widget.index]['series']['collectionURI']);
    setState(() {
      loader = true;
    });
    Timer.periodic(Duration(seconds: 1), (timer) {
      if(creater != null && character != null && comics != null && events != null && series != null)
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
                      imageURL: 
                      widget.comics['data']['results'][widget.index]['thumbnail'] == null
                      ? "http://i.annihil.us/u/prod/marvel/i/mg/b/40/image_not_available.jpg"
                      : widget.comics['data']['results'][widget.index]['thumbnail']['path']+"."+widget.comics['data']['results'][widget.index]['thumbnail']['extension'],
                      title: widget.comics['data']['results'][widget.index]['name'],
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
                children: [
                  Text(
                    widget.comics['data']['results'][widget.index]['title'].toUpperCase(),
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),

                  SizedBox(height: 30),

                  // Date
                  Container(
                    child: 
                    widget.comics['data']['results'][widget.index]['modified'] == ""
                    ? SizedBox()
                    : Column(
                      children: [
                        text(
                          title1: "Modified Date",
                          title2: DateFormat.yMMMMEEEEd().format(DateTime.parse(widget.comics['data']['results'][widget.index]['modified'])).toString()
                        ),

                        SizedBox(height: 30),
                      ],
                    ),
                  ),

                  // creators
                  Container(
                    child: 
                    creater['data']['results'].length == 0
                    ? SizedBox()
                    : Column(
                      children: [
                        titleHeading(title: 'Creators'),

                          SizedBox(height: 20),

                          Container(
                            height: Get.size.height * 0.3,
                            child: CarouselSlider.builder(
                              itemCount: creater['data']['count'],
                              options: CarouselOptions(
                                viewportFraction: 0.6,
                                height: 340,
                                enlargeCenterPage: true,
                              ),
                              itemBuilder: (context, index, i) => profile(
                                name: creater['data']['results'][index]['fullName'],
                                path: creater['data']['results'][index]['thumbnail']['path'] + "." + creater['data']['results'][index]['thumbnail']['extension'],
                                context: context
                              ) 
                            ) 
                          ),
                          
                          SizedBox(height: 30,),
                      ],
                    ),
                  ),

                  // characters
                  Container(
                    child: 
                    character['data']['results'].length == 0
                    ? SizedBox()
                    : Column(
                      children: [
                        titleHeading(title: 'Character'),

                        SizedBox(height: 20),

                        Container(
                          height: Get.size.height * 0.3,
                          child: CarouselSlider.builder(
                            itemCount: character['data']['count'],
                            options: CarouselOptions(
                              viewportFraction: 0.6,
                              height: 340,
                              enlargeCenterPage: true,
                            ),
                            itemBuilder: (context, index, i) => profile(
                              name: character['data']['results'][index]['name'],
                              path: character['data']['results'][index]['thumbnail']['path'] + "." + character['data']['results'][index]['thumbnail']['extension'],
                              context: context
                            ) 
                          ) 
                        ),
                        
                        SizedBox(height: 30,),
                      ],
                    ),
                  ),

                  // ser
                  Container(
                    child: 
                    series['data']['results'].length != 0
                    ? Column(
                      children: [
                        titleHeading(title: 'Series'),

                        SizedBox(height: 20),

                        Container(
                          height: Get.size.height * 0.4,
                          child: Series(series,"comics")
                        ),
                        
                        SizedBox(height: 30,),
                      ],
                    )
                    : SizedBox()
                  ),

                  
                  // stories
                  Container(
                    child: 
                    comics['data']['results'].length != 0
                    ? Column(
                      children: [
                        titleHeading(title: 'Stories'),

                        SizedBox(height: 20),

                        Container(
                          height: Get.size.height * 0.4,
                          child: Series(comics,"comics")
                        ),
                        
                        SizedBox(height: 30,),
                      ],
                    )
                    : SizedBox()
                  ),

                  // events
                  Container(
                    child: 
                    events['data']['results'].length != 0
                    ? Column(
                      children: [
                        titleHeading(title: 'Events'),

                        SizedBox(height: 20),

                        Container(
                          height: Get.size.height * 0.4,
                          child: Series(events,"events")
                        ),
                        
                        SizedBox(height: 30,),
                      ],
                    )
                    : SizedBox()
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




