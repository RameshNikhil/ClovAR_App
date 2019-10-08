import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
//import 'dart:convert';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';



class ARWebView extends StatelessWidget {
  final String name;
  ARWebView({Key key,  @required this.name}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return new WebviewScaffold(
          url: "https://b31d0611.ngrok.io/"+this.name+".html",
          appBar: new AppBar(
            title: new Text(this.name+" Tree"),
          ),
        );
  }
}