import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

//import 'editar_usuario.dart';

class DetallesUsuario extends StatefulWidget {
  int index;
  List lista = [];

  DetallesUsuario({required this.index, required this.lista});
  
  @override
  _DetallesUsuarioState createState() => _DetallesUsuarioState();
  
}

class _DetallesUsuarioState extends State<DetallesUsuario> {
  @override
  Widget build(BuildContext context) {
    
    // TODO: implement build
    return Scaffold(
      
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255,147,26,43),
        title: Text("DETALLES DEL Lugar"),
      ),
      
      body: new Container(
        padding: EdgeInsets.all(10.0),
        child: new Center(
          child: Column(
            children: <Widget>[
              new Text(
                "Nombre: " + widget.lista[widget.index]['nombre'],
                style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),

              new Text(
                "Latitud: " + widget.lista[widget.index]['latitud'],
                style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              ),

              new Text(
                "longitud: " + widget.lista[widget.index]['longitud'],
                style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              ),
                new Text(
                "Distancia a terminal: " +  widget.lista[widget.index]['terminal'].toString()+'km',
                style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              ),
              
              // new Text(
              // "Email: "+widget.lista[widget.index]['email'],
              // style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              //),

//              new RaisedButton(
              //              child: Text("EDITAR"),
              //            onPressed: () {
              //            Navigator.of(context).pop();
              //          Navigator.of(context).push(
              //          new MaterialPageRoute(
              //          builder: (BuildContext context) => new EditarUsuario(
              //          lista: widget.lista,
              //        index: widget.index,
              //    ),
              // ),
              // );
              // },
              //),

     //         new RaisedButton(
       //         child: Text("BORRAR"),
         //       onPressed: () {
           //       Uri url = Uri.parse(
             //         "http://192.168.0.11/pruebas/borrarUsuario.php");
               //   http.post(url, body: {
                 //   "idUsuario": widget.lista[widget.index]['idUsuario']
                 // });

                  //Navigator.of(context).pop();
                //},
              //),
            ],
          ),
        ),
      ),
    );
  }
}
