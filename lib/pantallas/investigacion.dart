import 'dart:async';
import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:webview_flutter/webview_flutter.dart';



class Investigacion extends StatelessWidget {
  @override
 Widget build(BuildContext context) {
    return FutureBuilder(
        future: getJson(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            var posts=snapshot.data;
            return Scaffold(
              appBar:AppBar(
                      title: const Text('INVESTIGACIÓN'),
                      backgroundColor:const Color.fromARGB(255,147,26,43),),
              body:ListView.builder(
                  itemCount:posts.length,
                  itemBuilder: (context, index){
                     Map post=snapshot.data[index];
                     return  Wrap(
                        direction: Axis.horizontal ,
                        children: [
                          Column(
                            children: [Padding(
                              padding: const EdgeInsets.only(top:15,right: 50,bottom:30,left:10),
                              child: Center(child: Text(post['title']['rendered'],
                                                        style:const TextStyle(
                                                        fontWeight: FontWeight.bold, 
                                                        color:Color.fromARGB(255, 50, 50, 250),
                                                        fontSize: 15.0,
                                                        decoration: null,
                                                        fontFamily: 'Verdana',
                                                        ),
                                                     )
                                                    ),
                                        )],
                      
                          ),
                       ],
              );
            }
            )
          );
          } else if(snapshot.hasError) {
            return Scaffold(
              appBar:  AppBar(
                title:  Text('Demo'),
                centerTitle: true,
                backgroundColor: Colors.redAccent,
              ),
              body:  Column(
                children: <Widget>[ Text(snapshot.error.toString())], //Handle error in your own way
              ),
            );
          }else{
            return Scaffold(
              body: Center(child: CircularProgressIndicator()),
            );
          }
        });
  }
}

Future<List> getJson() async {
  try {
    Uri apiUrl = Uri.parse('https://di.unsa.edu.ar/wp-json/wp/v2/pages');
    http.Response response = await http.get(apiUrl);
    return json.decode(response.body);
  } catch (e) {
    throw Exception('Problem with data'+e.toString());
  }
}