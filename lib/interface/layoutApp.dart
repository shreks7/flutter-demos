import 'package:flutter/material.dart';
import 'package:hello_layout/cwidgets/fav.dart';

class LayoutContainer extends StatelessWidget {
  String _textDetails = '''
  Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese Alps. Situated 1,578 meters above sea level, it is one of the larger Alpine Lakes. A gondola ride from Kandersteg, followed by a half-hour walk through pastures and pine forest, leads you to the lake, which warms to 20 degrees Celsius in the summer. Activities enjoyed here include rowing, and riding the summer toboggan run.
  ''';

  @override
  Widget build(BuildContext context) {
    Widget titleSection = new Container(
        padding: const EdgeInsets.all(32.0),
        child: new Row(
          children: <Widget>[
            new Expanded(
                child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Container(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: new Text(
                    'Lake Campground',
                    style: new TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                new Text('Switzerland',
                    style: new TextStyle(color: Colors.grey[500]))
              ],
            )),
            new FavoriteWidget()
          ],
        ));

    IconTheme iconTheme = new IconTheme(
      data: new IconThemeData(color: Theme.of(context).primaryColor),
      child: titleSection,
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
            buildButtonColumn(context, Icons.phone, "Call"),
            buildButtonColumn(context, Icons.map, "Route"),
            buildButtonColumn(context, Icons.share, "Share"),
          ],
        ));

    /*
        Text Section
       */

    Widget textSection = new Container(
      padding: const EdgeInsets.all(32.0),
      child: new Text(
        _textDetails,
        style: new TextStyle(fontWeight: FontWeight.w500),
        softWrap: true,
        textAlign: TextAlign.justify,
      ),
    );

    /*
        Image  Section
     */

    Widget imageSection = new Container(
      child: new Image.asset(
          "images/image1.jpg",
        height: 240.0,
        fit: BoxFit.cover,
      ),
    );

    /*
        Main Column
       */

    Widget mainCol = new ListView(
      children: <Widget>[
        imageSection,
        iconTheme,
        rowCont,
        textSection,
      ],
    );

    Container mainContainer = new Container(
      child: mainCol,
    );

    return mainContainer;
  }

  Column buildButtonColumn(BuildContext context, IconData icon, String label) {
    Color color = Theme.of(context).primaryColor;

    return new Column(
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
        )
      ],
    );
  }
}

//class LayoutApp extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return new MaterialApp(
//        home: new LayoutScaffold(),
//        theme: new ThemeData(primarySwatch: Colors.pink));
//  }
//}

class LayoutApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("Layout App"),
          backgroundColor: Theme.of(context).primaryColor,
        ),
        body: new LayoutContainer());
  }
}
