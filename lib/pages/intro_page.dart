import '../routing/fade_transition.dart';
import '../pages/homescreen.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class IntroPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    int delayAmount = 500;

    PageController _controller = PageController();

    final nameController = TextEditingController();
    String userName;
    String nameToSend;


    return PageView(
      controller: _controller,
      scrollDirection: Axis.vertical,
      children: <Widget>[
        //Page 1
        Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            elevation: 0,
          ),
          body: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(36.0, 0.0, 36.0, 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    ShowUp(
                      child: Padding(
                        padding: EdgeInsets.only(bottom: 32.0),
                        child: Text("Hello,",
                            style: TextStyle(
                              fontSize: 31.0,
                              color: Colors.black,
                            )),
                      ),
                      delay: delayAmount,
                    ),
                    ShowUp(
                      child: Padding(
                        padding: EdgeInsets.only(bottom: 32.0),
                        child: Text(
                            "Welcome to ClovAR.",
                            style: TextStyle(
                              fontSize: 32.0,
                              //fontFamily: "Montserrat",
                              color: Colors.black,
                            )),
                      ),
                      delay: delayAmount * 3,
                    ),

                      ShowUp(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Text(
                        "Let's begin with your name:",
                        style: TextStyle(
                          fontSize: 30.0,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    delay: delayAmount * 6,
                  ),
                  ShowUp(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0.0, 8.0, 0.0, 0.0),
                      child: TextField(
                        decoration: InputDecoration(
                            border: InputBorder.none, 
                            hintText: 'Name',
                            ),
                          style: TextStyle(
                            fontSize: 20.0
                          ),
                        controller: nameController,
                      ),
                    ),
                    delay: delayAmount * 8,
                  ),

                  ],
                ),
              ),
            ],
          ),
          floatingActionButton: FloatingActionButton(
             onPressed: () {
              userName = nameController.text;
              if(userName.isEmpty){
                nameToSend = "User";
              } else {
                nameToSend = userName;
              }
              
              Navigator.pushReplacement(
                  context, FadeRouteBuilder(page: HomeScreen(userName: nameToSend,)));
            },
            child: ShowUp(
              child: Icon(Icons.keyboard_arrow_down),
              delay: delayAmount * 10,
            ),
            elevation: 0,
            foregroundColor: Colors.black,
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(16.0)),
            ),
          ),
        ),
        
      ],
    );
  }
}

//fade up animation
class ShowUp extends StatefulWidget {
  final Widget child;
  final int delay;

  ShowUp({@required this.child, this.delay});

  @override
  _ShowUpState createState() => _ShowUpState();
}

class _ShowUpState extends State<ShowUp> with TickerProviderStateMixin {
  AnimationController _animController;
  Animation<Offset> _animOffset;

  @override
  void initState() {
    super.initState();

    _animController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    final curve =
        CurvedAnimation(curve: Curves.decelerate, parent: _animController);
    _animOffset =
        Tween<Offset>(begin: const Offset(0.0, 0.35), end: Offset.zero)
            .animate(curve);

    if (widget.delay == null) {
      _animController.forward();
    } else {
      Timer(Duration(milliseconds: widget.delay), () {
        _animController.forward();
      });
    }
  }

  @override
  void dispose() {
    super.dispose();
    _animController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      child: SlideTransition(
        position: _animOffset,
        child: widget.child,
      ),
      opacity: _animController,
    );
  }
}
