// ignore_for_file: prefer_const_constructors_in_immutables

import 'dart:convert';

import 'package:dolibarr_project/screens/doli.accueil.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ProfileUtilisateur extends StatefulWidget {
  final String apiUrl;
  final String apiKey;

  ProfileUtilisateur({required this.apiUrl, required this.apiKey});

  @override
  _ProfileUtilisateurState createState() => _ProfileUtilisateurState();
}

class _ProfileUtilisateurState extends State<ProfileUtilisateur>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  late Map<String, dynamic> _userProfile = {
    "lastName": "...",
    "firstName": "...",
    "email": "..."
  };
  String _errorMessage = '';

  @override
  void initState() {
    super.initState();
    _getUserProfile();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );

    _controller.forward();
  }

  Future<void> _getUserProfile() async {
    try {
      var response = await http.get(
        Uri.parse('${widget.apiUrl}/api/index.php/user/${widget.apiKey}'),
      );
      if (response.statusCode == 200) {
        setState(() {
          _userProfile = jsonDecode(response.body)['result'];
        });
      } else {
        throw Exception('Failed to load user profile');
      }
    } catch (e) {
      setState(() {
        _errorMessage = 'Failed to load user profile';
        print(e);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Accueil.couleurPrincipale,
        title: Text('Profile'),
      ),
      body: Center(
        child: _errorMessage.isEmpty
            ? FadeTransition(
                opacity: _animation,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      _userProfile['lastname'] +
                          ' ' +
                          _userProfile['firstname'],
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 16),
                    Text(
                      _userProfile['email'],
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(height: 32),
                    //RaisedButton(
                    //onPressed: () {},
                    //child: Text('Edit Profile'),
                    //),
                  ],
                ),
              )
            : Text(
                _errorMessage,
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.red,
                ),
              ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
