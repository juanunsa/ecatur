import 'dart:async';

import 'package:ecatur/pages/contactos.dart';
import 'package:ecatur/pages/contenidos.dart';
import 'package:ecatur/pages/documentacion.dart';
import 'package:ecatur/pages/tablita.dart';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:ecatur/pantallas/investigacion.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(),
      //darkTheme: ThemeData.fallback(),
      routes: <String, WidgetBuilder>{
        '/contactos': (BuildContext context) => Contacto(),
        '/pantallas/investigacion': (BuildContext context) => Investigacion(),
        '/pages/contenidos': (BuildContext context) => Contenidos(),
      },
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Documentacion {}

class MyHomePage extends StatefulWidget {
  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 2),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => Mapas())));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      decoration: const BoxDecoration(
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
          title: const Text("Inicio"),
          backgroundColor: const Color.fromARGB(255, 147, 26, 43),
        ),
        drawer: MenuLateral(),
        body: Container(
            decoration: const BoxDecoration(
          color: Color.fromARGB(255, 147, 26, 43),
          image: DecorationImage(
              image: AssetImage('assets/logo.jpeg'), fit: BoxFit.scaleDown),
        )));
  }
}

class MenuLateral extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color.fromARGB(255, 147, 26, 43),
      child: ListView(
        padding: const EdgeInsets.all(9.0),
        children: <Widget>[
          const UserAccountsDrawerHeader(
            accountName: null,
            accountEmail: null,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/logo1.jpeg'),
                    fit: BoxFit.scaleDown)),
          ),
          Ink(
            child: ListTile(
              leading: const Icon(Icons.home_sharp),
              title: const Text(
                "Home",
                style: TextStyle(color: Colors.white),
              ),
              onTap: () => Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => Mapas())),
            ),
          ),
          const Padding(padding: EdgeInsets.only(bottom: 2.0)),
          ListTile(
            leading: const Icon(Icons.tour),
            title: const Text("¿Dónde visitar?",
                style: TextStyle(color: Colors.white)),
            onTap: () => Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => Tabla())),
            hoverColor: Colors.indigo,
          ),
          const Padding(
            padding: EdgeInsets.only(bottom: 2.0),
          ),
          ListTile(
            leading: const Icon(Icons.science),
            title: const Text("Investigación",
                style: TextStyle(color: Colors.white)),
            onTap: () => Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => Investigacion())),
            hoverColor: Colors.indigo,
          ),
          ListTile(
            leading: const Icon(Icons.school),
            title: const Text("Capacitación",
                style: TextStyle(color: Colors.white)),
            onTap: () {},
            hoverColor: Colors.indigo,
          ),
          ListTile(
            leading: const Icon(Icons.book),
            title: const Text("Documentación y Bibliografía",
                style: TextStyle(color: Colors.white)),
            onTap: () => Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => Investigacion())),
            hoverColor: Colors.indigo,
          ),
          ListTile(
            leading: const Icon(Icons.movie),
            title: const Text("Contenidos audiovisuales",
                style: TextStyle(color: Colors.white)),
            onTap: () {},
            hoverColor: Colors.indigo,
          ),
          ListTile(
            leading: const Icon(Icons.contact_page),
            title:
                const Text("Contacto", style: TextStyle(color: Colors.white)),
            onTap: () => Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => Contacto())),
            hoverColor: Colors.indigo,
          )
        ],
      ),
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
  Future obtenerLugares() async {
    Uri uri = Uri.parse("https://cafayate.herokuapp.com/lugares.php");
    final response = await http.get(uri);
    // final List lista=json.decode(response.body);
  }

  // Map<MarkerId, Marker> markers1 = <MarkerId, Marker>{};

  final LatLng _center = const LatLng(-26.07, -65.98);
  Map<MarkerId, Marker> markers = <MarkerId, Marker>{
    MarkerId('Tres Cruces'): Marker(
      markerId: const MarkerId('Tres Cruces'),
      position: const LatLng(-25.89120471950373, -65.71128107607366),
      infoWindow: const InfoWindow(title: 'Tres Cruces', snippet: '*'),
      onTap: () {
        //_onMarkerTapped(markerId);
        print('Marker Tapped');
      },
      onDragEnd: (LatLng position) {
        print('Drag Ended');
      },
    ),
    MarkerId('Sinclinal de las Ranas'): Marker(
      markerId: const MarkerId('Sinclinal de las Ranas'),
      position: const LatLng(-25.71714332068316, -65.70262022316456),
      infoWindow:
          const InfoWindow(title: 'Sinclinal de las Ranas', snippet: '*'),
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
          title: const Text("Inicio"),
          backgroundColor: const Color.fromARGB(255, 147, 26, 43),
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
        '/tablas': (BuildContext context) => Tabla(),
      },
    );
  }
}
