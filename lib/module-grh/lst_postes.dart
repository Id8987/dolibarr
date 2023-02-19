// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:dolibarr_project/screens/page_connexion.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:dolibarr_project/module-grh/GRH.dart';
import 'dart:math';


class PagePosteLst extends StatefulWidget {
  const PagePosteLst({super.key});
  @override
  State<PagePosteLst> createState() => _PagePosteLstState();
}

class _PagePosteLstState extends State<PagePosteLst> {
      List<Map<String, dynamic>> _dataList = [];

   @override
void initState(){
  super.initState();
  _generateData();
}
void _generateData(){
  final rng = Random();
  for(int i = 4; i>=1;i--){
_dataList.add({
  'ref':'ref-$i',
  'intitule':
  rng.nextBool()?'Directeur':'Assiatant',
  'nbrePosteDispo': 
  rng.nextInt(10),
  'resRecrutement':
  rng.nextBool()?'Fatimata DIA':'Awa Kouma',
  'resFutur':
  rng.nextBool()?'Ousmane DIA':'Salimata Kouma',
  'DateShtee': DateTime(rng.nextInt(4)+2019,rng.nextInt(12)+1,rng.nextInt(28)+1),
  'Renumeration':
  rng.nextInt(50000)+ 10000,
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
          'Offres d\'emploi',   
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
          DataColumn(label: Text('Intitule\ndu poste')),
          DataColumn(label: Text('Nombre de\npostes\ndisponibles')),
          DataColumn(label: Text('Responsable\ndu recrutement')),
          DataColumn(label: Text('Responsable futur')),
          DataColumn(label: Text('Date Souhaitee'),numeric: false),
          DataColumn(label: Text('Renumeration'),numeric: true),
          DataColumn(label: Text('Etat')),

        ],
        rows: _dataList.map ((data) {
        SizedBox: height: 300;

          return DataRow(cells: [
            DataCell(Text(data['ref'])),
            DataCell(Text(data['intitule'])),
            DataCell(Text('${data['nbrePosteDispo']}')),
            DataCell(Text(data['resRecrutement'])),
            DataCell(Text(data['resFutur'])),
            DataCell(Text('${data['DateShtee'].day}/${data['DateShtee'].month}/${data['DateShtee'].year}')),
            DataCell(Text('${data['Renumeration']}')),
            DataCell(Text(data['Etat'])),

          ]);
        } ).toList(),

        columnSpacing: 50.0,
        ),)
      
      );}}