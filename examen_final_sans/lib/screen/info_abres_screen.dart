import 'package:flutter/material.dart';

class InfoAbres extends StatelessWidget {
  final dynamic abre;

  InfoAbres({Key? key, required this.abre}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(abre['nom'])),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            Text('Nom: ${abre['nom']}'),
            Text('Varietat: ${abre['varietat']}'),
            Text('Tipus: ${abre['tipus']}'),
            Text('Autocton: ${abre['autocton'] ? 'Yes' : 'No'}'),
            Image.network(abre['foto']),
            Text('Detall: ${abre['detall']}'),
          ],
        ),
      ),
    );
  }
}