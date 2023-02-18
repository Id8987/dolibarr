// ignore_for_file: prefer_const_constructors
import 'package:dolibarr_project/screens/doli.accueil.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class NouveauClientPage extends StatefulWidget {
  const NouveauClientPage({Key? key}) : super(key: key);

  @override
  _NouveauClientPageState createState() => _NouveauClientPageState();
}

class _NouveauClientPageState extends State<NouveauClientPage> {
  final _nomController = TextEditingController();
  final _adresseController = TextEditingController();
  final _codePostalController = TextEditingController();
  final _villeController = TextEditingController();
  final _paysController = TextEditingController();
  final _telephoneController = TextEditingController();
  final _emailController = TextEditingController();

  @override
  void dispose() {
    _nomController.dispose();
    _adresseController.dispose();
    _codePostalController.dispose();
    _villeController.dispose();
    _paysController.dispose();
    _telephoneController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nouveau client'),
        backgroundColor: Accueil.couleurPrincipale,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Informations générales',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              SizedBox(height: 16),
              TextField(
                controller: _nomController,
                decoration: InputDecoration(
                  labelText: 'Nom *',
                ),
              ),
              SizedBox(height: 16),
              TextField(
                controller: _adresseController,
                decoration: InputDecoration(
                  labelText: 'Adresse *',
                ),
              ),
              SizedBox(height: 16),
              TextField(
                controller: _codePostalController,
                decoration: InputDecoration(
                  labelText: 'Code postal *',
                ),
              ),
              SizedBox(height: 16),
              TextField(
                controller: _villeController,
                decoration: InputDecoration(
                  labelText: 'Ville *',
                ),
              ),
              SizedBox(height: 16),
              TextField(
                controller: _paysController,
                decoration: InputDecoration(
                  labelText: 'Pays *',
                ),
              ),
              SizedBox(height: 32),
              Text(
                'Informations de contact',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              SizedBox(height: 16),
              TextField(
                controller: _telephoneController,
                decoration: InputDecoration(
                  labelText: 'Téléphone *',
                ),
              ),
              SizedBox(height: 16),
              TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'Email *',
                ),
              ),
              SizedBox(height: 32),

              //gestion Inscription client

              ElevatedButton(
                onPressed: () async {
                  // Vérification que tous les champs ont été remplis
                  if (_nomController.text.isEmpty ||
                      _adresseController.text.isEmpty ||
                      _codePostalController.text.isEmpty ||
                      _villeController.text.isEmpty ||
                      _paysController.text.isEmpty ||
                      _telephoneController.text.isEmpty ||
                      _emailController.text.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                            'Veuillez remplir tous les champs obligatoires'),
                      ),
                    );
                    return;
                  }

                  // Construction du corps de la requête
                  final requestBody = {
                    'name': _nomController.text,
                    'address': _adresseController.text,
                    'zip': _codePostalController.text,
                    'town': _villeController.text,
                    'country_id': _paysController.text,
                    'phone': _telephoneController.text,
                    'email': _emailController.text,
                    'customer': "1",
                  };

                  // Envoi de la requête POST à l'API de Dolibarr
                  final response = await http.post(
                    Uri.parse(
                        'https://dolimobile.with6.dolicloud.com/api/index.php/thirdparties'),
                    headers: {
                      'DOLAPIKEY': '8892d4a4ef3ab0fbcf3e05c66989ecfd35a2a2b6'
                    },
                    body: requestBody,
                  );

                  if (response.statusCode == 200) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Le client a été créé avec succès'),
                      ),
                    );

                    // Effacer les champs
                    _nomController.clear();
                    _adresseController.clear();
                    _codePostalController.clear();
                    _villeController.clear();
                    _paysController.clear();
                    _telephoneController.clear();
                    _emailController.clear();
                  } else {
                    print(response.statusCode);
                    print(response.body);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Erreur lors de la création du client'),
                      ),
                    );
                  }
                },
                child: Text('Créer le client'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
