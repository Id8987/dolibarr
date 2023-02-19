import 'package:dolibarr_project/screens/page_accueil.dart';
import 'package:dolibarr_project/screens/page_connexion.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:dolibarr_project/module-grh/nvx_candidature.dart';
import 'package:dolibarr_project/module-grh/nvx_postes.dart';
import 'package:dolibarr_project/module-grh/lst_candidatures.dart';
import 'package:dolibarr_project/module-grh/lst_postes.dart';
import 'package:google_fonts/google_fonts.dart';


class PageModuleGRH extends StatefulWidget {
  const PageModuleGRH({super.key});

  @override
  State<PageModuleGRH> createState() => _PageModuleGRHState();
}

class _PageModuleGRHState extends State<PageModuleGRH> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              padding: EdgeInsets.only(left: 30),
              decoration: BoxDecoration(
                color: d_blue,
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    child: Icon(FontAwesomeIcons.userTie,
                    size: 35,
                    color: d_blue,
                    ),
                    radius: 30,
                    backgroundColor: Colors.white,
                  ),
                  SizedBox(width: 10),
                  Text(
                    'Gestion des Ressources \n Humaines',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: Icon(FontAwesomeIcons.idCardAlt,
              size: 21,
              color: d_blue,
              ),
              title: Text('Nouvelle Candidature',
              style: TextStyle(
              fontSize: 15,
              )
              ),
              onTap: () { 
                 Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PageCandidature()),
                );
              
                
              },
            ),
            ListTile(
              leading: Icon(FontAwesomeIcons.clipboardList,
              size: 21,
              color: d_blue,
              ),
              title: Text('Listes des Candidatures',
              style: TextStyle(
                fontSize: 15
              ) ,
              ),
              onTap: () {
                Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PageCandidatureLst()));
              },
            ),
             ListTile(
              leading: Icon(Icons.assignment_ind,
              size: 21,
              color: d_blue,
              ),
              title: Text('Nouveaux Postes',
              style: TextStyle(
                fontSize: 15
              ) ,
              ),
              onTap: () {Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PagePoste()),);},
            ),
             ListTile(
              leading: Icon(FontAwesomeIcons.listUl,
              size: 21,
              color: d_blue,
              ),
              title: Text('Listes des Postes',
              style: TextStyle(
                fontSize: 15
              ) ,
              ),
              onTap: () {
                Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PagePosteLst()));
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: d_blue,
        iconTheme: IconThemeData(),
        title: Text(
          'Espace RH',
        ),
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: Icon(
                Icons.menu,
                color: Colors.white,
                size: 30,
              ),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
      ),
      body:Center( 
     
     
  //child: SafeArea(
    //       child: Center(
      //        child: Column(
                
        //          children: [
 
                 //   Container(
                      
   child: Text(' Ce module fournit les fonctionnalités de gestion \ndes contrats de travail des employées, \nde suivi de leur carrière et \nde leurs compétences',
      textAlign : TextAlign.center,
         style: GoogleFonts.poppins(
          fontSize: 15,

         ),
   ),
                    ),
                    
                  );
  }
}
