import 'package:flutter/material.dart';

Map<String,String> _xroutes = {
  "/jsonNetwork":"Network JSON Demo",
  "/layout_app": "Layout Demo",
  "/food_app":"Horizontal Layout Demo",
  "/interaction":"Interaction Demo",
  "/imageGrid":"Grid Demo",
  "/imageCard":"Cards Demo",
  "/gallery":"Gallery Demo",
  "/circleWidget":"Circular Widget Custom Demo",
  "/barCharts":"Animated Charts Demo",
  "/listView":"List View Demo",
  "/cardList":"Card List Demo",
};

class MainComposer extends StatelessWidget{

  List<Widget> _cardList(BuildContext context){
    List<String> _paths = _xroutes.keys.toList();
    _xroutes[_paths[0]];
    return new List<Widget>.generate(_paths.length,
            (int index)=>
        new InkWell(
            highlightColor: Colors.grey[300],
            onTap: (){
              Navigator.of(context).pushNamed(_paths[index]);
            } ,
            child:
            new Container(
                margin: const EdgeInsets.symmetric(vertical: 5.0),
                child:
                new Card(
                    elevation:  1.0,
                    child:
                    new Container(
                        padding: const EdgeInsets.all(12.0),
                        child: new Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            new CircleAvatar(
                              child: new Text(_xroutes[_paths[index]][0].toUpperCase()),
                              backgroundColor: Theme.of(context).primaryColor,
                            ),
                            new Expanded(child:
                            new Container(
                                margin: const EdgeInsets.only(left:20.0),
                                child:
                                new Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    new Text(_xroutes[_paths[index]],
                                        style:new TextStyle(
                                            fontWeight: FontWeight.bold
                                        )),
                                  ],
                                )

                            )
                            ),

                          ],
                        )
                    )
                )
            )
        ));

  }

  @override
  Widget build(BuildContext context) {
    Container cont = new Container(
        padding: const EdgeInsets.all(5.0),
        decoration: new BoxDecoration(
            color: Colors.white
        ),
        child:  new ListView(
          children: _cardList(context),
        )
    );
    return cont;
  }
}