// ignore_for_file: prefer_const_constructors
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class NouveauProspectPage extends StatefulWidget {
  @override
  _NouveauProspectPageState createState() => _NouveauProspectPageState();
}

class _NouveauProspectPageState extends State<NouveauProspectPage> {
  final _nomController = TextEditingController();
  final _adresseController = TextEditingController();
  final _codePostalController = TextEditingController();
  final _villeController = TextEditingController();
  final _paysController = TextEditingController();
  final _telephoneController = TextEditingController();
  final _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nouveau Prospect'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              TextField(
                controller: _nomController,
                decoration: InputDecoration(
                  labelText: 'Nom',
                ),
              ),
              TextField(
                controller: _adresseController,
                decoration: InputDecoration(
                  labelText: 'Adresse',
                ),
              ),
              TextField(
                controller: _codePostalController,
                decoration: InputDecoration(
                  labelText: 'Code postal',
                ),
              ),
              TextField(
                controller: _villeController,
                decoration: InputDecoration(
                  labelText: 'Ville',
                ),
              ),
              TextField(
                controller: _paysController,
                decoration: InputDecoration(
                  labelText: 'Pays',
                ),
              ),
              TextField(
                controller: _telephoneController,
                decoration: InputDecoration(
                  labelText: 'Téléphone',
                ),
              ),
              TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                ),
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  _ajouterProspect();
                },
                child: Text('Ajouter'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _ajouterProspect() async {
    final requestBody = {
      'name': _nomController.text,
      'address': _adresseController.text,
      'zip': _codePostalController.text,
      'town': _villeController.text,
      'country_id': _paysController.text,
      'phone': _telephoneController.text,
      'email': _emailController.text,
      'customer_type': 'PROSPECT',
      'prospect': "0",
    };

    final jsonBody = jsonEncode(requestBody);

    final response = await http.post(
      Uri.parse(
          'https://dolimobile.with6.dolicloud.com/api/index.php/thirdparties'),
      headers: {
        'Content-Type': 'application/json',
        'DOLAPIKEY': '8892d4a4ef3ab0fbcf3e05c66989ecfd35a2a2b6',
      },
      body: jsonBody,
    );

    if (response.statusCode == 200) {
      // Le client/prospect a été ajouté avec succès
      // Vous pouvez ajouter ici du code pour afficher un message de confirmation
      Navigator.pop(context);
    } else {
      // Il y a eu une erreur lors de l'ajout du client/prospect
      // Vous pouvez ajouter ici du code pour afficher un message d'erreur
      print(response.body);
    }
  }
}
