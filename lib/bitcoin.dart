import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'bitcoindetails.dart';

class BitCoin extends StatefulWidget {
  @override
  _BitCoinState createState() => _BitCoinState();
}

class _BitCoinState extends State<BitCoin> {

  Map BitCData;
  fetchData() async {
    http.Response response = await http.get("https://newsapi.org/v2/everything?q=bitcoin&apiKey={YOUR_API_KEY}");
    setState(() {
      BitCData = jsonDecode(response.body);
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
        title: new Text("Bitcoin",style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold),),
      ),
      body: BitCData==null ? new Center(
        child: new CircularProgressIndicator(),
      ) : new ListView.builder(
          itemCount: BitCData["totalResults"],
          itemBuilder: (context , index)=>
          new Column(
            children: [
              new GestureDetector(
                child: new Card(
                  color: Color(0x00040),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: new Column(
                    children: [
                      new Image.network(BitCData["articles"][index]["urlToImage"]),
                      new Padding(padding: const EdgeInsets.only(top: 10)),
                      new Text(BitCData["articles"][index]["title"],style: new TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold),),
                      new Padding(padding: const EdgeInsets.only(top: 10)),
                      new Text(BitCData["articles"][index]["author"]+" - "+BitCData["articles"][index]["source"]["name"],style: TextStyle(fontSize: 15,color: Colors.grey[600],fontWeight: FontWeight.bold),),
                      new Padding(padding: const EdgeInsets.only(top: 10)),
                      new Text(BitCData["articles"][index]["description"],style: TextStyle(fontSize: 20,color: Colors.grey[600],fontWeight: FontWeight.bold)),
                      new Padding(padding: const EdgeInsets.only(bottom: 10)),
                    ],
                  ),
                ),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>BCDetails(bcurl: BitCData["articles"][index]["url"],)));
                },
              ),
              new Padding(padding: const EdgeInsets.only(bottom: 10)),
            ],
          )
      ),
    );
  }
}
