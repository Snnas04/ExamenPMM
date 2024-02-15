import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'screen/home_screen.dart';
import 'screen/map_screen.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final location = const LatLng(0, 0);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Examen Final',
      initialRoute: 'home',
      routes: {
        'home': (_) => HomeScreen(),
        'mapa': (_) => MapScreen(),
      });
  }
}
