// ignore_for_file: prefer_const_constructors
import 'package:dolibarr_project/module_Tiers/ajouter_client.dart';
import 'package:dolibarr_project/module_Tiers/ajouter_fournisseur.dart';
import 'package:dolibarr_project/module_Tiers/ajouter_prospect.dart';
import 'package:dolibarr_project/screens/doli.accueil.dart';
import 'package:flutter/material.dart';

class MyFloatingActionButton extends StatefulWidget {
  @override
  _MyFloatingActionButtonState createState() => _MyFloatingActionButtonState();
}

class _MyFloatingActionButtonState extends State<MyFloatingActionButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;
  bool _isOpen = false;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );

    _animation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        ScaleTransition(
          scale: _animation,
          child: Container(
            // onPressed: () {
            // Add your action here for "Nouveau Fournisseur"
            //},
            //tooltip: 'Nouveau Fournisseur',
            padding: EdgeInsets.all(20),
            color: Accueil.couleurPrincipale,
            child: InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => NouveauClientPage()));
              },
              child: const Text(
                'Nouveau Client',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 16,
        ),
        ScaleTransition(
          scale: _animation,
          child: Container(
            // onPressed: () {
            // Add your action here for "Nouveau Fournisseur"
            //},
            //tooltip: 'Nouveau Fournisseur',
            padding: EdgeInsets.all(20),
            color: Accueil.couleurPrincipale,
            child: InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => NouveauFournisseurPage()));
              },
              child: const Text(
                'Nouveau Fournisseur',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 16,
        ),
        ScaleTransition(
          scale: _animation,
          child: Container(
            // onPressed: () {
            // Add your action here for "Nouveau Fournisseur"
            //},
            //tooltip: 'Nouveau Fournisseur',

            padding: EdgeInsets.all(20),
            color: Accueil.couleurPrincipale,
            child: InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => NouveauProspectPage()));
              },
              child: const Text(
                'Nouveau Prospect',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 16,
        ),
        FloatingActionButton(
          backgroundColor: Accueil.couleurPrincipale,
          onPressed: () {
            if (_isOpen) {
              _animationController.reverse();
            } else {
              _animationController.forward();
            }
            _isOpen = !_isOpen;
          },
          tooltip: 'Ajouter',
          child: Icon(Icons.add),
        ),
      ],
    );
  }
}
