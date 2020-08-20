import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class DetailsPage extends StatefulWidget {

  String url;
  DetailsPage({this.url});

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
      appBar: new AppBar(
        title: new Text("Full Article",style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold),),
      ),
      url: widget.url,
      withZoom: true,
    );
  }
}
