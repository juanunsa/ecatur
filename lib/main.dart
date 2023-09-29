import 'dart:async';
import 'dart:convert';
import 'package:ecatur/pages/vistaWeb.dart';
import 'package:geolocator/geolocator.dart';
import 'package:ecatur/pages/contactos.dart';
import 'package:ecatur/pages/artesanias.dart';
import 'package:ecatur/pages/geologia.dart';
import 'package:ecatur/pages/tablita.dart';
import 'package:ecatur/pantallas/proyecto.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:ecatur/pages/puntosInteres.dart';

//import 'package:http/http.dart' as http;

/// Determine the current position of the device.
///
/// When the location services are not enabled or permissions
/// are denied the `Future` will return an error.
Future<Position> _determinePosition() async {
  bool serviceEnabled;
  LocationPermission permission;

  // Test if location services are enabled.
  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    // Location services are not enabled don't continue
    // accessing the position and request users of the 
    // App to enable the location services.
    return Future.error('Location services are disabled.');
  }

  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      // Permissions are denied, next time you could try
      // requesting permissions again (this is also where
      // Android's shouldShowRequestPermissionRationale 
      // returned true. According to Android guidelines
      // your App should show an explanatory UI now.
      return Future.error('Location permissions are denied');
    }
  }
  
  if (permission == LocationPermission.deniedForever) {
    // Permissions are denied forever, handle appropriately. 
    return Future.error(
      'Location permissions are permanently denied, we cannot request permissions.');
  } 

  // When we reach here, permissions are granted and we can
  // continue accessing the position of the device.
  return await Geolocator.getCurrentPosition();
}
class actual extends StatelessWidget{
  @override
   Widget build(BuildContext context) {
     
  return FutureBuilder<Position>(future:_determinePosition(),

  builder:(context, snapshot){if (snapshot.hasError) print(snapshot.error);
         
          return snapshot.hasData
              ?  Mapas(
                  ubicacion: snapshot.requireData,
                )
              : const Center(
                  child: CircularProgressIndicator(),
                );

  }

  );
}}
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
        '/pages/geologia': (BuildContext context) => Geologia(),
        '/pages/artesanias': (BuildContext context) => Artesanias(),
        'pages/vistaWeb':(BuildContext context)=>VistaWeb(),
        '/pantallas/proyecto': (BuildContext context) => Proyecto(),
      },
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
    Timer(
        const Duration(seconds: 4),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => actual())));
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
                  context, MaterialPageRoute(builder: (context) => actual())),
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
            title: const Text("Artesanias",
                style: TextStyle(color: Colors.white)),
            onTap: () => Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => Artesanias())),
            hoverColor: Colors.indigo,
          ),
          ListTile(
            leading: const Icon(Icons.school),
            title: const Text("Geologia",
                style: TextStyle(color: Colors.white)),
            onTap: ()  =>Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => Geologia())),
            hoverColor: Colors.indigo,
          ),
          ListTile(
            leading: const Icon(Icons.book),
            title: const Text("El Proyecto",
                style: TextStyle(color: Colors.white)),
            onTap: () => Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => Proyecto())),
            hoverColor: Colors.indigo,
          ),
          ListTile(
            leading: const Icon(Icons.movie),
            title: const Text("Nuestra Web",
                style: TextStyle(color: Colors.white)),
            onTap:() => Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => VistaWeb())),
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
  

  const Mapas({Key? key, required Position ubicacion}) : super(key: key);
  


  @override
  
  _Mapas createState() => _Mapas();
}
class _Mapas extends State<Mapas> {
  
  LatLng latlng = LatLng(
  -25.80,
   -65.70,
  );
  Iterable markers = [];

  @override
  void initState() {
    super.initState();

    getData();
  }
  getData()async{
    List results = json.decode(lista.texto.toString()); 
     Iterable _markers = Iterable.generate(19, (index) {
          Map result = results[index];
           final nombre=result["nombre"];
           final latitud = result["latitud"];
          final longitud = result["longitud"];
          
          LatLng latLngMarker = LatLng(double.parse(latitud), double.parse(longitud));

          return Marker(markerId: MarkerId("$nombre"),position: latLngMarker,icon:BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure),
          infoWindow: (InfoWindow(title: "$nombre")));
        });
         setState(() {
          markers = _markers;
        });
  }
  /*getData() async {

    
    Uri url=Uri.parse('https://drive.google.com/file/d/1-t2uIAklEvmsD-5QMSMrazrPa-COQfEV');
    try {
      final response =
          await http.get(url);

      final int statusCode = response.statusCode;
      print(statusCode);
      if (statusCode == 201 || statusCode == 200) {
        List results = json.decode(response.body);        

        Iterable _markers = Iterable.generate(10, (index) {
          Map result = results[index];
           final nombre=result["nombre"];
           final latitud = result["latitud"];
          final longitud = result["longitud"];
          
          LatLng latLngMarker = LatLng(double.parse(latitud), double.parse(longitud));

          return Marker(markerId: MarkerId("$nombre"),position: latLngMarker,
          infoWindow: (InfoWindow(title: "$nombre")));
        });

        setState(() {
          markers = _markers;
        });
      } else {
        throw Exception('Error');
      }
    } catch(e) {
      print(e.toString());
    }
  }
*/

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: const Text("Inicio"),
          backgroundColor: const Color.fromARGB(255, 147, 26, 43),
      ),
      drawer: MenuLateral(),
      body: GoogleMap(
        markers: Set.from(
          markers,
        ),
        initialCameraPosition: CameraPosition(target: latlng, zoom: 8.0),
        mapType: MapType.hybrid,
        onMapCreated: (GoogleMapController controller) {},
      ),
    );
  }
}
class  Ubica {
  Position ubicar;
  Ubica(this.ubicar);
} 