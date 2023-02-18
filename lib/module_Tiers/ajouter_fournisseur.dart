// ignore_for_file: prefer_const_constructors
import 'package:dolibarr_project/screens/doli.accueil.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class NouveauFournisseurPage extends StatefulWidget {
  @override
  _NouveauFournisseurPageState createState() => _NouveauFournisseurPageState();
}

class _NouveauFournisseurPageState extends State<NouveauFournisseurPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _zipController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _countryController = TextEditingController();

  Future<void> _createSupplier() async {
    // Vérification de la validité des champs du formulaire
    //if (!_formKey.currentState.validate()) {

    //return;
    //}

    final String apiUrl =
        'https://dolimobile.with6.dolicloud.com/api/index.php/thirdparties';

    final http.Response response = await http.post(Uri.parse(apiUrl), body: {
      'name': _nameController.text,
      'customer_type': 'SUPPLIER',
      'email': _emailController.text,
      'phone': _phoneController.text,
      'address': _addressController.text,
      'zip': _zipController.text,
      'town': _cityController.text,
      'country_id': _countryController.text,
      'supplier': "1",
    }, headers: {
      'DOLAPIKEY': '8892d4a4ef3ab0fbcf3e05c66989ecfd35a2a2b6',
      'Content-Type': 'application/x-www-form-urlencoded'
    });

    if (response.statusCode == 200) {
      // La création a réussi
      Navigator.pop(context);
    } else {
      // La création a échoué
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Erreur'),
              content: Text(response.body),
              actions: [
                TextButton(
                    onPressed: () => Navigator.pop(context), child: Text('OK'))
              ],
            );
          });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nouveau fournisseur'),
        backgroundColor: Accueil.couleurPrincipale,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextFormField(
                  controller: _nameController,
                  decoration: InputDecoration(labelText: 'Nom'),
                  validator: (dynamic value) {
                    if (value.isEmpty) {
                      return 'Veuillez entrer un nom valide';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(labelText: 'Email'),
                  validator: (dynamic value) {
                    if (value.isEmpty) {
                      return 'Veuillez entrer un email valide';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _phoneController,
                  decoration: InputDecoration(labelText: 'Téléphone'),
                  validator: (dynamic value) {
                    if (value.isEmpty) {
                      return 'Veuillez entrer un téléphone valide';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _addressController,
                  decoration: InputDecoration(labelText: 'Adresse'),
                  validator: (dynamic value) {
                    if (value.isEmpty) {
                      return 'Veuillez entrer une adresse valide';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _zipController,
                  decoration: InputDecoration(labelText: 'Code postal'),
                  validator: (dynamic value) {
                    if (value.isEmpty) {
                      return 'Veuillez entrer un code postal valide';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _cityController,
                  decoration: InputDecoration(labelText: 'Ville'),
                  validator: (dynamic value) {
                    if (value.isEmpty) {
                      return 'Veuillez entrer une ville valide';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _countryController,
                  decoration: InputDecoration(labelText: 'Pays'),
                  validator: (dynamic value) {
                    if (value.isEmpty) {
                      return 'Veuillez entrer un pays valide';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: _createSupplier,
                  child: Text('Créer'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
