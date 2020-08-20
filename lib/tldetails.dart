import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class TDetails extends StatefulWidget {

  String turl;
  TDetails({this.turl});

  @override
  _TDetailsState createState() => _TDetailsState();
}

class _TDetailsState extends State<TDetails> {
  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
      appBar: new AppBar(
        title: new Text("Full Article",style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold),),
      ),
      url: widget.turl,
    );
  }
}