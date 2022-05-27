import 'package:flutter/material.dart';
import 'my_webview.dart';

class Investigacion extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
      ),
      body: Center(
        child: RaisedButton(
          child: Text("Open Webpage"),
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (BuildContext context) => MyWebView(
                title: "Departamento de Informática",
                selectedUrl: "https://di.unsa.edu.ar/wp-json/wp/v2/pages/60828",
              )
            ));
          },
        ),
      ),
    );
  }
}
