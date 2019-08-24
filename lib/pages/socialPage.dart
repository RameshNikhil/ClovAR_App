import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:convert';
import 'package:flutter/material.dart';

class SocialPage extends StatefulWidget {
  @override
  _SocialPageState createState() => new _SocialPageState();
}

class _SocialPageState extends State<SocialPage> with TickerProviderStateMixin {
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
            // Padding(
            //   padding: EdgeInsets.only(right: 10.0),
            //   child: Icon(Icons.blur_on),
            // ),
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
                Text("Your, ",
                    style: TextStyle(
                      fontSize: 31.0,
                      color: Colors.black,
                    )),
                Text("friends:",
                    style: TextStyle(
                        fontSize: 32.0,
                        color: Colors.black,
                        fontWeight: FontWeight.w600)),
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
      // floatingActionButton: FloatingActionButton(
      //   child: Icon(
      //     Icons.photo_camera,
      //     size: 25,
      //   ),
      //   onPressed: () {},
      //   foregroundColor: Colors.black,
      //   backgroundColor: Colors.white,
      //   elevation: 0,
      //   shape: RoundedRectangleBorder(
      //       borderRadius: BorderRadius.all(Radius.circular(16.0))),
      // ),
    );
  }
}

class Content extends StatelessWidget {
  // List<dynamic> treeList;
  // Content(this.treeList);

  @override
  Widget build(BuildContext context) {
    var counter = 6;

    var friends = [
      "Izad",
      "Sameer",
      "Cindy",
      "Sameer",
      "Deep",
      "Manvendra",
    ];

    final profileImg = ["one", "two", "three", "four", "five", "six"];

    return Padding(
      padding: EdgeInsets.all(0.0),
      child: GridView.count(
        crossAxisCount: 1,
        padding: EdgeInsets.fromLTRB(60.0, 28.0, 16.0, 16.0),
        childAspectRatio: 3.5 / 1.0,
        mainAxisSpacing: 16.0,
        crossAxisSpacing: 16.0,
        children: <Widget>[
          for (int i = 1; i < counter; i++)
            Cards(
              title: friends[i],
              profile: profileImg[i],
              curve: 8.0,
            )
        ],
      ),
    );
  }
}

class Cards extends StatefulWidget {
  var title;
  double curve;
  var profile;

  Cards(
      {Key key,
      @required this.title,
      @required this.curve,
      @required this.profile})
      : super(key: key);

  @override
  _CardsState createState() => new _CardsState();
}

class _CardsState extends State<Cards> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
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
                          borderRadius:
                              BorderRadius.all(Radius.circular(15.0))),
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
                  alignment: FractionalOffset(0.9, 0.5),
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
        ),

        // Image.asset(
        //       'lib/assets/images/logoFull.png',
        //       height: 350,
        //     ),

        Align(
          alignment: Alignment.centerLeft ,
          child: Text(
            widget.profile,
          ),
        ),


      ],
    );
  }
}
