import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class InfoAbres extends StatelessWidget {
  final dynamic abre;

  InfoAbres({Key? key, required this.abre}) : super(key: key);

  final detall = 'https://examen-practic-sim-default-rtdb.europe-west1.firebasedatabase.app/arbres.json';

    void _launchURL() async {
    if (await canLaunch(detall)) {
      await launch(detall);
    } else {
      throw 'Could not launch $detall';
    }
  }

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
            Text('Autocton: ${abre['autocton'] ? 'Si' : 'No'}'),
            Image.network(abre['foto']),
            Text('Detall: ${abre['detall']}'),
            // InkWell(
            //   child: Text('Detall: $detall'),
            //   onTap: _launchURL,
            // ),
          ],
        ),
      ),
    );
  }
}