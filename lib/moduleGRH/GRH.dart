
import 'package:dolibarr_project/screens/page_accueil.dart';
import 'package:dolibarr_project/screens/page_connexion.dart';
import 'package:dolibarr_project/moduleGRH/menu.dart';

import 'package:flutter/material.dart';

class PageModuleGRH extends StatefulWidget {
  const PageModuleGRH({super.key});

  @override
  State<PageModuleGRH> createState() => _PageModuleGRHState();
}

class _PageModuleGRHState extends State<PageModuleGRH> {
   @override
  Widget build(BuildContext context) {
    return Scaffold(
      
        appBar: AppBar(
          backgroundColor: d_blue,
          iconTheme: IconThemeData(),
          title: Text('Espace RH',
          
          ),
          
          leading: IconButton(
            // ignore: prefer_const_constructors
            icon: Icon(
              Icons.menu,
              color: Colors.white,
              size: 30,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>  PageMenu(),
                ),
              );
            },
          ),
        ),)
        ;
      
      
      
      
      
      
      }

     }