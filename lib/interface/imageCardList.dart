import 'package:flutter/material.dart';

class MyCard extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    Card _card = new Card(
        child:
        new Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new Container(
              child: new Container(
                decoration: new BoxDecoration(
                  image: new DecorationImage(
                      image: new AssetImage("images/image1.jpg"),
                      fit: BoxFit.cover
                  ),

                ),
              ),
              height: 180.0,
            ),
            new Container(
              padding: const EdgeInsets.all(15.0),
              child:  new Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  new Text("Number 10"),
                  new Text("Whitehaven Beach"),
                  new Text("Whitsunday Island,Whitsunday Island"),
                ],
              ),
            ),
            new Container(
              padding: const EdgeInsets.all(5.0),
              child:new Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  new Text("SHARE", style:
                  new TextStyle(
                      color:Colors.blue,
                      fontWeight: FontWeight.bold
                  ),),
                  new Text("EXPLORE", style:
                  new TextStyle(
                      color:Colors.blue,
                      fontWeight: FontWeight.bold
                  ),)
                ],

              ),
              margin: const EdgeInsets.symmetric(vertical: 10.0),
            )
          ],
        )

    );

    return new Container(
      child: _card,
      margin:  const EdgeInsets.symmetric(vertical: 5.0),
    );
  }

  static List<Widget> getCards(int count){
    return new List<Widget>.generate(count,
            (int index) => new Container(
          child: new MyCard(),
        )
    );
  }
}

class ImageCard extends StatelessWidget{

  final List<Widget> cards = MyCard.getCards(25);

  @override
  Widget build(BuildContext context) {
    return
      new Container(
          padding: const EdgeInsets.all(12.0),
          decoration: new BoxDecoration(
              color: Colors.grey[100]
          ),
          child:new ListView(
            children: cards,
          )
      );
  }
}

class ImageCardListApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return
      new Scaffold(
          appBar: new AppBar(
            title: new Text("Image Card List App"),
            backgroundColor: Theme.of(context).primaryColor,
          ),
          body: new Container(
            child:  new ImageCard(),
          )
      );
  }
}