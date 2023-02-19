// ignore_for_file: prefer_const_constructors

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:dolibarr_project/screens/page_parametre.dart';
import 'package:dolibarr_project/screens/home_screen.dart';
import 'package:dolibarr_project/screens/mdp_oublie.dart';
import 'package:dolibarr_project/screens/page_inscription.dart';
import 'package:http/http.dart' as http;

import 'doli.accueil.dart';

const Color d_blue = Color(0xFF263c5c);

class PageConnexion extends StatefulWidget {
  const PageConnexion({super.key});

  @override
  State<PageConnexion> createState() => _PageConnexionState();
}

class _PageConnexionState extends State<PageConnexion> {
  // variable qui controle l'affichage des erreurs
  var afficherErreur = false;

  dynamic data;
  // methode pour connecter l'utilisateur
  void connectUser(String login, String password) {

    Uri uri = Uri.parse(

        "https://dolimobile.with6.dolicloud.com/api/index.php/login?login=$login&password=$password");




    http.get(uri).then((response) {
      setState(() {
        this.data = json.decode(response.body);
        if (data['success']['code'] == 200) {
          print('ok');
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Accueil(),
            ),
          );
        }
      });
    }).catchError((err) {
      setState(() {
        afficherErreur = true;
        _champLoginController.text = '';
        _champMdpController.text = '';
      });
    });
  }

  // variable pour recuperer les donnees entrees dans les champs login et mdp
  final _champLoginController = TextEditingController();
  final _champMdpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white.withOpacity(0),
          // leading: IconButton(
          //   // ignore: prefer_const_constructors
          //   icon: Icon(
          //     Icons.arrow_back,
          //     color: const Color(0xFF000000),
          //     size: 30,
          //   ),
          //   onPressed: () {
          //     Navigator.push(
          //       context,
          //       MaterialPageRoute(
          //         builder: (context) => HomeScreen(),
          //       ),
          //     );
          //   },
          // ),
        ),

        // ignore: prefer_const_constructors
        body: SingleChildScrollView(
          child: SafeArea(
            child: Center(
              child: Column(

                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    // logo de Dolibarr

                    Container(
                      margin: const EdgeInsets.only(top: 40, bottom:5),
                      child: Image.asset(
                        'assets/images/1.png',
                        scale: 1.5,
                      ),
                    ),
                    //Sconst SizedBox(height: 20,),
                    Container(

                 child: Text('DoliApp',
                    style: GoogleFonts.poppins(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      color: d_blue,
                    ),
                    
                  )    
                    ),
                    Container(
                      child: Column(children: [
                        Container(),
                        Container(
                          padding: EdgeInsets.only(top: 20,left:30,right: 30 ),
                          child: TextFormField(
                            controller: _champLoginController,
                            decoration: InputDecoration(
                              hintText: 'Identifiant',
                              hintStyle: TextStyle(
                                fontSize: 19,
                              ),
                              suffixIcon: Icon(Icons.person),
                              contentPadding: EdgeInsets.all(10),
                            ),
                          ),
                        ),
                        Container(),
                        Container(
                          padding: EdgeInsets.only(top:20,right: 30,left: 30),
                          child: TextFormField(
                            controller: _champMdpController,
                            obscureText: true,
                            decoration: InputDecoration(
                              hintText: 'Mot de passe',
                              hintStyle: TextStyle(
                                fontSize: 18,
                              ),
                              suffixIcon: Icon(Icons.vpn_key),
                              //    contentPadding: EdgeInsets.only(left: 10,bottom:0),
                            ),
                          ),
                        ),

                        //cette classe est definie en bas : c'est pour afficher une erreurs en cas d'identifiant(incorrect)
                        afficherErreur ? HandleError() : Container(),
                        Container(
                          margin: const EdgeInsets.only(top: 50),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              // crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                // const  SizedBox(width: 100 ),
                                ElevatedButton(
                                  child: Text(
                                    'Se Connecter',
                                    style: GoogleFonts.poppins(
                                      color: Colors.white,
                                      fontSize: 20,
                                      // fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  onPressed: () {
                                    connectUser(_champLoginController.text,
                                        _champMdpController.text);
                                  },
                                  style: ElevatedButton.styleFrom(
                                      shape: StadiumBorder(),
                                      backgroundColor: d_blue,
                                      padding: EdgeInsets.all(10)),
                                )
                              ]),
                        ),
                      ]),
                    ),
                  
                    Row(
                        // ignore: prefer_const_constructors
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Align(
                              child: Container(
                            margin: EdgeInsets.only(top: 5),
                            child: TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => PageInscription(),
                                  ),
                                );
                              },
                              // child: Expanded(

                              child: Center(
                                child: Text(
                                  "Vous n'avez pas de compte?",
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.poppins(
                                    color: Color.fromARGB(255, 112, 143, 168),
                                    // fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ),
                          )),
                        ]),
                  ]),
            ),
          ),
        ));
  }
}

class HandleError extends StatelessWidget {
  const HandleError({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      color: Colors.redAccent,
      child: Text(
        'Login or password incorrect',
        style: TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }
}
