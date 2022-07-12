import 'package:flutter/material.dart';

class Contacto extends StatefulWidget {
  const Contacto({ Key? key }) : super(key: key);

  @override
  State<Contacto> createState() => _ContactoState();
}

class _ContactoState extends State<Contacto> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text('Contacto'),         
                     backgroundColor: const Color.fromARGB(255, 147, 26, 43),
),
      
      
    );
  }
}