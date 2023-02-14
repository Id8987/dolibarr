import 'package:dolibarr_project/screens/page_connexion.dart';
import 'package:dolibarr_project/screens/page_inscription.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
         appBar: AppBar(
    backgroundColor: Colors.white,
    title: Text("Home Page"),),
    drawer: Drawer(
    child: ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
        DrawerHeader(
          child: Text("Navigation"),
          decoration: BoxDecoration(
            color: Colors.white,
          ),
        )])),
    
        body: SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/logo3.jpg"),
          
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  height: 250,
                  width: 250,
                  child: Image.asset("assets/images/logo.png"),
                  
                ),
                 Container(
                  height: 250,
                  width: 250,
                  child: Image.asset("assets/images/photo4.png"),
                  
                ),
                SizedBox(height: 50),
                Text(
                  "Bienvenue sur notre application mobile dolibar" ,
                  style: TextStyle(
                    fontSize: 35,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 50),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    InkWell(
                      onTap: () {
                        // Navigate to sign up page
                         Navigator.push(
                      context, 
                      MaterialPageRoute(
                        builder: (context) => PageInscription(),
                      ),
                      );
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 16, horizontal: 24),
                        decoration: BoxDecoration(
                          color: Colors.blue[900],
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Text(
                          "Inscription",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 30),
                    InkWell(
                      onTap: () {
                        // Navigate to sign in page
                          Navigator.push(
                      context, 
                      MaterialPageRoute(
                        builder: (context) => PageConnexion(),
                      ),
                      );
                        
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 16, horizontal: 24),
                        decoration: BoxDecoration(
                          color: Colors.blue[900],
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Text(
                          "Connexion",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
