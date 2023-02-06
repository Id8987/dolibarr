import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  // Cr�ez un contr�leur pour le champ de formulaire pour obtenir des valeurs de retour
  final _formKey = GlobalKey<FormState>();

  // Variables pour stocker les entr�es de l'utilisateur
  String _username;
  String _email;
  String _password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            // Champ pour le nom d'utilisateur
            TextFormField(
              decoration: InputDecoration(labelText: 'Nom d\'utilisateur'),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Veuillez entrer un nom d\'utilisateur';
                }
                return null;
              },
              onSaved: (value) => _username = value,
            ),
            // Champ pour l'adresse e-mail
            TextFormField(
              decoration: InputDecoration(labelText: 'Adresse email'),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Veuillez entrer une adresse e-mail';
                }
                return null;
              },
              onSaved: (value) => _email = value,
            ),
            // Champ pour le mot de passe
            TextFormField(
              decoration: InputDecoration(labelText: 'Mot de passe'),
              obscureText: true,
              validator: (value) {
                if (value.isEmpty) {
                  return 'Veuillez entrer un mot de passe';
                }
                return null;
              },
              onSaved: (value) => _password = value,
            ),
            // Bouton d'inscription
            RaisedButton(
              onPressed: () {
                // Validez le formulaire uniquement si tous les champs sont valides
                if (_formKey.currentState.validate()) {
                  _formKey.currentState.save();

                  // Traitez les donn�es ici, par exemple en les envoyant � une API
                  print('Username: $_username');
                  print('Email: $_email');
                  print('Password: $_password');
                }
              },
              child: Text('Inscription'),
            ),
          ],
        ),
      ),
    );
  }
}
