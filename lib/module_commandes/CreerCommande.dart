import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'ListeCommande.dart';

class CreerCommandePage extends StatefulWidget {
  @override
  _CreerCommandePageState createState() => _CreerCommandePageState();
}

class _CreerCommandePageState extends State<CreerCommandePage> {
  final _formKey = GlobalKey<FormState>();
  final _referenceController = TextEditingController();
  final _dateController = TextEditingController();
  final _clientController = TextEditingController();
  final _remarquesController = TextEditingController();
   String? _delaiLivraison;
  String? _conditionPaiement;
   String? _modePaiement;
    String? _channel;
    
      String? _model_defaut;
  final DateFormat _dateFormat = DateFormat('yyyy-MM-dd');

  Future<void> _creerCommande()  async {
    // Remplacez "https://votre-domaine.com" par l'URL de votre instance Dolibarr
    try {
        final response = await http.post(
      Uri.parse("https://dolimobile.with6.dolicloud.com/api/index.php/orders?sortfield=t.rowid&sortorder=ASC&limit=100"),
      body: {
        'ref': _referenceController.text,
        'date': _dateFormat.format(_dateFormat.parse(_dateController.text)),
        'fk_soc': _clientController.text,
        'note_private': _remarquesController.text,
        'delai_livraison':_delaiLivraison!,
        'mode_paiement': _modePaiement!,
        'condition_paiement':_conditionPaiement,
        'channel':_channel,
        'model_defaut':_model_defaut
      },
    );

    if (response.statusCode == 200) {
         Navigator.pop(context);
    } else {
        throw Exception('Failed to load commandes: ${response.statusCode}');
    }
    } catch (e) {
      print("error loading 'response.statusCode'}");
    }
  
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Créer une commande'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: _referenceController,
                decoration: InputDecoration(
                  labelText: 'Référence',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Veuillez saisir une référence';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _dateController,
                decoration: InputDecoration(
                  labelText: 'Date Livraison',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Veuillez saisir une date';
                  }
                  if (!RegExp(r'^\d{4}-\d{2}-\d{2}$').hasMatch(value)) {
                    return 'Le format de la date doit être yyyy-mm-dd';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _clientController,
                decoration: InputDecoration(
                  labelText: 'Client',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Veuillez saisir un client';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _remarquesController,
                decoration: InputDecoration(
                  labelText: 'Remarques',
                ),
              ),
              DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  labelText: 'Delai de livraison',
                ),
                value: _delaiLivraison,
                onChanged: (String? newValue) {
                  setState(() {
                            _delaiLivraison= newValue;
        });
        },
        items: <String>['Immediate', '1 semaines', '2 semaines', '3 semaines']
        .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
        value: value,
        child: Text(value),
        );
        }).toList(),
        validator: (value) {
        if (value == null) {
        return 'Veuillez choisir un delai de livraison';
        }
        return null;
        },
        ),
          DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  labelText: 'Condition paiement',
                ),
                value: _conditionPaiement,
                onChanged: (String? newValue) {
                  setState(() {
                            _conditionPaiement= newValue;
        });
        },
        items: <String>['30 jours', '30jours fin mois', '60 jours', '60 jours fin mois','A commande','A livraison']
        .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
        value: value,
        child: Text(value),
        );
        }).toList(),
        validator: (value) {
        if (value == null) {
        return 'Veuillez choisir une condition de paiement';
        }
        return null;
        },
        ),
          DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  labelText: 'Mode de paiement',
                ),
                value: _modePaiement,
                onChanged: (String? newValue) {
                  setState(() {
                            _modePaiement= newValue;
        });
        },
        items: <String>['Chèque', 'Virement', 'Carte bancaire', 'Espèces']
        .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
        value: value,
        child: Text(value),
        );
        }).toList(),
        validator: (value) {
        if (value == null) {
        return 'Veuillez choisir un mode de paiement';
        }
        return null;
        },
        ),
             DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  labelText: 'Channel',
                ),
                value: _channel,
                onChanged: (String? newValue) {
                  setState(() {
                            _channel= newValue;
        });
        },
        items: <String>['Champagne Fix', 'Bouche a oreille', 'employe', 'internet']
        .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
        value: value,
        child: Text(value),
        );
        }).toList(),
        validator: (value) {
        if (value == null) {
        return 'Veuillez choisir un channnel';
        }
        return null;
        },
        ),
          DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  labelText: 'model document par defaut',
                ),
                value: _model_defaut,
                onChanged: (String? newValue) {
                  setState(() {
                             _model_defaut= newValue;
        });
        },
        items: <String>['Einstein']
        .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
        value: value,
        child: Text(value),
        );
        }).toList(),
        validator: (value) {
        if (value == null) {
        return 'Veuillez choisir un modele par defaut';
        }
        return null;
        },
        ),
        SizedBox(height: 16),
        Center(
        child: ElevatedButton(
        onPressed: () {
        if (_formKey.currentState!.validate()) {
        _creerCommande();
        }
        },
        child: Text('Créer'),
        ),
        ),
        ],
        ),
        ),
        ),
        );
        }
        }
