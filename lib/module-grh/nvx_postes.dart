// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:dolibarr_project/screens/page_connexion.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:dolibarr_project/module-grh/GRH.dart';
import 'package:google_fonts/google_fonts.dart';



class PagePoste extends StatefulWidget {
  const PagePoste({super.key});

  @override
  State<PagePoste> createState() => _PagePoste();
}

class _PagePoste extends State<PagePoste> {
   @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        backgroundColor: d_blue,
        iconTheme: IconThemeData(),
        title: Text(
          'Nouveau Poste',   
        ) ,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: Icon(Icons.arrow_back,
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
                       padding: EdgeInsets.only(top: 50,left:30,right: 30, ),
                          child: TextFormField(
                            decoration: InputDecoration(
                              hintText: 'Intitule du poste',
                              hintStyle: TextStyle(
                                fontSize: 15,
                              ),
                          // contentPadding: EdgeInsets.all(10),
                             ),
                            ),
                          ),
                          Container (
                      padding: EdgeInsets.only(left:30,right: 30 ),
                          child:TextFormField(
                            decoration: InputDecoration(
                              hintText: 'Nombre de postes disponibles',
                              hintStyle: TextStyle(
                                fontSize: 15,
                              ),
                            //  contentPadding: EdgeInsets.all(10),
                            ),
                          ),
               ) ,

                    Container(
                       padding: EdgeInsets.only(left:30,right: 30, ),
                          child: TextFormField(
                            decoration: InputDecoration(
                              hintText: 'Responsable du recrutement',
                              hintStyle: TextStyle(
                                fontSize: 15,
                              ),
                             suffixIcon: Icon(Icons.person,
                            size: 15,
                             ),
                              
                          // contentPadding: EdgeInsets.all(10),

                          )
                          )
                          ),

                            Container(
                       padding: EdgeInsets.only(left:30,right: 30 ),
                          child: TextFormField(
                            decoration: InputDecoration(
                              hintText: 'E-mail recruteur',
                              hintStyle: TextStyle(
                                fontSize: 15,
                              ),
                              suffixIcon: Icon(Icons.mail,
                              size: 15,
                              ),
                              contentPadding: EdgeInsets.all(10),
                            ),
                          ),
                    ),

                     Container(
                       padding: EdgeInsets.only(left:30,right: 30, ),
                          child: TextFormField(
                            decoration: InputDecoration(
                              hintText: 'Responsable futur',
                              hintStyle: TextStyle(
                                fontSize: 15,

                              ),
                             suffixIcon: Icon(Icons.person,
                             size: 15,
                             ),
                             
                           contentPadding: EdgeInsets.all(10),
                          )
                          )
                          ),

                           Container(
                       padding: EdgeInsets.only(left:30,right: 30, ),
                          child: TextFormField(
                            decoration: InputDecoration(
                              hintText: 'Lieu du travail',
                              hintStyle: TextStyle(
                                fontSize: 15,

                              ),
                             suffixIcon: Icon(Icons.location_on,

                             size: 15,
                             ),
                          
                           contentPadding: EdgeInsets.all(10),
                          )
                          )
                          ),

                            Container (
                      padding: EdgeInsets.only(top: 10,left:30,right: 30 ),
                          child:TextFormField(
                            decoration: InputDecoration(
                              hintText: 'Date souhaitée',
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
                          child: TextFormField(
                           // controller: _champLoginController,
                            decoration: InputDecoration(
                              hintText: 'Rénumération',
                              hintStyle: TextStyle(
                                fontSize: 15,
                              ),
                              contentPadding: EdgeInsets.all(10),
                            ),
                          ),
                ),
                    Container(
                       padding: EdgeInsets.only(top: 10,left:30,right: 30 ),
                          child:TextFormField(
                           // controller: _champLoginController,
                            decoration: InputDecoration(
                              hintText: 'Description',
                              hintStyle: TextStyle(
                                fontSize: 15,
                                
                              ),
                              hintMaxLines:50,
                              contentPadding: EdgeInsets.all(10),
                            ),
                          ),
                   ),
                        SizedBox(height: 40,),
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
                              ]),
                       ] ),
                   )
     )
     )
     )
     
      ;}}