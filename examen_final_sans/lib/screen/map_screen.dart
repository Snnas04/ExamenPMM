import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  late GoogleMapController _controller;
  LatLng _initialPosition = LatLng(0.0, 0.0);

  @override
  void initState() {
    super.initState();
    _getUserLocation();
  }

  // Obtenir la localització de l'usuari
  // Primer solicitam la IP de l'usuari i després la localització mitjançant dues APIs
  void _getUserLocation() async {
    final ipResponse = await http.get(Uri.parse('https://api.ipify.org/?format=json'));
    final ip = jsonDecode(ipResponse.body)['ip'];

    final locationResponse = await http.get(Uri.parse('https://ipinfo.io/$ip/geo'));
    final locationData = jsonDecode(locationResponse.body);
    final coordinates = locationData['loc'].split(',');

    setState(() {
      _initialPosition = LatLng(double.parse(coordinates[0]), double.parse(coordinates[1]));
    });

    _controller.moveCamera(CameraUpdate.newLatLng(_initialPosition));
  }

  @override
  Widget build(BuildContext context) {
    // Posam un Scaffold amb un AppBar i un GoogleMap per mostrar el mapa i tenir l'opció de tornar enrere
    return Scaffold(
      appBar: AppBar(title: Text('Map')),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: _initialPosition,
          zoom: 15,
        ),
        markers: {
          Marker(
            markerId: MarkerId('m1'),
            position: _initialPosition
          ),
        },
        onMapCreated: (controller) {
          _controller = controller;
          // Call _getUserLocation here after _controller is initialized
          _getUserLocation();
        },
      ),
    );
  }
}