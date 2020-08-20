import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'jbdetails.dart';

class JoeBiden extends StatefulWidget {
  @override
  _JoeBidenState createState() => _JoeBidenState();
}

class _JoeBidenState extends State<JoeBiden> {

  Map joeBidenData;
  fetchData() async {
    http.Response response = await http.get("https://newsapi.org/v2/everything?q=biden&apiKey={YOUR_API_KEY}");
    setState(() {
      joeBidenData = jsonDecode(response.body);
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
        title: new Text("Joe Biden",style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold),),
      ),
      body: joeBidenData==null ? new Center(
        child: new CircularProgressIndicator(),
      ) : new ListView.builder(
          itemCount: joeBidenData["totalResults"],
          itemBuilder: (context , index)=>
              new Column(
                children: [
                  new GestureDetector(
                    child: new Card(
                      color: Color(0x00040),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: new Column(
                        children: [
                          new Image.network(joeBidenData["articles"][index]["urlToImage"]),
                          new Padding(padding: const EdgeInsets.only(top: 10)),
                          new Text(joeBidenData["articles"][index]["title"],style: new TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold),),
                          new Padding(padding: const EdgeInsets.only(top: 10)),
                          new Text(joeBidenData["articles"][index]["author"]+" - "+joeBidenData["articles"][index]["source"]["name"],style: TextStyle(fontSize: 15,color: Colors.grey[600],fontWeight: FontWeight.bold),),
                          new Padding(padding: const EdgeInsets.only(top: 10)),
                          new Text(joeBidenData["articles"][index]["description"],style: TextStyle(fontSize: 20,color: Colors.grey[600],fontWeight: FontWeight.bold)),
                          new Padding(padding: const EdgeInsets.only(bottom: 10)),
                        ],
                      ),
                    ),
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>JbDetails(jburl: joeBidenData["articles"][index]["url"],)));
                    },
                  ),
                  new Padding(padding: const EdgeInsets.only(bottom: 10)),
                ],
              )
      )
    );
  }
}
