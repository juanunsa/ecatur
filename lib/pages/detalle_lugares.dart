import 'package:flutter/material.dart';


import 'package:carousel_slider/carousel_slider.dart';

//import 'editar_usuario.dart';



import 'package:flutter/material.dart';


class DetallesUsuario extends StatefulWidget {
  int index;
  List lista = [];

  DetallesUsuario({required this.index, required this.lista});
  
  @override
  _DetallesUsuarioState createState() => _DetallesUsuarioState();
  
}

class _DetallesUsuarioState extends State<DetallesUsuario> {
   CarouselController buttonCarouselController = CarouselController();
  @override
  Widget build(BuildContext context) {
    
    // TODO: implement build
    return Scaffold(
      
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255,147,26,43),
        title: Text(""+widget.lista[widget.index]['nombre']),
      ),
      
      body:Stack(children: <Widget>
        [Container(
        padding: const EdgeInsets.all(20.0),
        child:  Center(
          child:  Column(
            children: <Widget>[
               Text(
                "Latitud: " + widget.lista[widget.index]['latitud'],
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              ),

              Text(
                "longitud: " + widget.lista[widget.index]['longitud'],
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              ),
              Text(
                "Distancia a terminal: " +  widget.lista[widget.index]['terminal'].toString()+'km',
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              ),
            ],
            )
            )
            ),
            Container(
              padding: const EdgeInsets.only(top:50.0),
              child: Center(
                 child:Column(
                   children:<Widget>[
                      CarouselSlider(
                        
  options: CarouselOptions(height: 400,
      aspectRatio: 16/3,
      viewportFraction: 0.9,
      initialPage: 0,
      enableInfiniteScroll: true,
      
      reverse: false,
      autoPlay: false,
      autoPlayInterval: Duration(seconds: 4),
      autoPlayAnimationDuration: Duration(milliseconds: 1500),
      autoPlayCurve: Curves.fastOutSlowIn,
      enlargeCenterPage: true,
      scrollDirection: Axis.horizontal),
  items: [1,2,3,4,5].map((i) {
    return Builder(
      builder: (BuildContext context) {
        return Container(
          width: MediaQuery.of(context).size.shortestSide,
          
          margin: EdgeInsets.symmetric(horizontal: 5.0,vertical: 30.0),
          decoration: BoxDecoration(
            color: Colors.amber
          ),
          child: Text('text $i', style: TextStyle(fontSize: 16.0),)
        );
      },
    );
  }).toList(),
) 
                   ]
                 )               
              ),

            ),
            

            ],
            
            )
            );
  }
}

