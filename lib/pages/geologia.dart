
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'package:carousel_slider/carousel_slider.dart';

//import 'editar_usuario.dart';

import 'package:ecatur/main.dart';
import 'package:flutter/material.dart';

class Geologia extends StatefulWidget {
  

  
  @override
  _GeologiaState createState() => _GeologiaState();
}

class _GeologiaState extends State<Geologia> {
  CarouselController buttonCarouselController = CarouselController();
  @override
  Widget build(BuildContext context) {
   // String palabra = widget.lista[widget.index]['nombre'];
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 147, 26, 43),
          title: Text("Geologia"),
          leading: IconButton(
                      onPressed: () => Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => actual())),
                      icon: const Icon(Icons.home),
                    ),
        ),
        body: Stack(
          
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left:5.0),
              child: Container(
                padding: const EdgeInsets.only(top: 10.0),
                child: Center(
                    child: Column(children: <Widget>[
                  CarouselSlider(
                    options: CarouselOptions(
                        height: 500,
                        aspectRatio: 16 / 3,
                        viewportFraction: 0.9,
                        initialPage: 0,
                        enableInfiniteScroll: true,
                        reverse: true,
                        autoPlay: true,
                        autoPlayInterval: Duration(seconds: 2),
                        autoPlayAnimationDuration: Duration(milliseconds: 1500),
                        autoPlayCurve: Curves.fastOutSlowIn,
                        enlargeCenterPage: true,
                        scrollDirection: Axis.horizontal),
                    items: [21,22,23,24].map((i) {
                      return Builder(
                        builder: (BuildContext context) {
                          return Container(
                            width: MediaQuery.of(context).size.shortestSide,
                            margin: EdgeInsets.symmetric(
                                horizontal: 1.0, vertical: 2.0),
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(
                                    "assets/carrusel/$i.png"),
                              ),
                            ),
                          );
                        },
                      );
                    }).toList(),
                  ),
                  Expanded(
                      child: RatingBar.builder(
                    initialRating: 0,
                    itemBuilder: (context, _) {
                      return const Icon(Icons.stars, color: Colors.amber);
                    },
                    onRatingUpdate: (rating) {
                      print(rating);
                    },
                  )),
                ])),
              ),
            ),
            
          ],
        ));
  }
}


