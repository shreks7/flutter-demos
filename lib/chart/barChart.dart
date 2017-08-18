import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hello_layout/chart/bar.dart';

class ChartPage extends StatefulWidget{
  @override
  ChartPageState createState() => new ChartPageState();
}

class ChartPageState extends State<ChartPage> with TickerProviderStateMixin{

  final random = new Random();
  int dataSet = 50;

  AnimationController animation;
  BarChartTween tween;

  @override
  void initState() {
    super.initState();

    animation = new AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 300)
    );
    tween: new Tween<double>(
        begin: 0.0,
        end: dataSet.toDouble()
    );
    tween = new BarChartTween(
        new BarChart.empty(),
        new BarChart.empty());
    animation.forward();
  }


  @override
  void dispose() {
    animation.dispose();
    super.dispose();
  }

  void _changeData(){
    setState((){
      dataSet = random.nextInt(100);
      tween = new BarChartTween(
          tween.evaluate(animation),
          new BarChart.random(random)
      );
      animation.forward(from:0.0);
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Center(
        child: new CustomPaint(
          size: new Size(200.0,100.0),
          painter: new BarChartPainter(
              tween.animate(animation)
          ),
        ),
      ),
      floatingActionButton: new FloatingActionButton(
          child: new Icon(Icons.refresh),
          onPressed: _changeData),
    );
  }
}

class ChartApp extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return
      new Scaffold(
          appBar: new AppBar(
            title: new Text("Animated Chart Demo"),
            backgroundColor: Theme.of(context).primaryColor,
          ),
          body: new ChartPage()
      );
  }
}