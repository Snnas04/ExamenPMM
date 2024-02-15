import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  // Pantalla inicial amb dos botons per accedir a les altres pantalles
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              child: Text('Veure Arbres'),
              onPressed: () {
                Navigator.pushNamed(context, '/arbres');
              },
            ),
            SizedBox(height: 20),  // Añade un espacio entre los botones
            ElevatedButton(
              child: Text('Mostra la meva ubicació'),
              onPressed: () {
                Navigator.pushNamed(context, '/mapa');
              },
            ),
          ],
        ),
      ),
    );
  }
}
