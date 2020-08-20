import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class BCDetails extends StatefulWidget {

  String bcurl;
  BCDetails({this.bcurl});

  @override
  _BCDetailsState createState() => _BCDetailsState();
}

class _BCDetailsState extends State<BCDetails> {
  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
      appBar: new AppBar(
        title: new Text("Full Article",style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold),),
      ),
      url: widget.bcurl,
    );
  }
}