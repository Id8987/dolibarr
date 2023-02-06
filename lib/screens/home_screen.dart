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
    
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("/home/arona/Images/logo3.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                height: 250,
                width: 250,
                child: Image.asset("/home/arona/Images/logo.png"),
                
              ),
               Container(
                height: 250,
                width: 250,
                child: Image.asset("/home/arona/Images/photo4.png"),
                
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
    );
  }
}
