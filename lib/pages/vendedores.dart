import 'package:flutter/material.dart';

class Vendedores extends StatelessWidget {
  const Vendedores({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text('Ventas'),
      ),
      body: new Column(children: <Widget>[
        new Text('estamos en Ventas'),
        RaisedButton(
            child: new Text('salir'),
            color: Colors.orangeAccent,
            shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(20.5)),
            onPressed: () {
              Navigator.pushNamed(context, '/inicio');
            }),
      ]),
    );
  }
}
