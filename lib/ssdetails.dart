import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class SSDetails extends StatefulWidget {

  String surl;
  SSDetails({this.surl});

  @override
  _SSDetailsState createState() => _SSDetailsState();
}

class _SSDetailsState extends State<SSDetails> {
  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
      appBar: new AppBar(
        title: new Text("Full Article",style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold),),
      ),
      url: widget.surl,
    );
  }
}