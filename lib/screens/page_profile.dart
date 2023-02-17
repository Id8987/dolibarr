import 'package:dolibarr_project/screens/doli.accueil.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

//ignore_for_file:  prefer_const_constructors
class ProfileUtilisateur extends StatelessWidget {
  const ProfileUtilisateur({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Accueil.couleurPrincipale,
        title: Text("profile"),
      ),
      body: Center(
        child: Text('Profile'),
      ),
    );
  }
}
