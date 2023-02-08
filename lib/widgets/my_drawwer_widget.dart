import 'package:flutter/material.dart';

// ce widget gere le menu de gauche
class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: const [
          DrawerHeader(
            child: Text('Dolibarr'),
          ),
        ],
      ),
    );
  }
}
