import 'package:flutter/material.dart';

class GalleryContainer extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return new GridView.extent(
      crossAxisSpacing: 1.0,
      maxCrossAxisExtent: 180.0,
      padding: const EdgeInsets.all(1.0),
      mainAxisSpacing: 1.0,
      children: <Widget>[
        retImage("image1","Phil","Beautiful"),
        retImage("image2","A place","Golden Season"),
        retImage("image3","Hello","Ceresole Reale"),
        retImage("image4","Somewhere","Beautiful Place"),
        retImage("image5","Something","View from top"),
        retImage("image6","Whatever","Hill Top"),
        retImage("image7","World","Drone View"),
        retImage("image8","Random","Nice Place"),
      ],
    );
  }

  Widget retImage(String image,String title, String subtitle){
    Container cont = new Container(
        padding: const EdgeInsets.fromLTRB(10.0, 3.0, 10.0, 3.0),
        decoration: new BoxDecoration(
            color: new Color.fromARGB(220, 20,20,20)
        ),
        child:new Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Text(title,
                  style:
                  new TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14.0,
                      color: Colors.white),
                  textAlign: TextAlign.left,
                ),
                new Text(subtitle,style:
                new TextStyle(
                    fontWeight: FontWeight.w300,
                    color: Colors.grey[200],
                    fontSize: 10.0
                ),
                  textAlign: TextAlign.left,
                )
              ],
            ),
            new Icon(Icons.star_border, color: Colors.white,)
          ],
        )
    );

    Stack stack = new Stack(
      children: <Widget>[
        new Stack(
          children: <Widget>[
            new Image.asset(
              "images/"+image+".jpg",
              fit: BoxFit.cover,
              height: 240.0,
            )
          ],
        ),
        new Positioned(
            child: cont,
            bottom: 0.0,
            right: 0.0,
            left:0.0
        )
      ],
    );

    return stack;
  }

}


class GalleryApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("Gallery App"),
          backgroundColor: Theme.of(context).primaryColor,
        ),
        body: new GalleryContainer()
    );
  }
}