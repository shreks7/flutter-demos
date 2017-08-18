import 'package:flutter/material.dart';

import 'package:hello_layout/composer.dart';
import 'package:hello_layout/interface/layoutApp.dart';
import 'package:hello_layout/interface/layout.dart';
import 'package:hello_layout/interface/food.dart';
import 'package:hello_layout/interface/materialApp.dart';
import 'package:hello_layout/interface/imageGrid.dart';
import 'package:hello_layout/interface/gallery.dart';
import 'package:hello_layout/interface/listView.dart';
import 'package:hello_layout/interface/circleWidget.dart';
import 'package:hello_layout/interface/cardList.dart';
import 'package:hello_layout/interface/imageCardList.dart';
import 'package:hello_layout/chart/barChart.dart';
import 'package:hello_layout/interface/interaction.dart';
import 'package:hello_layout/netpp/networkApp.dart';

void main() {
  runApp(new MainApp());
}

class MainApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      theme:new ThemeData(
          primaryColor: Colors.pink
      ),
      home: new MainScaffold(),
      routes: <String, WidgetBuilder>{
        "/jsonNetwork":(BuildContext context) => new NetworkApp(),
        "/layout_app":(BuildContext context)=> new LayoutApp(),
        "/food_app":(BuildContext context)=>new FoodApp(),
        "/interaction":(BuildContext context)=>new InteractionApp(),
        "/imageGrid":(BuildContext context)=>new GridApp(),
        "/imageCard":(BuildContext context)=>new ImageCardListApp(),
        "/gallery":(BuildContext context)=>new GalleryApp(),
        "/circleWidget":(BuildContext context)=>new CircleApp(),
        "/barCharts":(BuildContext context)=>new ChartApp(),
        "/listView":(BuildContext context)=>new ListApp(),
        "/cardList":(BuildContext context)=>new CardListApp(),
      },
    );
  }
}

class MainScaffold extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Demos"),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: new MainComposer(),
    );
  }
}