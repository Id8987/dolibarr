import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../screens/doli.accueil.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int _currentIndex = 1;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      fixedColor: Accueil.couleurPrincipale,
      currentIndex: _currentIndex,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          label: "Parametre",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: "Acceuil",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: "Profile",
        ),
      ],
      onTap: (index) {
        setState(() {
          _currentIndex = index;

          _currentIndex != 1
              ? Navigator.pushNamed(context,
                  "/" + Routes.bottomNavigationBarRoute.elementAt(index))
              : Navigator.pushReplacementNamed(context,
                  "/" + Routes.bottomNavigationBarRoute.elementAt(index));
        });
      },
    );
  }
}

class Routes {
  static List<String> bottomNavigationBarRoute = [
    "params",
    "accueil",
    "profile"
  ];
}
