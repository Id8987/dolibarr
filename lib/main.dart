import 'package:dolibarr_project/screens/page_accueil.dart';
import 'package:dolibarr_project/screens/page_connexion.dart';
import 'package:flutter/material.dart';
import 'package:dolibarr_project/screens/home_screen.dart';
import 'package:dolibarr_project/screens/page_inscription.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: PageAccueil(),
    );
  }
}
