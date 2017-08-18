import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ParentWidget extends StatefulWidget {
  @override
  _ParentWidgetState createState() => new _ParentWidgetState();
}

class _ParentWidgetState extends State<ParentWidget> {
  bool _active = false;

  void _handTapboxChanged(bool newVal){
    setState((){
      _active = !_active;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
        child:new Row(
            children:<Widget>[
              new TapBoxC(
                active: _active,
                onChanged: _handTapboxChanged,
              )

            ]
        ));
  }
}

class TapBoxC extends StatefulWidget {
  TapBoxC({Key key, this.active: false, @required this.onChanged})
      : assert(onChanged!=null),super(key: key);

  final bool active;
  final ValueChanged<bool> onChanged;

  @override
  _TapBoxCState createState() => new _TapBoxCState();
}

class _TapBoxCState extends State<TapBoxC> {

  bool _highlight = false;

  void _handleTapDown(TapDownDetails details){
    setState((){
      _highlight = true;
    });
  }

  void _handleTapUp(TapUpDetails details){
    setState((){
      _highlight = false;
    });
  }

  void _handleTapCancel() {
    setState(() {
      _highlight = false;
    });
  }

  void _handleTap(){
    widget.onChanged(!widget.active);
  }

  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
        onTapDown: _handleTapDown,
        onTapCancel: _handleTapCancel,
        onTapUp: _handleTapUp,
        onTap: _handleTap,
        child: new Container(
            decoration: new BoxDecoration(
                color: Colors.white
            ),
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Container(
                  decoration: new BoxDecoration(
                      color:  widget.active? Colors.lightBlueAccent[200]:Colors.grey[200],
                      border: _highlight?new Border.all(color:Colors.blue,
                          width: 10.0)
                          :null
                  ),
                  height: 120.0,
                  width: 120.0,
                  padding: const EdgeInsets.all(20.0),
                  child: new Text(
                    widget.active ? 'Active Box C': 'Inactive Box C',
                    style: new TextStyle(fontSize:15.0,color:Colors.white),
                  ),
                )
              ],
            )
        )
    );
  }
}


class TapBoxB extends StatelessWidget{
  TapBoxB({Key key, this.active: false, @required this.onChanged})
      : assert(onChanged!=null),super(key: key);

  final bool active;
  final ValueChanged<bool> onChanged;

  void _handleTap(){
    onChanged(!active);
  }

  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
        onTap: _handleTap,
        child: new Container(
            decoration: new BoxDecoration(
                color: Colors.white
            ),
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Container(
                  decoration: new BoxDecoration(
                    color: active? Colors.lightBlueAccent[200]:Colors.grey[200],
                  ),
                  height: 120.0,
                  width: 120.0,
                  padding: const EdgeInsets.all(20.0),
                  child: new Text(
                    active ? 'Active Box B': 'Inactive Box B',
                    style: new TextStyle(fontSize:15.0,color:Colors.white),
                  ),
                )
              ],
            )
        )
    );
  }


}


class TapBoxA extends StatefulWidget {
  TapBoxA({Key key}) : super(key: key);

  @override
  _TapBoxAState createState() => new _TapBoxAState();
}

class _TapBoxAState extends State<TapBoxA> {

  bool _active = false;

  void _handleTap(){
    setState((){
      _active = !_active;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
        onTap: _handleTap,
        child: new Container(
            decoration: new BoxDecoration(
                color: Colors.white
            ),
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                new Container(
                  decoration: new BoxDecoration(
                    color: _active? Colors.lightBlueAccent[200]:Colors.grey[200],
                  ),
                  height: 120.0,
                  width: 120.0,
                  padding: const EdgeInsets.all(20.0),
                  child: new Text(
                    _active ? 'Active Box A': 'Inactive Box A',
                    style: new TextStyle(fontSize:15.0,color:Colors.white),

                  ),
                ),
                new ParentWidget()
              ],
            )
        )
    );
  }
}

class InteractionApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Interaction Demo"),
        backgroundColor: Theme.of(context).primaryColor,
      ),
        body: new Container(
            decoration: new BoxDecoration(
                color: Colors.white
            ),
            child:new Center(
              child: new TapBoxA(),
            )),
    );
  }
}