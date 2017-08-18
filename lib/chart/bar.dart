import 'dart:ui';
import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class BarChart{
  static const int barCount = 5;
  final List<Bar> bars;

  BarChart(this.bars){
    assert(bars.length == barCount);
  }

  factory BarChart.empty(){
    return new BarChart(new List.filled(
        barCount,
        new Bar(0.0, Colors.transparent)
    ));
  }

  factory BarChart.random(Random random){
    final Color color = Colors.red;

    return new BarChart(new List.generate(
      barCount,
          (i) => new Bar(random.nextDouble() * 100,
          color),
    ));
  }

  static BarChart lerp(BarChart begin, BarChart end, double t){
    return new BarChart(new List.generate(
      barCount,
          (i) => Bar.lerp(begin.bars[i],end.bars[i],t),
    ));
  }
}

class Bar{
  Bar(this.height, this.color);

  final double height;
  final Color color;

  static Bar lerp(Bar begin, Bar end, double t){
    return new Bar(
        lerpDouble(begin.height,end.height,t),
        Color.lerp(begin.color,end.color,t)
    );
  }
}

class BarChartTween extends Tween<BarChart>{
  BarChartTween(BarChart begin, BarChart end): super (begin: begin, end: end);

  @override
  BarChart lerp(double t) => BarChart.lerp(begin, end, t);

}

class BarChartPainter extends CustomPainter{
  static const barWidthFraction = 0.75;

  BarChartPainter(Animation<BarChart> animation)
      : animation = animation,
        super(repaint: animation);


  final Animation<BarChart> animation;

  @override
  void paint(Canvas canvas, Size size) {
    void drawBar(Bar bar, double x, double width, Paint paint){
      paint.color = bar.color;
      canvas.drawRect(
          new Rect.fromLTWH(x,
              size.height - bar.height
              , width, bar.height),
          paint
      );
    }

    final paint = new Paint()
      ..style = PaintingStyle.fill;

    final chart = animation.value;
    final barDistance = size.width / (1 + chart.bars.length);
    final barWidth = barDistance * barWidthFraction;
    var x = barDistance - barWidth/2;

    for(final bar in chart.bars){
      drawBar(bar, x, barWidth, paint);
      x += barDistance;
    }

  }

  @override
  bool shouldRepaint(BarChartPainter old)
  => false;


}