import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'ssdetails.dart';

class Samsung extends StatefulWidget {
  @override
  _SamsungState createState() => _SamsungState();
}

class _SamsungState extends State<Samsung> {

  Map SamsungData;
  fetchData() async {
    http.Response response = await http.get("https://newsapi.org/v2/everything?q=samsung&apiKey={YOUR_API_KEY}");
    setState(() {
      SamsungData = jsonDecode(response.body);
    });
  }

  @override
  void initState() {
    fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Samsung",style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold),),
      ),
      body: SamsungData==null ? new Center(
        child: new CircularProgressIndicator(),
      ) : new ListView.builder(
          itemCount: SamsungData["totalResults"],
          itemBuilder: (context , index)=>
          new Column(
            children: [
              new GestureDetector(
                child: new Card(
                  color: Color(0x00040),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: new Column(
                    children: [
                      new Image.network(SamsungData["articles"][index]["urlToImage"]),
                      new Padding(padding: const EdgeInsets.only(top: 10)),
                      new Text(SamsungData["articles"][index]["title"],style: new TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold),),
                      new Padding(padding: const EdgeInsets.only(top: 10)),
                      new Text(SamsungData["articles"][index]["author"]+" - "+SamsungData["articles"][index]["source"]["name"],style: TextStyle(fontSize: 15,color: Colors.grey[600],fontWeight: FontWeight.bold),),
                      new Padding(padding: const EdgeInsets.only(top: 10)),
                      new Text(SamsungData["articles"][index]["description"],style: TextStyle(fontSize: 20,color: Colors.grey[600],fontWeight: FontWeight.bold)),
                      new Padding(padding: const EdgeInsets.only(bottom: 10)),
                    ],
                  ),
                ),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>SSDetails(surl: SamsungData["articles"][index]["url"],)));
                },
              ),
              new Padding(padding: const EdgeInsets.only(bottom: 10)),
            ],
          )
      ),
    );
  }
}
