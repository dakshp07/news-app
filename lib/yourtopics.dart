import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'jb.dart';
import 'dt.dart';
import 'tl.dart';
import 'apple.dart';
import 'ss.dart';
import 'bitcoin.dart';

class YourTopics extends StatefulWidget {
  @override
  _YourTopicsState createState() => _YourTopicsState();
}

class _YourTopicsState extends State<YourTopics> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("News App",style: new TextStyle(fontSize: 20, color: Colors.white,fontWeight: FontWeight.bold),),
      ),
      body: new SingleChildScrollView(
        child:  new Column(
          children: [
            new GestureDetector(
              child: new Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                color: Color(0x0080),
                child: new Stack(
                  children: [
                    new ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(16)),
                        child: new Image.asset("assests/biden.jpg",width: 720,height: 300,fit: BoxFit.fitWidth,)
                    ),
                    new Column(
                      children: [
                        new Padding(padding: const EdgeInsets.only(top: 200)),
                        new Text("Joe Biden",style: TextStyle(fontSize: 30,color: Colors.white,fontWeight: FontWeight.bold,backgroundColor: Colors.black26,),)
                      ],
                    )
                  ],
                ),
              ),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>JoeBiden()));
              },
            ),
            new Padding(padding: const EdgeInsets.only(top: 10)),
            new GestureDetector(
              child:new Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                color: Color(0x0080),
                child: new Stack(
                  children: [
                    new ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(16)),
                        child: new Image.asset("assests/trump.jpg",width: 720,height: 300,fit: BoxFit.cover,)
                    ),
                    new Column(
                      children: [
                        new Padding(padding: const EdgeInsets.only(top: 200)),
                        new Text("Donald Trump",style: TextStyle(fontSize: 30,color: Colors.white,fontWeight: FontWeight.bold,backgroundColor: Colors.black26,),)
                      ],
                    )
                  ],
                ),
              ),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>DonaldTrump()));
              },
            ),
            new Padding(padding: const EdgeInsets.only(top: 10)),
            new GestureDetector(
              child: new Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                color: Color(0x0080),
                child: new Stack(
                  children: [
                    new ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(16)),
                        child: new Image.asset("assests/tesla.jpg",width: 720,height: 300,fit: BoxFit.cover,)
                    ),
                    new Column(
                      children: [
                        new Padding(padding: const EdgeInsets.only(top: 200)),
                        new Text("Tesla",style: TextStyle(fontSize: 30,color: Colors.white,fontWeight: FontWeight.bold,backgroundColor: Colors.black26,),)
                      ],
                    )
                  ],
                ),
              ),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>Tesla()));
              },
            ),
            new Padding(padding: const EdgeInsets.only(top: 10)),
            new GestureDetector(
              child: new Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                color: Color(0x0080),
                child: new Stack(
                  children: [
                    new ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(16)),
                      child: new Image.asset("assests/apple.jpg",width: 720,height: 300,fit: BoxFit.cover,),
                    ),
                    new Column(
                      children: [
                        new Padding(padding: const EdgeInsets.only(top: 200)),
                        new Text("Apple",style: TextStyle(fontSize: 30,color: Colors.white,fontWeight: FontWeight.bold,backgroundColor: Colors.black26,),)
                      ],
                    )
                  ],
                ),
              ),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>Apple()));
              },
            ),
            new Padding(padding: const EdgeInsets.only(top: 10)),
            new GestureDetector(
              child: new Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                color: Color(0x0080),
                child: new Stack(
                  children: [
                    new ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(16)),
                        child: new Image.asset("assests/samsung.jpg",width: 720,height: 300,fit: BoxFit.cover,)
                    ),
                    new Column(
                      children: [
                        new Padding(padding: const EdgeInsets.only(top: 200)),
                        new Text("Samsung",style: TextStyle(fontSize: 30,color: Colors.white,fontWeight: FontWeight.bold,backgroundColor: Colors.black26,),)
                      ],
                    )
                  ],
                ),
              ),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>Samsung()));
              },
            ),
            new Padding(padding: const EdgeInsets.only(top: 10)),
            new GestureDetector(
              child: new Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                color: Color(0x0080),
                child: new Stack(
                  children: [
                    new ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(16)),
                      child:new Image.asset("assests/bitcoin.jpg",width: 720,height: 300,fit: BoxFit.cover,),
                    ),
                    new Column(
                      children: [
                        new Padding(padding: const EdgeInsets.only(top: 200)),
                        new Text("Bitcoin",style: TextStyle(fontSize: 30,color: Colors.white,fontWeight: FontWeight.bold,backgroundColor: Colors.black26,),)
                      ],
                    )
                  ],
                ),
              ),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>BitCoin()));
              },
            ),
          ],
        ),
      )
    );
  }
}
