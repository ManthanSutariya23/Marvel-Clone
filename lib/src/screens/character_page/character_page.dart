import 'package:flutter/material.dart';
import 'package:marvel/src/model/model.dart';
import 'package:marvel/src/model/model_variable.dart';
import 'package:marvel/src/widget/comman_widget/image_view.dart';
import 'package:marvel/src/widget/comman_widget/sizeboxs.dart';
import 'package:marvel/src/widget/comman_widget/title_widget.dart';
import '../../constant/constants.dart';

class CharacterPage extends StatefulWidget {
  final index;

  CharacterPage(this.index);

  @override
  State<CharacterPage> createState() => _CharacterPageState();
}

class _CharacterPageState extends State<CharacterPage> {

  static var comics,series,stories,events;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    
  }

  data() async {
    comics = await getDataWithend(arg: ModelVariable.character['data']['results'][widget.index]['comics']['collectionURI']);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff0D0C11),
      body: SingleChildScrollView(
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

                  sizedBoxHeight(context: context, height: 20),

                  titleHeading(title: 'Comics'),

                  Comics(0),
                  Comics(1),
                  Comics(2),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class Comics extends StatelessWidget {
  final index;

  Comics(this.index);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Row(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width / 2 - 25,
            child: Image.asset(latestNews[index]['imgUrl']!),
          ),
          SizedBox(
            width: 10,
          ),
          Container(
            width: MediaQuery.of(context).size.width / 2 - 25,
            child: Column(
              children: <Widget>[
                Text(
                  latestNews[index]['tag']!,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  latestNews[index]['title']!,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                  textAlign: TextAlign.justify,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
