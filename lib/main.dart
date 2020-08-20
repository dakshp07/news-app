import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'detials.dart';
import 'yourtopics.dart';

void main() => runApp(MyApp());

 class MyApp extends StatelessWidget {
   @override
   Widget build(BuildContext context) {
     return MaterialApp(
       debugShowCheckedModeBanner: false,
       theme: new ThemeData(
         brightness: Brightness.dark,
       ),
       home: HomePage(),
     );
   }
 }

 class HomePage extends StatefulWidget {
   @override
   _HomePageState createState() => _HomePageState();
 }

 class _HomePageState extends State<HomePage> {

   Map latestNews;
   fetchData() async {
     http.Response response = await http.get("https://newsapi.org/v2/top-headlines?country=us&apiKey={YOUR_API_KEY}");
     setState(() {
       latestNews = jsonDecode(response.body);
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
         title: new Text("News App",style: new TextStyle(fontSize: 20, color: Colors.white,fontWeight: FontWeight.bold),),
       ),
       drawer: new Drawer(
         child: new Column(
           children: [
             new UserAccountsDrawerHeader(
                 accountName: new Text("News App",style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold),),
                 accountEmail: new Text("helpnewsapp@gmail.com",style: TextStyle(fontSize: 20,color: Colors.grey[600],fontWeight: FontWeight.bold),),
               currentAccountPicture: new CircleAvatar(
                 child: new Text("NA",style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold),),
                 backgroundColor: Colors.red[600],
               ),
             ),
             new Padding(padding: const EdgeInsets.only(top: 5)),
             new ListTile(
               title: new Text("Latest/Trending News",style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold),),
               trailing: new Icon(Icons.trending_up),
               onTap: (){
                 Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>HomePage()));
               },
             ),
             new Padding(padding: const EdgeInsets.only(top: 5)),
             new Padding(padding: const EdgeInsets.only(top: 5)),
             new ListTile(
               title: new Text("Your Topics",style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold),),
               trailing: new Icon(Icons.favorite),
               onTap: (){
                 Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>YourTopics()));
               },
             ),
             new Padding(padding: const EdgeInsets.only(top: 5)),
             new Padding(padding: const EdgeInsets.only(top: 5)),
             new ListTile(
               title: new Text("Your Account",style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold),),
               trailing: new Icon(Icons.face),
               onTap: (){},
             ),
             new Padding(padding: const EdgeInsets.only(top: 5)),
             new Padding(padding: const EdgeInsets.only(top: 5)),
             new ListTile(
               title: new Text("Settings",style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold),),
               trailing: new Icon(Icons.settings),
               onTap: (){},
             ),
             new Padding(padding: const EdgeInsets.only(top: 270)),
             new Divider(
               height: 5,
               thickness: 2,
             ),
             new Padding(padding: const EdgeInsets.only(top: 5)),
             new ListTile(
               title: new Text("Close",style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold),),
               trailing: new Icon(Icons.close),
               onTap: (){
                 Navigator.pop(context);
               },
             ),
           ],
         ),
       ),
       body: latestNews==null ?  new Center(
         child: new CircularProgressIndicator(),
       ) :  new ListView.builder(
           itemCount: latestNews["totalResults"],
           itemBuilder: (context , index)=>
           new Column(
             children: [
               new GestureDetector(
                 child: new Card(
                   color: Color(0x00040),
                   shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                   child: new Column(
                     children: [
                       new Image.network(latestNews["articles"][index]["urlToImage"]),
                       new Padding(padding: const EdgeInsets.only(top: 10)),
                       new Text(latestNews["articles"][index]["title"],style: new TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold),),
                       new Padding(padding: const EdgeInsets.only(top: 10)),
                       new Text(latestNews["articles"][index]["author"]+" - "+latestNews["articles"][index]["source"]["name"],style: TextStyle(fontSize: 15,color: Colors.grey[600],fontWeight: FontWeight.bold),),
                       new Padding(padding: const EdgeInsets.only(top: 10)),
                       new Text(latestNews["articles"][index]["description"],style: TextStyle(fontSize: 20,color: Colors.grey[600],fontWeight: FontWeight.bold)),
                       new Padding(padding: const EdgeInsets.only(bottom: 10)),
                     ],
                   ),
                 ),
                 onTap: (){
                   Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>DetailsPage(url: latestNews["articles"][index]["url"],)));
                 },
               ),
               new Padding(padding: const EdgeInsets.only(bottom: 10)),
             ],
           )
       ),
     );
   }
 }