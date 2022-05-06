import 'package:ecatur/pages/tablita.dart';
import 'package:flutter/material.dart';

class Articulos extends StatelessWidget {
  const Articulos({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text('Usuario'),
      ),
      body: new Column(children: <Widget>[
        //new Text('Usuario'),
        RaisedButton(
            child: new Text('salir'),
            color: Colors.orangeAccent,
            shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(20.5)),
            onPressed: () {
              Navigator.pushNamed(context, '/inicio');
            }),
        RaisedButton(
            child: new Text('Puntos de Interes'),
            color: Colors.orangeAccent,
            shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(20.5)),
            onPressed: () {
              Navigator.pushNamed(context, '/tablas');
            }),
             RaisedButton(
            child: new Text('Posicion actual'),
            color: Colors.orangeAccent,
            shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(20.5)),
            onPressed: () {
              Navigator.pushNamed(context, '/posicion');
            }),
      ]),
    );
  }
}
