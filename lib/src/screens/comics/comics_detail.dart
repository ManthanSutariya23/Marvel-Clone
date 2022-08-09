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

class Comics_Detail extends StatefulWidget {
  var comics;
  int index;
  Comics_Detail({Key? key,this.comics,required this.index}) : super(key: key);

  @override
  State<Comics_Detail> createState() => _Comics_DetailState();
}

class _Comics_DetailState extends State<Comics_Detail> {
  bool loader = true;
  static var creater,series,stories,events,character;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    data();
  }

  data() async {
    creater = await getDataWithend(arg: widget.comics['data']['results'][widget.index]['creators']['collectionURI']);
    character = await getDataWithend(arg: widget.comics['data']['results'][widget.index]['characters']['collectionURI']);
    stories = await getDataWithend(arg: widget.comics['data']['results'][widget.index]['stories']['collectionURI']);
    events = await getDataWithend(arg: widget.comics['data']['results'][widget.index]['events']['collectionURI']);
    setState(() {
      loader = true;
    });
    Timer.periodic(Duration(seconds: 1), (timer) {
      if(creater != null && character != null && stories != null && events != null)
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
                      imageURL: widget.comics['data']['results'][widget.index]['thumbnail']['path']+"."+widget.comics['data']['results'][widget.index]['thumbnail']['extension'],
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
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    widget.comics['data']['results'][widget.index]['description'] ?? "",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.justify,
                  ),

                  SizedBox(height: 30),

                  titleHeading(title: 'Dates'),

                  SizedBox(height: 20,),

                  Container(
                    child: 
                    widget.comics['data']['results'][widget.index]['modified'] == ""
                    ? SizedBox()
                    : Column(
                      children: [
                        text(
                          title1: "Modified Date",
                          title2: DateFormat.yMMMMd().format(DateTime.parse(widget.comics['data']['results'][widget.index]['modified'])).toString()
                        ),

                        SizedBox(height: 30),
                      ],
                    ),
                  ),

                  Container(
                    child: 
                    widget.comics['data']['results'][widget.index]['dates'].length == 0
                    ? SizedBox()
                    : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        for(var i=0; i<widget.comics['data']['results'][widget.index]['dates'].length; i++)
                        Container(
                          child: Column(
                            children: [
                              Container(
                                child: text(
                                  title1: widget.comics['data']['results'][widget.index]['dates'][i]['type'].toString().split("Date")[0].toUpperCase() + " DATE",
                                  title2: DateFormat.yMMMMd().format(DateTime.parse(widget.comics['data']['results'][widget.index]['dates'][i]['date'])).toString()),
                              ),

                              SizedBox(height: 30)
                            ],
                          ),
                        ),

                        SizedBox(height: 30,),
                      ],
                    ),
                  ),

                  // price
                  Container(
                    child: 
                    widget.comics['data']['results'][widget.index]['prices'].length == 0
                    ? SizedBox()
                    : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        titleHeading(title: 'Prices'),

                        SizedBox(height: 20),

                        for(var i=0; i<widget.comics['data']['results'][widget.index]['prices'].length; i++)
                        Container(
                          child: Column(
                            children: [
                              Container(
                                child: text(
                                  title1: widget.comics['data']['results'][widget.index]['prices'][i]['type'].toString().split("Price")[0].toUpperCase() + " PRICE",
                                  title2: "\$ "+widget.comics['data']['results'][widget.index]['prices'][i]['price'].toString(),
                                )
                              ),

                              SizedBox(height: 30)
                            ],
                          ),
                        ),

                        SizedBox(height: 30,),
                      ],
                    ),
                  ),

                  // images
                  Container(
                    child: 
                    widget.comics['data']['results'][widget.index]['images'].length == 0
                    ? SizedBox()
                    : Column(
                      children: [
                        titleHeading(title: 'Images'),

                        SizedBox(height: 20),

                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          physics: BouncingScrollPhysics(),
                          child: Row(
                            children: [

                              SizedBox(width: 15),
                              
                              for (var i = 0; i < widget.comics['data']['results'][widget.index]['images'].length; i++)
                              imageView(
                                rightMargin: 10,
                                height: Get.size.height * 0.6,
                                shape: BoxShape.rectangle,
                                width: Get.size.width * 0.9,
                                imageURL: widget.comics['data']['results'][widget.index]['images'][i]['path'] + "." + widget.comics['data']['results'][widget.index]['images'][i]['extension'], 
                                title: 'Image', 
                                isLocalImage: false
                              ),
                            ],
                          ),
                        ),

                        SizedBox(height: 30,),
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

                  // stories
                  Container(
                    child: 
                    stories['data']['results'].length != 0
                    ? Column(
                      children: [
                        titleHeading(title: 'Stories'),

                        SizedBox(height: 20),

                        Container(
                          height: Get.size.height * 0.4,
                          child: Series(stories,"stories")
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
                  
                  // urls
                  Container(
                    child: 
                    widget.comics['data']['results'][widget.index]['urls'].length == 0
                    ? SizedBox()
                    : Column(
                      children: [
                        titleHeading(title: 'URLs'),

                        SizedBox(height: 20,),
                        
                        Container(
                          height: 
                          widget.comics['data']['results'][widget.index]['urls'].length == 4 || widget.comics['data']['results'][widget.index]['urls'].length == 3
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
                            itemCount: widget.comics['data']['results'][widget.index]['urls'].length,
                            itemBuilder: (BuildContext context, int i) {
                              return GestureDetector(
                                onTap: () {
                                  launchInBrowser(widget.comics['data']['results'][widget.index]['urls'][i]['url']);
                                },
                                child: Container(
                                  margin: EdgeInsets.only(right: 8),
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: AppColors.appGreenColor,
                                    borderRadius: BorderRadius.circular(10)
                                  ),
                                  child: Text('${widget.comics['data']['results'][widget.index]['urls'][i]['type'].toString().toUpperCase()}',
                                    style: TextStyle(
                                      color: AppColors.whiteColor,
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      
                      ],
                    ),
                  )
                  
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}




