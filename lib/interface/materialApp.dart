import 'package:flutter/material.dart';

class MyMatApp extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        home:new MyApp()
    );
  }
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    Widget mainImage =
    new Expanded(child:
    new Card(
        child:
        new Image.asset(
          "images/image1.jpg",
          height:620.0,
          fit: BoxFit.cover,
        ))
    );

    Scaffold scaf =  new Scaffold(
      body: new Center(
        child: new Container(
          height: 600.0,
          child: new Card(
            child: new Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                new Container(
                    width: 240.0,
                    child: new Center(
                      child: new Text("Hello World"),
                    )
                ),
                mainImage,
              ],
            ),
          ),
        ),
      ),
    );


    return scaf;
  }
}
