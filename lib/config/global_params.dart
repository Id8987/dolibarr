import 'package:flutter/material.dart';

class GlobalParams {
  static List<Map<String, dynamic>> menus = [
    {"title": "Accueil", "icon": Icons.home, "route": "/accueil"},
    {"title": "Outils", "icon": Icons.settings, "route": "/inscription"},
  ];
  static List<Map<String, dynamic>> modules = [
    {
      "title": "Salaires",
      "icon": Icons.attach_money,
      "route": "/tier",
      // "image": "../assets/images/1.png"
    },
    {
      "title": "Recrutement",
      "icon": Icons.person_add,
      "route": "/grh",
      //"image": "../assets/images/1.png"
    },
    {
      "title": "Tiers",
      "icon": Icons.person_outlined,
      "route": "/tier",
      // "image": "../assets/images/1.png"
    },
    {
      "title": "Commande",
      "icon": Icons.shopping_cart,
      "route": "/commande",
      //"image": "../assets/images/1.png"
    },
    // {"title": "Facturation et paiement", "icon": Icons.home},
    // {"title": "Facturation et paiement", "icon": Icons.home},
    // {"title": "Facturation et paiement", "icon": Icons.home},
    // {"title": "Facturation et paiement", "icon": Icons.home},
    // {"title": "Facturation et paiement", "icon": Icons.home},
    // {"title": "Facturation et paiement", "icon": Icons.home},
    // {"title": "Facturation et paiement", "icon": Icons.home},
    // {"title": "Facturation et paiement", "icon": Icons.home},
    // {"title": "Facturation et paiement", "icon": Icons.home},
    // {"title": "Facturation et paiement", "icon": Icons.home},
    // {"title": "Facturation et paiement", "icon": Icons.home},
  ];
}
