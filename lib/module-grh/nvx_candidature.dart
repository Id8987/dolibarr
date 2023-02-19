// ignore_for_file: prefer_const_constructors

import 'package:dolibarr_project/module-grh/GRH.dart';
import 'package:flutter/material.dart';
import 'package:dolibarr_project/screens/page_connexion.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';



class PageCandidature extends StatefulWidget {
  const PageCandidature({super.key});

  @override
  State<PageCandidature> createState() => _PageCandidature();
}

class _PageCandidature extends State<PageCandidature> {
   @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        backgroundColor: d_blue,
        iconTheme: IconThemeData(),
        title: Text(
          'Nouvelle Candidature',   
        ) ,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              padding: EdgeInsets.only(left:2) ,
              icon: Icon(Icons.arrow_back ,
               color: Colors.white,
                size: 25,
              ),
              
              onPressed: () {
                Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PageModuleGRH()));
              },
            );
          },
        ),
      ),
       body:SingleChildScrollView( 
      child: SafeArea(
            child: Center(
              child: Column(
                  children: [
                    Container(
                       padding: EdgeInsets.only(top: 60,left:30,right: 30, ),
                          child: TextFormField(
                            decoration: InputDecoration(
                              hintText: 'Job',
                              hintStyle: TextStyle(
                                fontSize: 15,

                              ),
                             suffixIcon: Icon(FontAwesomeIcons.idCardAlt,
                             size: 15,
                             ),
                            contentPadding: EdgeInsets.all(10),
                            ),
                          ),
                    ),
                    Container(
                       padding: EdgeInsets.only(left:30,right: 30 ),
                          child: TextFormField(
                           // controller: _champLoginController,
                            decoration: InputDecoration(
                              hintText: 'Nom',
                              hintStyle: TextStyle(
                                fontSize: 15,
                              ),
                             // suffixIcon: Icon(Icons.person),
                              contentPadding: EdgeInsets.all(10),
                            ),
                          ),
                    ),
                      Container(
                       padding: EdgeInsets.only(left:30,right: 30 ),
                          child: TextFormField(
                           // controller: _champLoginController,
                            decoration: InputDecoration(
                              hintText: 'Prénom',
                              hintStyle: TextStyle(
                                fontSize: 15,
                              ),
                             // suffixIcon: Icon(Icons.person),
                              contentPadding: EdgeInsets.all(10),
                            ),
                          ),
                    ),
                      Container(
                       padding: EdgeInsets.only(left:30,right: 30 ),
                          child: TextFormField(
                           // controller: _champLoginController,
                            decoration: InputDecoration(
                              hintText: 'E-mail',
                              hintStyle: TextStyle(
                                fontSize: 15,
                              ),
                              suffixIcon: Icon(Icons.mail),
                              contentPadding: EdgeInsets.all(10),
                            ),
                          ),
                    ),
                     Container(
                       padding: EdgeInsets.only(left:30,right: 30 ),
                          child: TextFormField(
                           // controller: _champLoginController,
                            decoration: InputDecoration(
                              hintText: 'Téléphone',
                              hintStyle: TextStyle(
                                fontSize: 15,
                              ),
                              suffixIcon: Icon(Icons.phone),
                              contentPadding: EdgeInsets.all(10),
                            ),
                          ),
                    ),
                    Container(
                      padding: EdgeInsets.only(left:30,right: 30 ),
                     // mainAxisAlignment: MainAxisAlignment.center,
                          child:TextFormField(
                           // controller: _champLoginController,
                            decoration: InputDecoration(
                              hintText: 'Date de Naissance',
                              hintStyle: TextStyle(
                                fontSize: 15,
                              ),
                             // suffixIcon: Icon(Icons.phone),
                              contentPadding: EdgeInsets.all(10),
                            ),
                          ),
                    ),
                   Container(
                      padding: EdgeInsets.only(left:30,right: 30 ),
                     // mainAxisAlignment: MainAxisAlignment.center,
                          child:TextFormField(
                           // controller: _champLoginController,
                            decoration: InputDecoration(
                              hintText: 'Rénumération demandée',
                              hintStyle: TextStyle(
                                fontSize: 15,
                              ),
                            // suffixIcon: Icon(Icons.calendar_month),
                              contentPadding: EdgeInsets.all(10),
                            ),
                          ),
               ),
               
               Container(
                      padding: EdgeInsets.only(left:30,right: 30 ),
                     // mainAxisAlignment: MainAxisAlignment.center,
                          child:TextFormField(
                           // controller: _champLoginController,
                            decoration: InputDecoration(
                              hintText: 'Rénumération Proposée',
                              hintStyle: TextStyle(
                                fontSize: 15,
                              ),
                            // suffixIcon: Icon(Icons.calendar_month),
                              contentPadding: EdgeInsets.all(10),
                            ),
                          ),
               ),

               Container(
                      padding: EdgeInsets.only(left:30,right: 30 ),
                     // mainAxisAlignment: MainAxisAlignment.center,
                          child:TextFormField(
                           // controller: _champLoginController,
                            decoration: InputDecoration(
                              hintText: 'Date Création',
                              hintStyle: TextStyle(
                                fontSize: 15,
                              ),
                            suffixIcon: Icon(Icons.calendar_month),
                              contentPadding: EdgeInsets.all(10),
                            ),
                          ),
              ),

               Container(
                      padding: EdgeInsets.only(left:30,right: 30 ),
                      //mainAxisAlignment: MainAxisAlignment.center,
                          child:TextFormField(
                           // controller: _champLoginController,
                            decoration: InputDecoration(
                              hintText: 'Etat',
                              hintStyle: TextStyle(
                                fontSize: 15,
                              ),
                            // suffixIcon: Icon(Icons.calendar_month),
                              //contentPadding: EdgeInsets.all(10),
                            ),
                          ),
                   ),
                   SizedBox(height: 30),
                    Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                ElevatedButton(
                                  child: Text(
                                    '   Creer   ',
                                    style: GoogleFonts.poppins(
                                      color: Colors.white,
                                      fontSize: 20,
                                      // fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  onPressed: () {
                                 
                                  },
                                  style: ElevatedButton.styleFrom(
                                      shape: StadiumBorder(),
                                      backgroundColor: d_blue,
                                      padding: EdgeInsets.all(10)),
                                ),
                              
                        
                       
                                ElevatedButton(
                                  child: Text(
                                    'Annuler',
                                    style: GoogleFonts.poppins(
                                      color: Colors.white,
                                      fontSize: 20,
                                      // fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  onPressed: () {
                                 
                                  },
                                  style: ElevatedButton.styleFrom(
                                      shape: StadiumBorder(),
                                      backgroundColor: d_blue,
                                      padding: EdgeInsets.all(10)),
                                )
                              ]),]),
                        ),
                     ),
                  ),
            );
          
        
      }
    }