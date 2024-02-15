import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'screen/abres_screen.dart';
import 'screen/home_screen.dart';
import 'screen/map_screen.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final location = const LatLng(0, 0);

  // Definim les rutes de la nostra aplicació i indicam la pantalla inicial
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Examen',
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
        '/mapa': (context) => MapScreen(),
        '/arbres': (context) => const ArbresScreen(),  // Nueva ruta añadida aquí
      },
    );
  }
}