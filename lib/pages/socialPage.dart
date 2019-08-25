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
      "x",
      "Sameer",
      "Lucas",
      "Izad",
      "Deep",
      "Manvendra",
    ];

    //final profileImg = ["x", "two", "three", "four", "five", "six"];

    var treeDPOne = "lib/assets/images/dp/1.jpg";
    var treeDPTwo = "lib/assets/images/dp/2.jpg";
    var treeDPThree = "lib/assets/images/dp/3.jpg";
    var treeDPFour = "lib/assets/images/dp/4.jpg";
    var treeDPFive = "lib/assets/images/dp/5.jpg";

    var profileImg = [
      treeDPOne,
      treeDPOne,
      treeDPTwo,
      treeDPThree,
      treeDPFour,
      treeDPFive,
    ];

    return Padding(
      padding: EdgeInsets.all(0.0),
      child: GridView.count(
        crossAxisCount: 1,
        padding: EdgeInsets.fromLTRB(30.0, 32.0, 16.0, 16.0),
        childAspectRatio: 3.5 / 1.0,
        mainAxisSpacing: 28.0,
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
                      titlePadding: EdgeInsets.fromLTRB(20, 20, 20, 200),
                      shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(15.0))),
                      title: 
                      Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[ Text(
                        widget.title,
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text('Last Online 3 hours ago',
                      style: TextStyle(fontSize: 10)),
                      Padding(
                        padding: const EdgeInsets.only(top: 40),
                        child: Text('Total Score: 3800')),
                        Padding(
                          padding: const EdgeInsets.only(top: 40),
                          child:
                          Column(children: <Widget>[
                        Image.asset(
                              'lib/assets/images/treeImg/1.png',
                              width: 150.0,
                              height: 150.0,
                            ),
                            Text('Name: Great Oak Tree'),
                            Text('Score: 10', style: TextStyle(color: Colors.orange))
                           ] )
                        )
                      ]),
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


        // Align(
        //   alignment: Alignment.centerLeft,
        //   child: Image.asset(
        //     widget.profile,
        //     height: 130,
        //   ),
        // ),


        Align(
          alignment: Alignment.centerLeft,
          child: CircleAvatar(
          radius: 50.0,
          backgroundImage: ExactAssetImage(widget.profile,),
          // minRadius: 50,
          // maxRadius: 50,
        ),
        ),


      ],
    );
  }
}
