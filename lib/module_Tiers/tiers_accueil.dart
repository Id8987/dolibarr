import 'dart:convert';

import 'package:dolibarr_project/screens/doli.accueil.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:http/http.dart' as http;

class Tiers extends StatelessWidget {
  const Tiers({super.key});
  void getTiers() {
    Uri url = Uri.parse(
        "https://dolimobile.with6.dolicloud.com/api/index.php/thirdparties?sortfield=t.rowid&sortorder=ASC&limit=100");
    http.get(url).then((response) => {print(json.decode(response.body))});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tiers'),
        backgroundColor: Accueil.couleurPrincipale,
      ),
      body: Center(
        child: InkWell(
          child: Text('page_accueil du module'),
          onTap: () => getTiers(),
        ),
      ),
    );
  }
}
