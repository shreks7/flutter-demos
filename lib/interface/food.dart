import 'package:flutter/material.dart';

class FoodContainer extends StatelessWidget {
  String _textDetails = '''
  Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. 
  ''';

  @override
  Widget build(BuildContext context) {
    Widget titleSection = new Container(
        margin: const EdgeInsets.all(5.0),
        child:new Text("Shrimp Pavlova",
          textAlign: TextAlign.center
          ,style: new TextStyle(
              color: Colors.grey[400],
              fontWeight: FontWeight.bold,
              fontSize: 20.0
            )
        ) ,

    );

    /*
        Button Row
       */

    Container rowCont = new Container(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: new Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            buildButtonColumn(context, Icons.book, "Prep", "25 min"),
            buildButtonColumn(context, Icons.timer, "COOK", "1 hr"),
            buildButtonColumn(context, Icons.local_dining, "Feeds", "4-6"),
          ],
        ));

    /*
        Text Section
       */

    Widget textSection = new Container(
      padding: const EdgeInsets.all(14.0),
      child: new Text(
        _textDetails,
        style: new TextStyle(fontWeight: FontWeight.w500),
        overflow: TextOverflow.fade,
        textAlign: TextAlign.justify,
      ),
    );

    /*
        Image  Section
     */

    Widget imageSection = new Container(
      child: new Expanded(
          child:
            new Card(
              child:new Image.asset(
                "images/food.jpg",
                height: 480.0,
                fit: BoxFit.cover,
              )
          )
      ),
    );

    /*
        Rating Section
     */

    Widget ratingSectUn = new Container(
      margin: const EdgeInsets.only(bottom: 32.0),
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
            new Row(
              children: <Widget>[
                new Icon(Icons.star),
                new Icon(Icons.star),
                new Icon(Icons.star),
                new Icon(Icons.star),
                new Icon(Icons.star),
              ],
            ),
            new Text("170 Review")
        ],
      ),
    );

    IconTheme ratingSect = new IconTheme(
        data: new IconThemeData(
          color: Colors.grey[400]
        ),
        child: ratingSectUn
    );

    /*
        Left Col
     */

    Widget leftCol = new Container(
      width: 280.0,
        padding: const EdgeInsets.all(16.0),
        child: new ListView(
            padding: const EdgeInsets.only(top:15.0),
            children: <Widget>[
              titleSection,
              textSection,
              ratingSect,
              rowCont,
            ],
          )
    );


    /*
        Main Row
       */

    Widget mainCol = new Container(
        child: new Row(
            children: <Widget>[
              leftCol,
              imageSection
            ],)
    );

    Container mainContainer = new Container(
      child: mainCol,
    );

    return mainContainer;
  }

  Widget buildButtonColumn(BuildContext context, IconData icon, String label,
   String secondaryLabel   ) {
    Color color = Theme.of(context).primaryColor;

    Widget col= new Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        new Icon(icon, color: color),
        new Container(
          margin: const EdgeInsets.only(top: 8.0),
          child: new Text(
            label.toUpperCase(),
            style: new TextStyle(
              fontSize: 12.0,
              fontWeight: FontWeight.w400,
              color: color,
            ),
          ),
        ),
        new Container(
          margin: const EdgeInsets.only(top:8.0),
          child: new Text(
            secondaryLabel,
            style: new TextStyle(
              fontSize: 12.0,
              fontWeight: FontWeight.w300,
              color: color
            ),
          ),
        )
      ],
    );

    return new Container(
        child:col,
      margin: const EdgeInsets.symmetric(horizontal: 16.0),
    );
  }


}

//class FoodApp extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return new MaterialApp(
//        home: new LayoutScaffold(),
//        theme: new ThemeData(primarySwatch: Colors.pink));
//  }
//}

class FoodApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Food App"),
        backgroundColor: Theme.of(context).primaryColor,
      ),
        body: new FoodContainer()
    );
  }
}
