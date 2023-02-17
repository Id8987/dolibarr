import 'package:dolibarr_project/screens/doli.accueil.dart';
import 'package:flutter/material.dart';
import 'package:dolibarr_project/widgets/my_drawwer_widget.dart';

import '../widgets/bottom_navigation.dart';

// ignore_for_file: prefer_const_constructors
class PageAccueil extends StatelessWidget {
  const PageAccueil({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //drawer: const MyDrawer(),
      appBar: AppBar(
        title: const Text('Dolibarr'),
        backgroundColor: Accueil.couleurPrincipale,
      ),
      // bottomNavigationBar: BottomNav(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
          child: Column(
            children: [
              Column(children: [
                Row(children: const [
                  Icon(Icons.settings),
                  SizedBox(width: 5),
                  Text(
                    'Configuration',
                    style: TextStyle(
                      letterSpacing: 1.2,
                    ),
                  ),
                ]),
                const SizedBox(height: 20),
                RichText(
                  text: const TextSpan(
                      text:
                          "L'espace configuration permet de réaliser le paramétrage initial afin de pouvoir commencer à utiliser l'application. Les paramètres d'installation ne peuvent être remplis que par les utilisateurs ",
                      style: TextStyle(
                        color: Colors.black,
                        letterSpacing: 1.2,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                            text: 'utilisateur administrateur',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              letterSpacing: 1.2,
                            )),
                        TextSpan(
                          text:
                              " uniquement. Les deux étapes obligatoires sont les deux premières entrées dans le menu de configuration, soit:",
                          style: TextStyle(
                              color: Colors.black, letterSpacing: 1.2),
                        ),
                      ]),
                ),
              ]),
              // ---------second child----------
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Row(
                      children: [
                        const Icon(Icons.home_max_outlined),
                        const SizedBox(
                          width: 5,
                        ),
                        InkWell(
                          child: const Text(
                            'Configuration-Societe/Organisation',
                            style: TextStyle(
                              letterSpacing: 1.2,
                            ),
                          ),
                          onTap: () {
                            Navigator.pushNamed(context, "/connection");
                          },
                        ),
                      ],
                    ),
                  ),
                  Container(
                    color: const Color.fromARGB(255, 225, 221, 221),
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      children: [
                        const Text(
                          'Paramètres de base utilisés pour personnaliser le comportement par défaut de votre application (par exemple pour les fonctionnalités liées au pays).',
                          style: TextStyle(
                            letterSpacing: 1.2,
                          ),
                        ),
                        const SizedBox(
                          height: 13,
                        ),
                        Container(
                          color: const Color.fromARGB(255, 244, 213, 173),
                          padding: const EdgeInsets.all(8),
                          margin: const EdgeInsets.only(bottom: 20),
                          child: Row(
                            children: const [
                              Icon(
                                Icons.warning,
                                color: Colors.yellow,
                              ),
                              Text(
                                'CLiquer ici pour configurer les \nparametres principaux',
                                style: TextStyle(
                                  letterSpacing: 1.2,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.only(top: 20),
                color: const Color.fromARGB(255, 225, 221, 221),
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    Row(
                      children: const [
                        Icon(Icons.settings),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          'Configuration-Module/Application',
                          style: TextStyle(
                            letterSpacing: 1.2,
                          ),
                        ),
                      ],
                    ),
                    // text concernant module application
                    const Text(
                      'Ce logiciel est une suite de nombreux modules/applications. Les modules liés à vos besoins doivent être activés et configurés. Les entrées de menu apparaîtront avec l\'activation de ces modules.',
                      style: TextStyle(
                        letterSpacing: 1.2,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
