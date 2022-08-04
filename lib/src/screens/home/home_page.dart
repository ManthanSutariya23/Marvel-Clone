import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marvel/src/config/colors.dart';
import 'package:marvel/src/constant/constants.dart';
import 'package:marvel/src/controller/character/character_conroller.dart';
import 'package:marvel/src/screens/home/character_slider.dart';
import 'package:marvel/src/widget/loader/loader.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  bool loader = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    data();
  }

  data() async {
    setState(() {
      loader = true;
    });
    await CharacterController.getCharacterData();
    Timer.periodic(Duration(seconds: 1), (timer) {
      if(characterList != null) {
        timer.cancel();
        setState(() {
          loader = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: 
      loader
      ? load(context: context)
      : Column(
        children: <Widget>[
          Container(
            height: Get.size.height / 2 - 100,
            child: Stack(
              children: <Widget>[
                Positioned.fill(
                  child: 
                  Image.asset(
                    'assets/images/background1.png',
                    fit: BoxFit.fill,
                  ),
                ),
                Positioned(
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 50),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.menu,
                            size: 30,
                            color: Colors.white,
                          ),
                        ),
                        Image.asset(
                          'assets/images/logo.png',
                          width: 100,
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.search,
                            size: 30,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        height: 50,
                      ),
                      Text(
                        'MARVEL CHARACTERS',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Get hooked on a hearty helping of heroes and villains\nfrom the humble House of Ideas!',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Stack(
              children: <Widget>[
                Positioned.fill(
                  child: Image.asset(
                    'assets/images/background2.png',
                    fit: BoxFit.fill,
                  ),
                ),
                Center(child: CharacterSlider()),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
