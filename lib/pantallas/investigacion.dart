import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:webview_flutter/webview_flutter.dart';
import '../main.dart';





class Investigacion extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/detalle': (context) => Html(),
      },
      home: FutureBuilder(
          future: getJson(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              var posts = snapshot.data;
              return Scaffold(
                  appBar: AppBar(
                    leading: IconButton(
                      onPressed: () => Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => actual())),
                      icon: const Icon(Icons.home),
                    ),
                    title: const Text('INVESTIGACIÓN'),
                    backgroundColor: const Color.fromARGB(255, 147, 26, 43),
                  ),
                  body: ListView.builder(
                      itemCount: posts.length,
                      itemBuilder: (context, index) {
                        Map post = snapshot.data[index];
                        return Wrap(
                          direction: Axis.horizontal,
                          children: [
                            Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 15, right: 50, bottom: 30, left: 10),
                                  child: Center(
                                      child: GestureDetector(
                                    onTap: () => Navigator.pushNamed(
                                      context,
                                      '/detalle',
                                      arguments: Cadena(post),
                                    ),
                                    child: Text(
                                      post['title']['rendered'],
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Color.fromARGB(255, 50, 50, 250),
                                        fontSize: 15.0,
                                        decoration: null,
                                        fontFamily: 'Verdana',
                                      ),
                                    ),
                                  )),
                                ),

                                //FadeInImage(
                                //placeholder: AssetImage('assets/logo.jpeg'),
                                // image:NetworkImage('logo_copabisi_2021_v2-768x221.png')     )

                                /* sacamos el enlace
                               Text(post['link'],
                                                            style:const TextStyle(
                                                            fontWeight: FontWeight.bold, 
                                                            color:Color.fromARGB(255, 50, 50, 250),
                                                            fontSize: 15.0,
                                                            decoration: null,
                                                            fontFamily: 'Verdana',
                                                            ),
                                                         ),*/
                              ],
                            ),
                          ],
                        );
                      }));
            } else if (snapshot.hasError) {
              return Scaffold(
                appBar: AppBar(
                  title: Text('Demo'),
                  centerTitle: true,
                  backgroundColor: Colors.redAccent,
                ),
                body: Column(
                  children: <Widget>[
                    Text(snapshot.error.toString())
                  ], //Handle error in your own way
                ),
              );
            } else {
              return Scaffold(
                body: Center(child: CircularProgressIndicator()),
              );
            }
          }),
    );
  }
}

Future<List> getJson() async {
  try {
    Uri apiUrl = Uri.parse('https://di.unsa.edu.ar/wp-json/wp/v2/pages');
    http.Response response = await http.get(apiUrl);
    return json.decode(response.body);
  } catch (e) {
    throw Exception('Problem with data' + e.toString());
  }
}

class Html extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final argumentos = ModalRoute.of(context)!.settings.arguments as Cadena;
    var titulo = argumentos.posteo['title']['rendered'];
    var contenido = argumentos.posteo["content"]["rendered"];
    var HtmlCode = '<html><body>' + contenido.toString() + '</body></html>';
    return Scaffold(
        appBar: AppBar(
          title: Text(titulo),
          backgroundColor: const Color.fromARGB(255, 147, 26, 43),
        ),
        body: WebView(
            initialUrl: Uri.dataFromString(HtmlCode,
                    mimeType: 'text/html',
                    encoding: Encoding.getByName('utf-8'))
                .toString()));
  }
}

class Cadena {
  Map posteo;

  Cadena(this.posteo);
}
