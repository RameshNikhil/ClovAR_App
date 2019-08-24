import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:convert';
import 'package:flutter/material.dart';
import './CameraHomeScreen.dart';
import '../constants/Constant.dart';

import 'dart:async';
import 'dart:io';

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
    var treeList = ["Oak", "Birch", "Eukalyptus", "Willow", "Aloe Vera", "Rosewood", "Japanese Maple", "Cork", "Ceedar", "Banksia"];
    var treeImg = ["Tree"];

    return Padding(
      padding: EdgeInsets.all(0.0),
      child: GridView.count(
        crossAxisCount: 2,
        padding: EdgeInsets.fromLTRB(16.0, 28.0, 16.0, 16.0),
        childAspectRatio: 8.0 / 10.5,
        mainAxisSpacing: 32.0,
        crossAxisSpacing: 16.0,
        children: <Widget>[
          for (String i in treeList)
            Cards(
              title: i,
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

  Cards({Key key, @required this.title, @required this.curve})
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
                  titlePadding: EdgeInsets.fromLTRB(20, 300, 20, 20),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15.0))),
                  title: new Text(
                    "Delete?",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  //content: new Text("Alert Dialog body"),
                  actions: <Widget>[
                    // usually buttons at the bottom of the dialog

                    new FlatButton(
                      child: new Text("Delete"),
                      onPressed: () {
                        //delete function
                      },
                    ),
                    new FlatButton(
                      child: new Text(
                        "Cancel",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
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
            child: new Align(
              alignment: FractionalOffset(0.1, 0.95),
              child: new Text(
                widget.title,
                style: new TextStyle(
                  fontSize: 24.0,
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
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

 