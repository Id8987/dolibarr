import 'package:dolibarr_project/module_Tiers/tiers_accueil.dart';
import 'package:dolibarr_project/screens/doli.accueil.dart';
import 'package:dolibarr_project/screens/page_parametre.dart';
import 'package:dolibarr_project/screens/page_connexion.dart';
import 'package:dolibarr_project/screens/page_profile.dart';
import 'package:flutter/material.dart';
import 'package:dolibarr_project/screens/home_screen.dart';
import 'package:dolibarr_project/screens/page_inscription.dart';
import 'package:dolibarr_project/screens/mdp_oublie.dart';

import 'module-grh/GRH.dart';
import 'module_commandes/ListeCommande.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      routes: {
        "/principale": (context) => HomeScreen(),
        "/inscription": (context) => PageInscription(),
        "/connection": (context) => PageConnexion(),
        "/accueil": (context) => Accueil(),
        "/mdpoublie": (context) => PageMdpOublie(),
        "/profile": (context) => ProfileUtilisateur(
              apiKey: 'iso',
              apiUrl: 'https://dolimobile.with6.dolicloud.com',
            ),
        "/params": (context) => PageAccueil(),
        "/tier": (context) => Tiers(),
        "/grh": (context) => PageModuleGRH(),
        "/commande": (context) => CommandeListPage(),
      },
      debugShowCheckedModeBanner: false,
      initialRoute: "/principale",
    );
  }
}
