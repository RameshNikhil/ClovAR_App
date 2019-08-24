// import 'package:clover_app/routing/fade_transition.dart';
// import 'package:flutter/material.dart';

// class MainPage extends StatelessWidget {
//   String userName;
//   MainPage({Key key, @required this.userName}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     List<String> treeList = ["one,two,three"];

//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         elevation: 0,
//         automaticallyImplyLeading: false, // Don't show the leading button
//         title: Row(
//           mainAxisAlignment: MainAxisAlignment.end,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: <Widget>[
//             Padding(
//               padding: EdgeInsets.only(right: 10.0),
//               child: Icon(Icons.blur_on),
//             ),
//           ],
//         ),
//       ),
//       body: SafeArea(
//         child: Column(
//           children: <Widget>[
//             Padding(
//               padding: EdgeInsets.fromLTRB(28.0, 10.0, 0.0, 16.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: <Widget>[
//                   Text("Hello,",
//                       style: TextStyle(
//                         fontSize: 31.0,
//                         color: Colors.black,
//                       )),
//                   Text(userName,
//                       style: TextStyle(
//                           fontSize: 32.0,
//                           //fontFamily: "Montserrat",
//                           color: Colors.black,
//                           fontWeight: FontWeight.w600)),

//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class Cards extends StatefulWidget {
//   var title;

//   Cards({
//     Key key,
//     @required this.title,
//   }) : super(key: key);

//   @override
//   _CardsState createState() => new _CardsState();
// }

// class _CardsState extends State<Cards> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: GestureDetector(
//         onTap: () {
//           //alertDialogue of tree
//           print("tapped");
//         },
//         child: Card(
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(10.0),
//           ),
//           clipBehavior: Clip.antiAlias,
//           child: new Container(
//             decoration: BoxDecoration(
//               gradient: LinearGradient(
//                 begin: Alignment(1.0, 1.0),
//                 end: Alignment(-1.0, -1.0),
//                 stops: [0.1, 0.9],
//                 colors: [
//                   Color(0xffd7f6b7).withOpacity(0.6),
//                   Color(0xffd1e96f).withOpacity(0.6),
//                 ],
//               ),
//             ),
//             child: new Align(
//               alignment: FractionalOffset(0.1, 0.9),
//               child: new Text(
//                 widget.title,
//                 style: new TextStyle(
//                   fontSize: 24.0,
//                   color: Colors.white,
//                   fontWeight: FontWeight.w700,
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//       decoration: new BoxDecoration(boxShadow: [
//         new BoxShadow(
//           color: Colors.grey[400],
//           blurRadius: 15.0,
//           offset: new Offset(0.0, 10.0),
//         ),
//       ]),
//     );
//   }
// }

//////////////////////////////////////////////////////////////////////////////////////////////////////////////

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:convert';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  String userName;
  MainPage({Key key, @required this.userName}) : super(key: key);

  @override
  _MainPageState createState() => new _MainPageState();
}

class _MainPageState extends State<MainPage> with TickerProviderStateMixin {
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
        onPressed: () {},
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        elevation: 0,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(16.0))),
      ),
    );
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
