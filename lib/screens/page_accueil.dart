import 'package:flutter/material.dart';


class PageAccueil extends StatelessWidget {
  const PageAccueil({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page d accueil'),
        backgroundColor: Colors.red,
      ),
      body: const  Center(
        child: Text('Rone tu travailles ici '),
      ),
    );
  }
}