import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'info_abres_screen.dart';

class ArbresScreen extends StatefulWidget {
  const ArbresScreen({super.key});

  @override
  _ArbresScreenState createState() => _ArbresScreenState();
}

class _ArbresScreenState extends State<ArbresScreen> {
  List<dynamic> arbres = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void fetchData() async {
    final response = await http.get(Uri.parse('https://examen-practic-sim-default-rtdb.europe-west1.firebasedatabase.app/arbres.json'));
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      setState(() {
        arbres = data.values.toList();
      });
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Arbres')),
      body: ListView.builder(
        itemCount: arbres.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(arbres[index]['nom']),
            subtitle: Text(arbres[index]['varietat']),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => InfoAbres(abre: arbres[index]),
                ),
              );
            },
          );
        },
      ),
    );
  }
}