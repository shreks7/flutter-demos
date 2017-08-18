import 'package:flutter/material.dart';

class CircleWidget extends StatelessWidget{

  CircleWidget({this.radius, this.text});

  final double radius;
  final double text;

  @override
  Widget build(BuildContext context) {
    return
      new Container(
          decoration: new BoxDecoration(
              color: Colors.white
          ),
          child:new Center(
            child: new Stack(
              alignment: const FractionalOffset(0.8, 0.8),
              children: <Widget>[
                new Container (
                  height:radius,
                  width: radius,
                  decoration:
                  new BoxDecoration(
                    image: new DecorationImage(
                      image:new AssetImage("images/image1.jpg"),
                      fit: BoxFit.cover,
                    ),
                    shape: BoxShape.circle,
                  ),
                ),
                new Container(
                  height: radius,
                  width: radius,
                  decoration: new BoxDecoration(
                      color: Colors.black45,
                      shape: BoxShape.circle
                  ),
                  child: null,
                ),
                text != null ? new Text("Mia B"):new Container()
              ],
            ),
          ));
  }
}

class CircleApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return
      new Scaffold(
          appBar: new AppBar(
            title: new Text("Circle Widget"),
            backgroundColor: Theme.of(context).primaryColor,
          ),
          body: new Container(
              padding: const EdgeInsets.all(10.0),
              decoration: new BoxDecoration(
                  color: Colors.white
              ),
              child:  new CircleWidget(radius:100.0),
          )
      );
  }
}