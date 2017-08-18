import 'package:flutter/material.dart';

class FavoriteWidget extends StatefulWidget {

  @override
  _FavoriteWidgetState createState() => new _FavoriteWidgetState();
}

class _FavoriteWidgetState extends State<FavoriteWidget> {

  bool _isFavorited = true;
  int _favoriteCount = 41;

  void _toggleFavorite(){
    setState((){
      if(_isFavorited){
         _favoriteCount -= 1;
         _isFavorited = false;
      }
      else{
        _favoriteCount += 1;
        _isFavorited = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Row(
        mainAxisSize:  MainAxisSize.min,
        children: <Widget>[
          new Container(
            margin: const EdgeInsets.only(right: 2.0),
            child: new IconButton(
                icon:new Icon(
                  _isFavorited?Icons.star:Icons.star_border),
              onPressed: _toggleFavorite,
            ),

          ),
          new SizedBox(
            width: 18.0,
            child: new Text('$_favoriteCount'),
          ),

        ],
    );
  }
}
