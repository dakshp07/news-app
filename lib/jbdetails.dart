import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class JbDetails extends StatefulWidget {

  String jburl;
  JbDetails({this.jburl});

  @override
  _JbDetailsState createState() => _JbDetailsState();
}

class _JbDetailsState extends State<JbDetails> {
  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
      appBar: new AppBar(
        title: new Text("Full Article",style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold),),
      ),
      url: widget.jburl,
    );
  }
}
