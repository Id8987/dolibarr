import 'package:flutter/material.dart';
import 'package:dolibarr_project/widgets/my_drawwer_widget.dart';

class PageAccueil extends StatelessWidget {
  const PageAccueil({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      appBar: AppBar(
        title: Text('Dolibarr'),
        backgroundColor: Colors.blue.shade300,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              child: Center(
                child: Text('Entete de Page '),
              ),
              color: Colors.red,
            ),
          ],
        ),
      ),
    );
  }
}
