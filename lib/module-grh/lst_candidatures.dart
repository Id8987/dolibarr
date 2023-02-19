// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:dolibarr_project/screens/page_connexion.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:dolibarr_project/module-grh/GRH.dart';
import 'dart:math';
import 'package:http/http.dart' as http;


class PageCandidatureLst extends StatefulWidget {
  const PageCandidatureLst({super.key});
  @override
  State<PageCandidatureLst> createState() => _PageCandidatureLstState();
}

class _PageCandidatureLstState extends State<PageCandidatureLst> {
      List<Map<String, dynamic>> _dataList = [];

   @override
void initState(){
  super.initState();
  _generateData();
}
void _generateData(){
  final rng = Random();
  for(int i = 3; i>=1;i--){
_dataList.add({
  'ref':'PROV$i',
  'job':
  rng.nextBool()?'Directeur':'Assistant',
  'Nom': 
  rng.nextBool()?'DIOP':'SY',
  'Prenom':
  rng.nextBool()?'Fatimata ':'Awa ',
  'mail':
  rng.nextBool()?'Ousmanedia@gmail.com':'mjndour@outlook.fr',
 'telephone':
  rng.nextInt(4000)+ 773450654,
  'DateNaissance': DateTime(rng.nextInt(89)+1900,rng.nextInt(12)+1,rng.nextInt(28)+1),
  'RenumerationDemd':
  rng.nextInt(50000)+ 10000,
  'RenumerationProp':
  rng.nextInt(50000)+ 60000,
  'Etat':
  rng.nextBool()?'Contrat signe':'Contrat propose',

});
  }
}
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        backgroundColor: d_blue,
        iconTheme: IconThemeData(),
        title: Text(
          'Candidatures',   
        ) ,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: Icon(Icons.arrow_back ,
                color: Colors.white,
                size: 25,
              ),
              onPressed: () {
                  Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PageModuleGRH()));
              },
            );
          },
        ),
      ),
      
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: DataTable(columns: [
          
          DataColumn(label: Text('Ref.')),
          DataColumn(label: Text('Job')),
          DataColumn(label: Text('Nom')),
          DataColumn(label: Text('Prenom')),
          DataColumn(label: Text('E-mail')),
          DataColumn(label: Text('Telephone')),
          DataColumn(label: Text('Date de\nNaissance'),numeric: false),
          DataColumn(label: Text('Renumeration demandee'),numeric: true),
          DataColumn(label: Text('Renumeration proposee'),numeric: true),
          DataColumn(label: Text('Etat')),

        ],
        rows: _dataList.map ((data) {
        SizedBox: height: 300;

          return DataRow(cells: [
            DataCell(Text(data['ref'])),
            DataCell(Text(data['job'])),
            DataCell(Text(data['Nom'])),
            DataCell(Text(data['Prenom'])),
            DataCell(Text(data['mail'])),
            DataCell(Text('${data['telephone']}')),
            DataCell(Text('${data['DateNaissance'].day}/${data['DateNaissance'].month}/${data['DateNaissance'].year}')),
            DataCell(Text('${data['RenumerationDemd']}')),
            DataCell(Text('${data['RenumerationProp']}')),
            DataCell(Text(data['Etat'])),

          ]);
        } ).toList(),

        columnSpacing: 50.0,
        ),)
      
      );}}