import 'package:dolibarr_project/config/global_params.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

// ignore_for_file: prefer_const_constructors
class Accueil extends StatefulWidget {
  const Accueil({super.key});
  // couleur de la page
  static Color couleurPrincipale = Color.fromARGB(255, 3, 51, 93);

  @override
  State<Accueil> createState() => _AccueilState();
}

class _AccueilState extends State<Accueil> {
  //variable pour la barre de navigation
  int _currentIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Dolibarr'),
            IconButton(
              onPressed: () {
                Navigator.pushNamed(context, "/principale");
              },
              icon: Icon(Icons.logout),
            ),
          ],
        ),
        centerTitle: true,
        backgroundColor: Accueil.couleurPrincipale,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.0),
        child: Modules(),
      ),
      bottomNavigationBar: BottomNavigationBar(
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
                : null;
          });
        },
      ),
    );
  }
}

class Modules extends StatelessWidget {
  const Modules({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 1,
        crossAxisSpacing: 10.0,
        mainAxisSpacing: 10.0,
        mainAxisExtent: 150,
      ),
      itemCount: GlobalParams.modules.length,
      itemBuilder: (context, item) {
        return InkWell(
          onTap: () {
            print("tapped");
          },
          child: Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: Accueil.couleurPrincipale,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.white,
                  child: Icon(
                    GlobalParams.modules.elementAt(item)['icon'],
                    size: 30,
                    color: Accueil.couleurPrincipale,
                  ),
                ),
                Text(
                  "${GlobalParams.modules.elementAt(item)['title']}",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
        );
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
