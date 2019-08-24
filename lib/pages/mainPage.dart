import 'package:clover_app/routing/fade_transition.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:convert';
import 'package:flutter/material.dart';
import './CameraHomeScreen.dart';
import '../constants/Constant.dart';

import 'dart:async';
import 'dart:io';

import 'HomeScreen copy.dart';

class MainPage extends StatefulWidget {
  String userName;
  MainPage({Key key, @required this.userName}) : super(key: key);

  @override
  _MainPageState createState() => new _MainPageState();
}

// class HomeScreen extends StatefulWidget {
//   HomeScreen();

//   @override
//   State<StatefulWidget> createState() {
//     return _HomeScreenState();
//   }
// }

// class _HomeScreenState extends State<HomeScreen> {
//   String _imagePath;
//   Widget image;
//   double _headerHeight = 320.0;
//   final String _assetImagePath = 'assets/images/ic_no_image.png';

//   _HomeScreenState();

//   @override
//   void initState() {
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: Stack(
//       children: <Widget>[
//         _imagePath != null
//             ? _getImageFromFile(_imagePath)
//             : _getImageFromAsset(),
//         _getCameraFab(),
//         _getLogo(),
//       ],
//     ));
//   }

//   Widget _getImageFromAsset() {
//     print('XXXXXXXXXXXXXXXXXXXXXXXXX');
//     print(_assetImagePath);
//     return Padding(
//       padding: EdgeInsets.only(bottom: 30.0),
//       child: Container(
//           width: double.infinity,
//           height: _headerHeight,
//           color: Colors.grey,
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               Image.asset(
//                 _assetImagePath,
//                 //fit: BoxFit.fill,
//                 width: 60.0,
//                 height: 60.0,
//                 //centerSlice: Rect.fromLTRB(2.0, 2.0, 2.0, 2.0),
//                 //colorBlendMode: BlendMode.srcOver,
//                 //color: Color.fromARGB(120, 20, 10, 40),
//               ),
//               Container(
//                 margin: EdgeInsets.only(top: 8.0),
//                 child: Text(
//                   'No Image Available',
//                   style: TextStyle(
//                     color: Colors.grey[350],
//                     fontSize: 16.0,
//                   ),
//                 ),
//               ),
//             ],
//           )),
//     );
//   }

//   Widget _getImageFromFile(String imagePath) {
//     return Padding(
//       padding: EdgeInsets.only(bottom: 30.0),
//       child: Image.file(
//         File(
//           imagePath,
//         ),
//         fit: BoxFit.cover,
//         width: double.infinity,
//         height: _headerHeight,
//       ),
//     );
//   }

//   Widget _getTopHeader() {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 32.0),
//       child: Row(
//         children: <Widget>[
//           Icon(Icons.menu, size: 32.0, color: Colors.white),
//           Expanded(
//             child: Padding(
//               padding: EdgeInsets.only(left: 16.0),
//               child: Text(
//                 "My Profile",
//                 style: TextStyle(
//                     fontSize: 20.0,
//                     color: Colors.white,
//                     fontWeight: FontWeight.bold),
//               ),
//             ),
//           ),
//           Icon(Icons.mode_edit, color: Colors.white),
//         ],
//       ),
//     );
//   }

//   Widget _getCameraFab() {
//     return Positioned(
//       top: _headerHeight - 30.0,
//       right: 16.0,
//       child: FloatingActionButton(
//         onPressed: _openCamera,
//         child: Icon(
//           Icons.photo_camera,
//           color: Colors.white,
//         ),
//         backgroundColor: Colors.green,
//       ),
//     );
//   }

//   Widget _getLogo() {
//     return Container(
//       margin: EdgeInsets.only(top: 200.0),
//       alignment: Alignment.center,
//       child: Center(
//         child: Image.asset(
//           'assets/images/ic_flutter_devs_logo.png',
//           width: 160.0,
//           height: 160.0,
//           fit: BoxFit.contain,
//         ),
//       ),
//     );
//   }

//   Future _openCamera() async {
//     final imagePath = await Navigator.of(context).pushNamed(CAMERA_SCREEN);

//     setState(() {
//       _imagePath = imagePath;
//     });

//     if (imagePath != null) {
//       print("$imagePath");

//       image = Image.file(
//         File(imagePath),
//         height: _headerHeight,
//         width: double.infinity,
//         fit: BoxFit.cover,
//       );
//     }
//   }
// }

class _MainPageState extends State<MainPage> with TickerProviderStateMixin {
  String _imagePath;
  Widget image;
  double _headerHeight = 320.0;

  @override
  Widget build(BuildContext context) {
    //List <String> treeList = ["one", "two", "three"];

    //Shader is for gradient text
    final Shader linearGradient = LinearGradient(
      colors: <Color>[Color(0xffc39cf4), Color(0xff9D78F3)],
    ).createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false, // Don't show the leading button
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(right: 10.0),
              child: Icon(Icons.blur_on),
            ),
          ],
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(20.0, 0.0, 0.0, 0.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text("Hello,",
                        style: TextStyle(
                          fontSize: 31.0,
                          color: Colors.black,
                        )),
                    Text(widget.userName,
                        style: TextStyle(
                            fontSize: 32.0,
                            color: Colors.black,
                            fontWeight: FontWeight.w600)),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: Center(
              child: Content(),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.photo_camera,
          size: 25,
        ),
        // onPressed: (){

        //   Navigator.push(context, FadeRouteBuilder(page: HomeScreenX()));


        // },
        onPressed: _openCamera,
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        elevation: 0,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(16.0))),
      ),
    );
  }


  Future _openCamera() async {
    final imagePath = await Navigator.of(context).pushNamed(CAMERA_SCREEN);

    setState(() {
      _imagePath = imagePath;
    });

    if (imagePath != null) {
      print("$imagePath");

      image = Image.file(
        File(imagePath),
        height: _headerHeight,
        width: double.infinity,
        fit: BoxFit.cover,
      );
    }
  }

}

class Content extends StatelessWidget {
  // List<dynamic> treeList;
  // Content(this.treeList);

  @override
  Widget build(BuildContext context) {
    var counter = 10;
    var treeList = [
      "Wallnut",
      "Beech",
      "Eukalyptus",
      "Chestnut",
      "Aspen",
      "Elm",
      "Poplar",
      "Pine",
      "Acacia",
      "Palm"
    ];
    final score = ["4", "6", "1", "5", "8", "4", "9", "2", "6", "3"];

    var treeImgOne = "lib/assets/images/treeImg/1.png";
    var treeImgTwo = "lib/assets/images/treeImg/2.png";
    var treeImgThree = "lib/assets/images/treeImg/3.png";
    var treeImgFour = "lib/assets/images/treeImg/4.png";
    var treeImgFive = "lib/assets/images/treeImg/5.png";
    var treeImgSix = "lib/assets/images/treeImg/6.png";
    var treeImgSeven = "lib/assets/images/treeImg/7.png";
    var treeImgEight = "lib/assets/images/treeImg/8.png";
    var treeImgNine = "lib/assets/images/treeImg/9.png";
    var treeImgTen = "lib/assets/images/treeImg/10.png";

    var treeImgList = [
      treeImgOne,
      treeImgTwo,
      treeImgThree,
      treeImgFour,
      treeImgFive,
      treeImgSix,
      treeImgSeven,
      treeImgEight,
      treeImgNine,
      treeImgTen
    ];

    return Padding(
      padding: EdgeInsets.all(0.0),
      child: GridView.count(
        crossAxisCount: 2,
        padding: EdgeInsets.fromLTRB(16.0, 28.0, 16.0, 16.0),
        childAspectRatio: 8.0 / 10.5,
        mainAxisSpacing: 32.0,
        crossAxisSpacing: 16.0,
        children: <Widget>[
          for (int i = 1; i < counter; i++)
            Cards(
              title: treeList[i],
              score: score[i],
              treeImg: treeImgList[i],
              curve: 10.0,
            )
        ],
      ),
    );
  }
}

class Cards extends StatefulWidget {
  var title;
  double curve;
  String score;
  var treeImg;

  Cards(
      {Key key,
      @required this.title,
      @required this.curve,
      @required this.score,
      @required this.treeImg})
      : super(key: key);

  @override
  _CardsState createState() => new _CardsState();
}

class _CardsState extends State<Cards> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: GestureDetector(
        onTap: () {
          //print("tapped");
          //alert dialogue

          showDialog(
              context: context,
              builder: (BuildContext context) {
                // return object of type Dialog
                return AlertDialog(
                  titlePadding: EdgeInsets.fromLTRB(20, 100, 20, 20),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15.0))),
                  // title: new Text(
                  //   "Delete?",
                  //   style: TextStyle(
                  //     fontWeight: FontWeight.w600,
                  //   ),
                  // ),
                  content: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image.asset(widget.treeImg),
                      Text("Tree Name"),
                      Text("Information"),
                      Text("Score"),
                    ],
                  ),
                  actions: <Widget>[
                    // usually buttons at the bottom of the dialog

                    new FlatButton(
                      child: new Text(
                        "AR",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onPressed: () {
                        //delete function
                      },
                    ),

                    new FlatButton(
                      child: new Text(
                        "Cancel",
                        // style: TextStyle(
                        //   fontWeight: FontWeight.bold,
                        // ),
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                );
              });
        },
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(widget.curve),
          ),
          clipBehavior: Clip.antiAlias,
          child: new Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment(1.0, 1.0),
                end: Alignment(-1.0, -1.0),
                stops: [0.1, 0.9],
                colors: [
                  Color(0xffcab697),
                  Color(0xffbbc6d9),
                ],
              ),
            ),
            child: Padding(
              padding: EdgeInsets.only(left: 10.0, right: 10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(top: 20.0),
                    child: Center(
                      child: Image.asset(
                        widget.treeImg,
                        height: 130,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        new Text(
                          widget.title,
                          style: new TextStyle(
                            fontSize: 24.0,
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        new Text(
                          widget.score,
                          style: new TextStyle(
                            fontSize: 18.0,
                            color: Colors.yellow,
                            //fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // new Align(
            //   alignment: FractionalOffset(0.1, 0.95),
            //   child: new Text(
            //     widget.title,
            //     style: new TextStyle(
            //       fontSize: 24.0,
            //       color: Colors.white,
            //       fontWeight: FontWeight.w700,
            //     ),
            //   ),
            // ),
          ),
        ),
      ),
      decoration: new BoxDecoration(boxShadow: [
        new BoxShadow(
          color: Colors.grey[400],
          blurRadius: 15.0,
          offset: new Offset(0.0, 10.0),
        ),
      ]),
    );
  }
}
