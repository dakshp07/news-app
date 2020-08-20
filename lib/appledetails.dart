import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class AppleDetails extends StatefulWidget {

  String aurl;
  AppleDetails({this.aurl});

  @override
  _AppleDetailsState createState() => _AppleDetailsState();
}

class _AppleDetailsState extends State<AppleDetails> {
  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
      appBar: new AppBar(
        title: new Text("Full Article",style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold),),
      ),
      url: widget.aurl,
    );
  }
}