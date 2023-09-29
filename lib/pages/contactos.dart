import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:ecatur/main.dart';

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
                     leading: IconButton(
            onPressed: () => Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => actual())),
            icon: const Icon(Icons.home),
          ),
),
     body:Padding(padding: const EdgeInsets.all(20.0),
     child:Stack(
      children:<Widget> [
        Padding(
          padding: const EdgeInsets.only(left:40, top:60),
          child: InkWell(
  onTap: () => launchUrl(Uri.parse('https://www.facebook.com/people/Equipo-de-Ciencia-Abierta-para-el-Turismo/100083361511505/')),
  child: Text(
    'Facebook',
    style: TextStyle(decoration: TextDecoration.underline, color: Colors.blue,fontSize: 20),
  ),
),
        ),
Padding(
  padding: const EdgeInsets.only(left:40, top:110),
  
  child:   InkWell(
  
    onTap: () => launchUrl(Uri.parse('https://www.instagram.com/ecatur.salta/')),
  
    child: Text(
  
      'Instagram',
      
      style: TextStyle(decoration: TextDecoration.underline, color: Color.fromRGBO(33, 150, 243, 1),fontSize: 20),
  
    ),
  
  ),
),
 Padding(padding: const EdgeInsets.only(left:40,top:160),
 child:RichText(
  text: TextSpan(
    
    children: [
            WidgetSpan(
        child: Padding(
          padding: const EdgeInsets.all( 2.0),
          child: Icon(Icons.mail,color: Color.fromARGB(255, 179, 20, 8),),
        ),
      ),
      TextSpan(text: 'proyectocafayate.pie@gmail.com',style: TextStyle(color:Colors.blue)),
    ],
  ),
))

      ],
     ))
    );
  }
}