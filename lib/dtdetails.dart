import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class DTDetails extends StatefulWidget {

  String dturl;
  DTDetails({this.dturl});

  @override
  _DTDetailsState createState() => _DTDetailsState();
}

class _DTDetailsState extends State<DTDetails> {
  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
      appBar: new AppBar(
        title: new Text("Full Article",style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold),),
      ),
      url: widget.dturl,
    );
  }
}