import 'package:ecatur/main.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter/services.dart';
import 'package:flutter/cupertino.dart';
class VistaWeb extends StatefulWidget {
  const VistaWeb({Key? key}) : super(key: key);

  @override
  State<VistaWeb> createState() => _VistaWebState();
}

class _VistaWebState extends State<VistaWeb> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 147, 26, 43),
        title: const Text('Nuestra Web'),
        leading: IconButton(
            onPressed: () => Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => actual())),
            icon: const Icon(Icons.home),
          ),
      ),
      body: const WebView(
        initialUrl: 'https://ecatur.unsa.edu.ar/',
      ),
    );
  }
}