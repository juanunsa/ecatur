import 'dart:async';
//import 'dart:html';
//import 'dart:html';  
import 'package:ecatur/pages/tablita.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';  
import 'package:google_maps_flutter/google_maps_flutter.dart';

  
void main() { runApp(MyApp());}  
  
class MyApp extends StatelessWidget {  
  @override  
  Widget build(BuildContext context) {  
    return MaterialApp(  
      home: MyHomePage(),  
      debugShowCheckedModeBanner: false,  
    );  
  }  
}  
  
class MyHomePage extends StatefulWidget {  
  @override  
  SplashScreenState createState() => SplashScreenState();  
}  
class SplashScreenState extends State<MyHomePage> {  
  @override  
  void initState() {  
    super.initState();  
    Timer(Duration(seconds: 3),  
            ()=>Navigator.pushReplacement(context,  
            MaterialPageRoute(builder:  
                (context) => Mapas()  
            )  
         )  
    );  
  }  
  @override  
  Widget build(BuildContext context) {  
    return  Container(
          width: 400,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/saludo.jpeg'),
              fit: BoxFit.fill,
            ),
          ),
          );
          }  
} 

class HomeScreen extends StatelessWidget {  
  @override  
  Widget build(BuildContext context) {  
    return Scaffold(  
      appBar: AppBar(
        title:Text("Inicio"),
        backgroundColor:Color.fromARGB(255,147,26,43),
       
        
    ),
    drawer: MenuLateral(),
    body:Container(decoration:BoxDecoration(
                 color:Color.fromARGB(255,147,26,43),                
                 image: DecorationImage(
                  
                   image:AssetImage('assets/logo.jpeg'),
                   fit:BoxFit.cover),
    )
    )
    ); 
  }  
} 
 
class MenuLateral extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return new Drawer(
      backgroundColor:Color.fromARGB(255,147,26,43),
      child: ListView(
        children: <Widget>[
          new UserAccountsDrawerHeader(
              accountName: null,
              accountEmail: null,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/logo1.jpeg'),
                fit: BoxFit.contain
              )
            ),
          ),
            
          Ink(
            child: new ListTile(
              title: Text("Home", style: TextStyle(color: Colors.white),),
              onTap: ()=>Navigator.pushReplacement(context,  
            MaterialPageRoute(builder:  
                (context) => Mapas()  
            )  
         )  ,
            ),
          ),
          
           new ListTile(            
            title: Text("¿Dónde visitar?",style:TextStyle(color:Colors.white)),
            onTap:()=>Navigator.pushReplacement(context,  
            MaterialPageRoute(builder:  
                (context) => Tabla()  
            )  
         )  ,            
            selectedColor: Colors.indigo,
          ),
          
          new ListTile(            
            title: Text("Investigación",style:TextStyle(color:Colors.white)),
            onTap: (){},            
            selectedColor: Colors.indigo,
          ),
          
          new ListTile(
            title: Text("Capacitación",style:TextStyle(color:Colors.white)),
            onTap: (){},
            hoverColor: Colors.indigo,
          ),
          new ListTile(
            title: Text("Documentación y Bibliografía",style:TextStyle(color:Colors.white)),
            onTap: (){},
            hoverColor: Colors.indigo,
          ),
          new ListTile(
            title: Text("Contenidos audiovisuales",style:TextStyle(color:Colors.white)),
            onTap: (){},
            hoverColor: Colors.indigo,
          ),
          new ListTile(
            title: Text("Contacto",style:TextStyle(color:Colors.white)),
            onTap: (){},
            hoverColor: Colors.indigo,
          )
                 ],
      ) ,
    );
  }
}


class Mapas extends StatefulWidget {
  const Mapas({Key? key}) : super(key: key);
  

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<Mapas> {
  late GoogleMapController mapController;
 
  final LatLng _center = const LatLng(-26.07, -65.98);
  Map<MarkerId, Marker> markers = <MarkerId, Marker>{
    MarkerId('Tres Cruces'): Marker(
      markerId: MarkerId('Tres Cruces'),
      position: LatLng(-25.89120471950373, -65.71128107607366),
      infoWindow: InfoWindow(title: 'Tres Cruces', snippet: '*'),
      onTap: () {
        //_onMarkerTapped(markerId);
        print('Marker Tapped');
      },
      onDragEnd: (LatLng position) {
        print('Drag Ended');
      },
    ),
    MarkerId('Sinclinal de las Ranas'): Marker(
      markerId: MarkerId('Sinclinal de las Ranas'),
      position: LatLng(-25.71714332068316, -65.70262022316456),
      infoWindow: InfoWindow(title: 'Sinclinal de las Ranas', snippet: '*'),
      onTap: () {
        //_onMarkerTapped(markerId);
        print('Marker Tapped');
      },
      onDragEnd: (LatLng position) {
        print('Drag Ended');
      },
    ),
    MarkerId('Quebrada de Sunchales'): Marker(
      markerId: MarkerId('Quebrada de Sunchales'),
      position: LatLng(-25.72200863586019, -65.6987819833474),
      infoWindow: InfoWindow(title: 'Quebrada de Sunchales', snippet: '*'),
      onTap: () {
        //_onMarkerTapped(markerId);
        print('Marker Tapped');
      },
      onDragEnd: (LatLng position) {
        print('Drag Ended');
      },
    ),
    MarkerId('Puente Morales'): Marker(
      markerId: MarkerId('Puente Morales'),
      position: LatLng(-25.73100553426482, -65.69631401449442),
      infoWindow: InfoWindow(title: 'Puente Morales', snippet: '*'),
      onTap: () {
        //_onMarkerTapped(markerId);
        print('Marker Tapped');
      },
      onDragEnd: (LatLng position) {
        print('Drag Ended');
      },
    )
  };
  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title:Text("Inicio"),
           backgroundColor:Color.fromARGB(255,147,26,43),
        ),
        
         drawer: MenuLateral(),
        body: GoogleMap(
          onMapCreated: _onMapCreated,
          mapType: MapType.satellite,
          markers: Set<Marker>.of(markers.values),
          initialCameraPosition: CameraPosition(
            target: _center,
            zoom: 9.0,
          ),
        ),
      ),
       routes: <String, WidgetBuilder>{
        
        '/tablas': (BuildContext context) =>  Tabla(),
       
      },
    );
  }
}

class Posicion {
}