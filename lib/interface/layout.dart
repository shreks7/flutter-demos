import 'package:flutter/material.dart';


class WidgetContainer extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    Widget stack = new Column(
      children: <Widget>[
        genImage("image1.jpg"),
        genImage("image2.jpg"),
        genImage("image3.jpg"),
        genImage("image4.jpg"),
      ],
    );

    return stack;
  }

  Widget genImage(String name){
    return new Image.asset("images/"+name,
      scale: 540.0,
      fit: BoxFit.cover,
    );
  }

}



class NewApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        home: new LayoutScaffold(),
        theme: new ThemeData(primarySwatch: Colors.pink));
  }
}

class LayoutScaffold extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(body: new WidgetContainer());
  }
}