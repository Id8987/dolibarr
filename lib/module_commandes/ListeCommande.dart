import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'CreerCommande.dart';

class CommandeListPage extends StatefulWidget {
  @override
  _CommandeListPageState createState() => _CommandeListPageState();
}

class _CommandeListPageState extends State<CommandeListPage> {
  List<dynamic> _commandes = [];

  Future<void> _getCommandes() async {
    // Remplacez "https://votre-domaine.com" par l'URL de votre instance Dolibarr
    final response = await http.get(Uri.parse("https://dolimobile.with6.dolicloud.com/api/index.php/orders"));

    if (response.statusCode == 200) {
      setState(() {
        _commandes = json.decode(response.body);
      });
    } else {
      throw Exception('Failed to load commandes');
    }
  }

  @override
  void initState() {
    super.initState();
    _getCommandes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Liste des commandes'),
        leading: PopupMenuButton<String>(
          onSelected: (String value) {
            // Handle menu item selection
            switch (value) {
              case 'Nouvelle commande':
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CreerCommandePage(),
                  ),
                );
                break;
              case 'Liste':
                // do nothing
                break;
              case 'Brouillon':
                // show draft orders
                break;
              case 'Validée':
                // show validated orders
                break;
              case 'Livrée':
                // show delivered orders
                break;
              case 'Annulée':
                // show canceled orders
                break;
              case 'Statistiques':
                // show statistics
                break;
            }
          },
          itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
            PopupMenuItem<String>(
              value: 'Nouvelle commande',
              child: Text('Nouvelle commande'),
            ),
            PopupMenuDivider(),
            PopupMenuItem<String>(
              value: 'Liste',
              child: Text('Liste'),
            ),
            PopupMenuItem<String>(
              value: 'Brouillon',
              child: Text('Brouillon'),
            ),
            PopupMenuItem<String>(
              value: 'Validée',
              child: Text('Validée'),
            ),
            PopupMenuItem<String>(
              value: 'Livrée',
              child: Text('Livrée'),
            ),
            PopupMenuItem<String>(
              value: 'Annulée',
              child: Text('Annulée'),
            ),
            PopupMenuDivider(),
            PopupMenuItem<String>(
              value: 'Statistiques',
              child: Text('Statistiques'),
            ),
          ],
        ),
      ),
      body: ListView.builder(
        itemCount: _commandes.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(_commandes[index]['ref']),
            subtitle: Text(_commandes[index]['date']),
            onTap: () {
              // Afficher le détail de la commande
              
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          // Aller à l'écran de création de commande
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CreerCommandePage(),
            ),
          );
        },
      ),

);
}
}
                  // Faire quelque chose
