import 'dart:convert';

import 'package:flutter/material.dart';

import 'dart:async';
import 'package:http/http.dart' as http;

class NetworkContainer extends StatefulWidget {
  @override
  _NetworkAppState createState() => new _NetworkAppState();
}

class _NetworkAppState extends State<NetworkContainer> {

  final String URL = "http://jsonplaceholder.typicode.com/comments?_start=10&_limit=10";
  List data;

  Future<String> getData() async {
    http.Response resp = await http.get(
          Uri.encodeFull(URL),
      headers: {
            "Accept": "application/json"
      }
    );

    this.setState((){
        data = JSON.decode(resp.body);
    });

    print(data[0]["name"]);
    return "";
  }


  @override
  void initState() {
    this.getData();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
      Container cont = new Container(
          child: new ListView.builder(
            itemCount: data==null?0:data.length,
            itemBuilder: (BuildContext context, int index){
              return new Container(
                child: new Card(
                    elevation:  4.0,
                    child: new Stack(
                      children: <Widget>[
                        new Positioned.fill(
                            child: new Material(
                              color: Colors.transparent,
                              child: new InkWell(
                                  onTap: (){},
                                 highlightColor: Colors.grey[300],
                                splashColor: Colors.grey[200],
                              ),
                            )
                        ),
                        new Container(
                          padding: const EdgeInsets.all(12.0),
                          child: new Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              new CircleAvatar(
                                child: new Text(data[index]["name"][0]
                                    .toString
                                  ().toUpperCase()),
                              ),
                              new Expanded(
                                    child:
                                    new Container(
                                      margin: const EdgeInsets.only
                                        (left: 10.0),
                                      child: new Column(
                                        crossAxisAlignment: CrossAxisAlignment
                                            .start,
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        mainAxisSize: MainAxisSize.min,
                                        children: <Widget>[
                                          new Text(data[index]["name"].toString()
                                              .substring(0,15),
                                              style:new TextStyle(
                                                  fontWeight: FontWeight.bold
                                              )),
                                          new Container(
                                            margin: const EdgeInsets.symmetric
                                              (vertical: 10.0),
                                            child: new Text(
                                              data[index]["email"].toString
                                                ().trim(),
                                              textAlign: TextAlign.left,
                                            ),
                                          )
                                        ],
                                      ),
                                    )

                              ),
                              new Container(
                                child: new Icon(
                                  Icons.info,
                                  color: Colors.grey[400],),
                              )
                            ],
                          )
                      ),
                      ]
                    )
                ),
              );
            },
          )
      );
      return cont;
  }
}



class NetworkApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Network Demo"),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: new Container(
          decoration: new BoxDecoration(
              color: Colors.white
          ),
          child:new Center(
            child: new NetworkContainer(),
          )),
    );
  }
}
