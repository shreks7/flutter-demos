import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget{

  @override
  Widget build(BuildContext context) {

    var container = new Container(
      decoration: new BoxDecoration(
          color: Colors.grey[200]
      ),
      padding: const EdgeInsets.all(10.0),
      margin: const EdgeInsets.only(top:20.0),
      child: new Column(
        children: <Widget>[
          new Container(
              margin: const EdgeInsets.all(2.0),
              child:
              new Row(
                children: <Widget>[
                  genImage("image1"),
                  genImage("image1"),
                ],
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              )
          ),
          new Container(
              margin: const EdgeInsets.all(2.0),
              child:
              new Row(
                children: <Widget>[
                  genImage("image3"),
                  genImage("image4"),
                ],
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              )
          ),
        ],
      ),
    );

    return container;
  }

  Widget genImage(String name){
    return new Expanded(child:
    new Container(
        margin: const EdgeInsets.only(right:5.0),
        decoration:new BoxDecoration(
            color: Colors.grey[400],
            borderRadius: new BorderRadius.all(new Radius
                .circular(10.0)),
            border: new Border.all(color:Colors.grey[400])
        ),
        padding:const EdgeInsets.all(10.0),
        child:new Image.asset("images/"+name+".jpg")
    )
    );
  }
}

class GridApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return
      new Scaffold(
          appBar: new AppBar(
            title: new Text("Grid Demo"),
            backgroundColor: Theme.of(context).primaryColor,
          ),
          body: new Container(
            child:  new MyHomePage(),
          )
      );
  }
}