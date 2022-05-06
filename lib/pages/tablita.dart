import 'package:ecatur/main.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

import 'dart:convert';
import 'dart:async';

//import 'agregar_usuario.dart';
import 'detalle_lugares.dart';


class Tabla extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Lugares de Interes',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ListaLugares(),

      routes: <String, WidgetBuilder>{
        '/main': (BuildContext context) =>  MyApp(),
      },
    );
  }
}

class ListaLugares extends StatefulWidget {
  @override
  _ListaLugaresState createState() => _ListaLugaresState();
}

class _ListaLugaresState extends State<ListaLugares> {
  Future<List> obtenerLugares() async {
    Uri uri = Uri.parse("https://cafayate.herokuapp.com/lugares.php");
    final response = await http.get(uri);
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    //
    // ignore: unnecessary_new
    
    return  Scaffold(
    
      appBar: AppBar(
        
        backgroundColor: Color.fromARGB(255,147,26,43),
        title: Text("LISTA DE Lugares"),
         leading: IconButton(
            onPressed:  ()=>Navigator.pushReplacement(context,  
              MaterialPageRoute(builder:  
                (context) => Mapas() 
                                )  
              )  ,
        icon: Icon(Icons.home),
  
      
    ),
  
        
        
      ),
      body: FutureBuilder<List>(
        future: obtenerLugares(),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);
          return snapshot.hasData
              ? new ElementoLista(
                  lista: snapshot.requireData,
                )
              : Center(
                  child: CircularProgressIndicator(),
                );
        },
      ),
      //floatingActionButton: new FloatingActionButton(
      //child: Icon(Icons.add),
      //onPressed: () => Navigator.of(context).push(new MaterialPageRoute(
      //builder: (BuildContext context) => new AgregarUsuario(),
      //)),
      //),
    );
  }
}

class ElementoLista extends StatelessWidget {
  final List lista;

  const ElementoLista({Key? key, required this.lista}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView.builder(
      itemCount: lista == null ? 0 : lista.length,
      itemBuilder: (context, posicion) {
        var url = "";
        return Container(
          padding: EdgeInsets.all(2.0),
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) => DetallesUsuario(
                  index: posicion,
                  lista: lista,
                ),
              ));
            },
            child: Card(
                color: Color.fromARGB(255,147,26,43),
                child: Container(
                  padding: EdgeInsets.all(10.0),
                  child: Column(
                    children: <Widget>[
                      Container(
                        child: new Text(
                          lista[posicion]['nombre'],
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.white),
                        ),
                      ),
                      
                    ],
                  ),
                )),
          ),
        );
      },
    );
  }
}
