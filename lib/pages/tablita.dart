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
   
    
    return  Scaffold(
      
      appBar: AppBar(        
        backgroundColor: Color.fromARGB(255,147,26,43),
        title: const Text("LISTA DE Lugares"),
        leading: IconButton(
            onPressed:  ()=>Navigator.pushReplacement(context,  
              MaterialPageRoute(builder:  
                (context) => const Mapas() 
                                )  
              )  ,
        icon: const Icon(Icons.home),
        
        ),
      ),
       
      body: Stack(children: <Widget>
        [
          Positioned.fill(  //
            child: Opacity(child:Image(
              image: AssetImage('assets/logo1.jpeg'),
              fit : BoxFit.fill,
           ),
           opacity: 0.4),
          ), 
           // other children widgets of Stack
          FutureBuilder<List>(         
        future: obtenerLugares(),
        builder: (context, snapshot) {
          // ignore: avoid_print
          if (snapshot.hasError) print(snapshot.error);
          return snapshot.hasData
              ?  ElementoLista(
                  lista: snapshot.requireData,
                )
              : const Center(
                  child: CircularProgressIndicator(),
                );
        },
      ),
         ])
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
   
    return ListView.builder(
      itemCount: lista == null ? 0 : lista.length,
      itemBuilder: (context, posicion) {
        var url = "";
        return Container(
          padding: const EdgeInsets.only(bottom: 15.0,left:15.0,right: 90.0,top:20.0),          
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
               padding: const EdgeInsets.only(left:10.0,bottom: 5.0),
                  child: Row(
                    children: <Widget>[
                      Container(
                        child: Icon(Icons.camera),            
                       
                      ),
                      Container(
                        //decoration:const  BoxDecoration(image:DecorationImage(image: AssetImage('assets/logo.jpeg'),fit: BoxFit.fitWidth)),
                        
                        child: Text(
                          lista[posicion]['nombre'],
                          style:const TextStyle(
                              fontWeight: FontWeight.bold, 
                              color:Color.fromARGB(255, 19, 18, 18),
                              fontSize: 20.0,
                              fontFamily: 'Arial',
                              ),
                        ),
                      ), 
                                            
                    ],
                  ),
                )
             ),
          ),
        );
      },
    );
  }
}
