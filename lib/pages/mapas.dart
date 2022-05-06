import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


class Mapas extends StatefulWidget {
  const Mapas({Key? key}) : super(key: key);
  

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<Mapas> {
  late GoogleMapController mapController;
 
  final LatLng _center = const LatLng(-26.07, -65.98);
  Map<MarkerId, Marker> markers = <MarkerId, Marker>{
    MarkerId('Quebrada'): Marker(
      markerId: MarkerId('Quebrada'),
      position: LatLng(-26.00844, -65.81357),
      infoWindow: InfoWindow(title: 'Quebrada de las Conchas', snippet: '*'),
      onTap: () {
        //_onMarkerTapped(markerId);
        print('Marker Tapped');
      },
      onDragEnd: (LatLng position) {
        print('Drag Ended');
      },
    ),
    MarkerId('Hotel'): Marker(
      markerId: MarkerId('Hotel'),
      position: LatLng(-26.06436, -65.98128),
      infoWindow: InfoWindow(title: 'Hotel Alto del Valle', snippet: '*'),
      onTap: () {
        //_onMarkerTapped(markerId);
        print('Marker Tapped');
      },
      onDragEnd: (LatLng position) {
        print('Drag Ended');
      },
    ),
    MarkerId('Museo'): Marker(
      markerId: MarkerId('Museo'),
      position: LatLng(-26.075980, -65.975910),
      infoWindow: InfoWindow(title: 'Museo de la Vid y el vino', snippet: '*'),
      onTap: () {
        //_onMarkerTapped(markerId);
        print('Marker Tapped');
      },
      onDragEnd: (LatLng position) {
        print('Drag Ended');
      },
    ),
    MarkerId('Divisadero'): Marker(
      markerId: MarkerId('Divisadero'),
      position: LatLng(-26.0929904, -66.0122420),
      infoWindow: InfoWindow(title: 'El Divisadero', snippet: '*'),
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
      home: Scaffold(
        appBar: AppBar(
          title: const Text('aqui estamos'),
          backgroundColor: Colors.pink[300],
        ),
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
    );
  }
}
