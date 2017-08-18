import 'package:flutter/material.dart';
import 'package:hello_layout/interface/circleWidget.dart';

class CardListApp extends StatelessWidget{

  List<Widget> _cardList(int count){

    return new List<Widget>.generate(count,
            (int index)=> new Container(
            margin: const EdgeInsets.symmetric(vertical: 20.0),
            child: new Card(
                elevation:  4.0,
                child: new Container(
                    padding: const EdgeInsets.all(12.0),
                    child: new Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        new CircleWidget(radius: 40.0),
                        new Expanded(child:
                        new Container(
                            margin: const EdgeInsets.only(left:20.0),
                            child:
                            new Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                new Text("Hello ${index}",
                                    style:new TextStyle(
                                        fontWeight: FontWeight.bold
                                    )),
                                new Text("This is card ${index}")
                              ],
                            )

                        )
                        ),
                        new Container(
                          child: new Icon(
                            Icons.info,
                            color: Colors.grey[400],),
                        )
                      ],
                    )
                )
            )
        ));

  }

  @override
  Widget build(BuildContext context) {
    return
      new Scaffold(
          appBar: new AppBar(
            title: new Text("Card List"),
            backgroundColor: Theme.of(context).primaryColor,
          ),
        body: new Container(
            padding: const EdgeInsets.all(10.0),
            decoration: new BoxDecoration(
                color: Colors.white
            ),
            child:  new ListView(
              children: _cardList(20),
            ))
      );
  }
}