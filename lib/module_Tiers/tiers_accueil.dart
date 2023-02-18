// ignore_for_file: prefer_const_constructors
import 'dart:convert';

import 'package:dolibarr_project/screens/doli.accueil.dart';
import 'package:dolibarr_project/widgets/button_flottant.dart';
import 'package:flutter/material.dart';
// ignore_for_file: prefer_const_constructors
import 'package:http/http.dart' as http;

class Tiers extends StatefulWidget {
  const Tiers({super.key});

  @override
  State<Tiers> createState() => _TiersState();
}

class _TiersState extends State<Tiers> {
  //methode pour recueillir les donnees depuis l'API
  late List<dynamic> tiers = [
    {
      "name": "chargement ...",
      "email": "chargement ...",
      "phone": "chargement ..."
    },
  ];

  @override
  void initState() {
    super.initState();
    getTiers().then((data) {
      setState(() {
        tiers = data;
      });
    });
  }

  Future<List> getTiers() async {
    Uri url = Uri.parse(
        "https://dolimobile.with6.dolicloud.com/api/index.php/thirdparties?sortorder=ASC&sortfield=t.rowid&limit=100&DOLAPIKEY=8892d4a4ef3ab0fbcf3e05c66989ecfd35a2a2b6");
    var response = await http.get(url);
    var tiers = jsonDecode(response.body);
    return tiers;
  }

  int len = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tiers'),
        backgroundColor: Accueil.couleurPrincipale,
      ),
      floatingActionButton: MyFloatingActionButton(),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            GridView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                  crossAxisSpacing: 10.0,
                  mainAxisSpacing: 10.0,
                  mainAxisExtent: 70,
                ),
                itemCount: tiers.length,
                itemBuilder: (context, item) {
                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.white54,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    child: Container(
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          Column(
                            children: [
                              Row(
                                children: [
                                  Text(
                                    tiers[item]['status'] == "1"
                                        ? "ouvert"
                                        : "clos",
                                    style: TextStyle(
                                      backgroundColor: Colors.lightGreen,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  SizedBox(width: 10),
                                  //verifier nature
                                  Text(
                                    item % 2 == 0 ? "C" : "",
                                    style: TextStyle(
                                      backgroundColor: Colors.blue,
                                      fontSize: 15,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  SizedBox(width: 10),
                                  Text(
                                    item % 3 == 0 ? "T" : "",
                                    style: TextStyle(
                                      backgroundColor: Colors.purple,
                                      fontSize: 15,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  SizedBox(width: 10),
                                  Text(
                                    item % 4 == 0 ? "F" : "",
                                    style: TextStyle(
                                      backgroundColor: Colors.orangeAccent,
                                      fontSize: 15,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    "${tiers[item]['name']}",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  SizedBox(width: 10),
                                  Text(
                                    "Phone: ${tiers[item]['phone']}",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  SizedBox(width: 10),
                                  Text(
                                    "mail: ${tiers[item]['email']}",
                                    style: TextStyle(
                                      color: Colors.lightBlue,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                }),
          ],
        ),
      ),
    );
  }
}

// tableau
