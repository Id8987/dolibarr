
// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:dolibarr_project/screens/page_accueil.dart';
import 'package:dolibarr_project/screens/home_screen.dart';


const Color  d_blue = Color(0xFF263c5c);


class PageConnexion extends StatelessWidget {
  const PageConnexion({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white.withOpacity(0),
        leading: IconButton(
          // ignore: prefer_const_constructors
          icon: Icon(
            Icons.arrow_back,
            color: const Color(0xFF000000),
            size: 30,
          ), 
          onPressed: () { 
            Navigator.pop(
              context, 
              MaterialPageRoute(
                  builder: (context) => HomeScreen(),
                  ),
            );
           },
        ),
      ),
        // ignore: prefer_const_constructors
      body: SafeArea(
        child: Center(
          child: Column(
            
            // ignore: prefer_const_literals_to_create_immutables
            children: [
             
              // logo de Dolibarr
            
              Container(
                margin: const EdgeInsets.only(top: 60),
              child: Image.asset(
                'images/1.png',
                  
                   scale: 1.5,
               ), 
             ),
            const SizedBox(height: 20,),
             Container( 
              child: Column(
                children: [
                 Container(
                margin: const EdgeInsets.only(top: 40, left: 30),
                alignment: Alignment.topLeft,
                  child: Text('User Name',
                  style: GoogleFonts.poppins(
                    color: d_blue,
                    fontSize: 26, 
                  ),
                  ),
                 ),
                  Container(
                padding: EdgeInsets.all(10),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: 'your user name',
                    contentPadding: EdgeInsets.all(10),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                      // ignore: prefer_const_constructors
                      borderSide: BorderSide(
                        width: 1, 
                        color: d_blue,
                      )
                      ) ,
                  ) ,

                ),
              ),
                 Container(
                margin: const EdgeInsets.only(top: 20, left: 30),
                alignment: Alignment.topLeft,

                  child: Text('Password',
                  style: GoogleFonts.poppins(
                    color: d_blue,
                    fontSize: 26, 

                 
                 
                  ),
                 )
                 ),
 Container(
                padding: EdgeInsets.all(10),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: 'your password',
                   // suffixIcon: Icon(Icons.visibility_off),
                    contentPadding: EdgeInsets.only(left: 10),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                      // ignore: prefer_const_constructors
                      borderSide: BorderSide(
                        width: 1, 
                        color: d_blue,
                      )
                      ) ,
                  ) ,

                ),
                
              ),
              Container(
                // ignore: prefer_const_constructors
                child: Text('LOGIN',
                style: GoogleFonts.poppins(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w500,
                 ),
                ),
              )
                ,
                Container(
                child: Column(
                children: [
                ElevatedButton(
                 onPressed: () {
                  Navigator.push(
                    context, 
                    MaterialPageRoute(
                      builder: (context) => PageAccueil(),
                    ),
                    );
                },
                style: ElevatedButton.styleFrom(
                  shape: StadiumBorder(),
                  primary: d_blue,
                  padding: EdgeInsets.all(30),
                ),
                 child: null,
                  ),
               
            ])
          )]
              ),),


            
          ]),
        ),
        ),
          );
      
    
  }
}
