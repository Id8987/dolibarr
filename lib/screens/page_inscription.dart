// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class PageInscription extends StatefulWidget {
  @override
State<StatefulWidget> createState() => _PageInscription();

}

class _PageInscription extends State<PageInscription> {
  // Cr�ez un contr�leur pour le champ de formulaire pour obtenir des valeurs de retour
  final _formKey = GlobalKey<FormState>();

  // Variables pour stocker les entr�es de l'utilisateur
  String _prenom ="";
  String _nom ="";
  String _username = "";
  String _email = "";
  String _password ="";
  String _confirmpassword ="";
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Column(
        
        children: [
          
         const Card(
           child: Padding(
           padding: EdgeInsets.all(16.0),
           ),
         ),
          
          const Image(
            image: AssetImage('lib/assets/images/dolibarr_mobile.JPG'),
            ),
          Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(left: 30, right: 30),
                
                   //Champ pour le prenom
                  child: TextFormField(
                   decoration: InputDecoration(labelText: 'Prénom'),
                   
                  validator: (value) {
                    if (value !=null && value.isEmpty) {
                      return 'Veuillez entrer votre prénom';
                      }
                    return null;
                  },
                  
                  ),
                ),
                
                // Champ pour nom
                Container(
                  margin: EdgeInsets.only(left: 30, right: 30),
                  child: TextFormField(
                  decoration: InputDecoration(labelText: 'Nom'),
                  validator: (value) {
                    if (value !=null && value.isEmpty) {
                      return 'Veuillez entrer votre nom';
                    }
                    return null;
                  },
                  
                ),
                ),
                // Champ pour le nom d'utilisateur
                Container(
                  margin: EdgeInsets.only(left: 30, right: 30),
                child: TextFormField(
                  decoration: InputDecoration(labelText: 'Nom d\'utilisateur'),
                  validator: (value) {
                    if (value !=null && value.isEmpty) {
                      return 'Veuillez entrer un nom d\'utilisateur';
                    }
                    return null;
                  },
                  
                ),
                ),
                
                // Champ pour l'adresse e-mail
                Container(
                  margin: EdgeInsets.only(left: 30, right: 30),
                child :TextFormField(
                  decoration: InputDecoration(labelText: 'Adresse e-mail'),
                  validator: (value) {
                    if (value !=null && value.isEmpty) {
                      return 'Veuillez entrer une adresse e-mail';
                    }
                    return null;
                  },
                  
                ),
                ),
                // Champ pour le mot de passe
                Container(
                  margin: EdgeInsets.only(left: 30, right: 30),
                 child : TextFormField(
                  decoration: InputDecoration(labelText: 'Mot de passe'),
                  obscureText: true,
                  validator: (value) {
                    if (value !=null && value.isEmpty) {
                      return 'Veuillez entrer un mot de passe';
                    }
                    return null;
                  },
                  
                ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 30, right: 30),
                child : TextFormField(
                  decoration: InputDecoration(labelText: 'Confirmer mot de passe'),
                  obscureText: true,
                  validator: (value) {
                    if (value !=null && value.isEmpty) {
                      return 'Veuillez confirmer votre mot de passe';
                    }
                    return null;
                  },
                  
                ),
                ),
               
                // Bouton d'inscription
                Container(
                      height: 30,
                      margin: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(5),
                                 ),
                    child: TextButton(
                    style: ButtonStyle(
                    foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                    overlayColor: MaterialStateProperty.resolveWith<Color?>(
                                 (Set<MaterialState> states) {
                                 if (states.contains(MaterialState.hovered))
                              return Colors.blue.withOpacity(0.04);
                              if (states.contains(MaterialState.focused) ||
                                states.contains(MaterialState.pressed))
                                return Colors.blue.withOpacity(0.12);
                       return null;
                },
               ),
              ),
             onPressed: () {
               Navigator.push(
             context,
             MaterialPageRoute(builder: (context) => PageSucces()),
             );
             },
            child: Text('ENREGISTRER'),
           ),
          ),
     

              ],
            ),
          ),
        ],
      ),
    );
    
  }
}
class PageSucces extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Inscription réussie !",style: TextStyle(
              fontSize: 40.0,
              color: Colors.lightBlue,
            )
            ),
    
          
        
      ),
      
    );
  }
}
