import 'package:flutter/material.dart';

class ListContainer extends StatelessWidget{

  List<Widget> _ListW;

  ListContainer(BuildContext context):super(){
    _ListW = <Widget>[
      new ListTile(
        title: new Text('CineArts at the Empire',
            style: new TextStyle(fontWeight: FontWeight.w500, fontSize: 20.0)),
        subtitle: new Text('85 W Portal Ave'),
        leading: new Icon(
          Icons.theaters,
          color: Theme.of(context).primaryColor,
        ),
      ),
      new ListTile(
        title: new Text('The Castro Theater',
            style: new TextStyle(fontWeight: FontWeight.w500, fontSize: 20.0)),
        subtitle: new Text('429 Castro St'),
        leading: new Icon(
          Icons.theaters,
          color: Theme.of(context).primaryColor,
        ),
      ),
      new ListTile(
        title: new Text('Alamo Drafthouse Cinema',
            style: new TextStyle(fontWeight: FontWeight.w500, fontSize: 20.0)),
        subtitle: new Text('2550 Mission St'),
        leading: new Icon(
          Icons.theaters,
          color: Theme.of(context).primaryColor,
        ),
      ),
      new ListTile(
        title: new Text('Roxie Theater',
            style: new TextStyle(fontWeight: FontWeight.w500, fontSize: 20.0)),
        subtitle: new Text('3117 16th St'),
        leading: new Icon(
          Icons.theaters,
          color: Theme.of(context).primaryColor,
        ),
      ),
      new ListTile(
        title: new Text('United Artists Stonestown Twin',
            style: new TextStyle(fontWeight: FontWeight.w500, fontSize: 20.0)),
        subtitle: new Text('501 Buckingham Way'),
        leading: new Icon(
          Icons.theaters,
          color: Theme.of(context).primaryColor,
        ),
      ),
      new ListTile(
        title: new Text('AMC Metreon 16',
            style: new TextStyle(fontWeight: FontWeight.w500, fontSize: 20.0)),
        subtitle: new Text('135 4th St #3000'),
        leading: new Icon(
          Icons.theaters,
          color: Theme.of(context).primaryColor,
        ),
      ),
      new Divider(height: 16.0,),
      new ListTile(
        title: new Text('K\'s Kitchen',
            style: new TextStyle(fontWeight: FontWeight.w500, fontSize: 20.0)),
        subtitle: new Text('757 Monterey Blvd'),
        leading: new Icon(
          Icons.restaurant,
          color: Theme.of(context).primaryColor,
        ),
      ),
      new ListTile(
        title: new Text('Emmy\'s Restaurant',
            style: new TextStyle(fontWeight: FontWeight.w500, fontSize: 20.0)),
        subtitle: new Text('1923 Ocean Ave'),
        leading: new Icon(
          Icons.restaurant,
          color: Theme.of(context).primaryColor,
        ),
      ),
      new ListTile(
        title: new Text('Chaiya Thai Restaurant',
            style: new TextStyle(fontWeight: FontWeight.w500, fontSize: 20.0)),
        subtitle: new Text('272 Claremont Blvd'),
        leading: new Icon(
          Icons.restaurant,
          color: Theme.of(context).primaryColor,
        ),
      ),
      new ListTile(
        title: new Text('La Ciccia',
            style: new TextStyle(fontWeight: FontWeight.w500, fontSize: 20.0)),
        subtitle: new Text('291 30th St'),
        leading: new Icon(
          Icons.restaurant,
          color: Theme.of(context).primaryColor,
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {

    Container cont = new Container(
      child: new ListView(
          children: _ListW
      ),
    );

    return cont;
  }
}


class ListApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("List View Demo"),
          backgroundColor: Theme.of(context).primaryColor,
        ),
        body: new ListContainer(context));
  }
}
