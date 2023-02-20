import 'dart:math';
import 'package:dolibarr_project/screens/Facturation_Paiement/nouveau.dart';
import 'package:dolibarr_project/screens/Facturation_Paiement/liste_salarie.dart';
import 'package:dolibarr_project/screens/Facturation_Paiement/reglements.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomeSalaire(),
    );
  }
}

class MyHomeSalaire extends StatefulWidget {
  @override
  _MyHomeSalaireState createState() => _MyHomeSalaireState();
}

class _MyHomeSalaireState extends State<MyHomeSalaire> {
  int _selectedIndex = 0;

  final List<Widget> _widgetOptions = <Widget>[
    Text(
      'Cliquez sur Menu. Choisissez une option',
      style: TextStyle(
        fontSize: 25,
        color: Color.fromARGB(255, 11, 95, 163),
      ),
    ),
    Text(
      'Cliquez sur Menu. Choisissez une option',
      style: TextStyle(
        fontSize: 25,
        color: Color.fromARGB(255, 11, 95, 163),
      ),
    ),
    Text(
      'Cliquez sur Menu. Choisissez une option',
      style: TextStyle(
        fontSize: 25,
        color: Color.fromARGB(255, 11, 95, 163),
      ),
    ),
    Text(
      'Cliquez sur Menu. Choisissez une option',
      style: TextStyle(
        fontSize: 25,
        color: Color.fromARGB(255, 11, 95, 163),
      ),
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 11, 95, 163),
        title: Text('Facturation et paiement'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text(
                'Salaires',
                style: TextStyle(
                  fontSize: 35,
                  color: Colors.white,
                ),
              ),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 11, 95, 163),
              ),
            ),
            ListTile(
              leading: Icon(Icons.add),
              title: Text('Nouveau'),
              selected: _selectedIndex == 0,
              onTap: () {
                _onItemTapped(0);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PageNouveau()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.list),
              title: Text('Liste'),
              selected: _selectedIndex == 1,
              onTap: () {
                _onItemTapped(1);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Listesalarie()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.rule),
              title: Text('Règlements'),
              selected: _selectedIndex == 2,
              onTap: () {
                _onItemTapped(2);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ReglementPage()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.bar_chart),
              title: Text('Statistiques'),
              selected: _selectedIndex == 3,
              onTap: () {
                _onItemTapped(3);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SalarysChart()),
                );
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
    );
  }
}

class PageNouveau extends StatelessWidget {
  List<List<String>> _tableData = List.empty();

  TextEditingController _refController = TextEditingController();
  TextEditingController _libelleController = TextEditingController();
  TextEditingController _dateDebutController = TextEditingController();
  TextEditingController _dateFinController = TextEditingController();
  TextEditingController _salarieController = TextEditingController();
  TextEditingController _modeReglementController = TextEditingController();
  TextEditingController _montantController = TextEditingController();
  TextEditingController _etatController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 11, 95, 163),
        title: Text('NOUVEAU'),
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                margin: EdgeInsets.only(left: 30, right: 30),
                child: TextField(
                  style: TextStyle(color: Color.fromARGB(255, 10, 10, 10)),
                  controller: _refController,
                  decoration: InputDecoration(
                    labelText: 'Réf',
                    labelStyle: TextStyle(
                      color: Color.fromARGB(255, 11, 95, 163),
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 30, right: 30),
                child: TextField(
                  style: TextStyle(color: Color.fromARGB(255, 10, 10, 10)),
                  controller: _libelleController,
                  decoration: InputDecoration(
                    labelText: 'Libellé',
                    labelStyle: TextStyle(
                      color: Color.fromARGB(255, 11, 95, 163),
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 30, right: 30),
                child: TextField(
                  style: TextStyle(color: Color.fromARGB(255, 10, 10, 10)),
                  controller: _dateDebutController,
                  decoration: InputDecoration(
                    labelText: 'Date début',
                    labelStyle: TextStyle(
                      color: Color.fromARGB(255, 11, 95, 163),
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 30, right: 30),
                child: TextField(
                  style: TextStyle(color: Color.fromARGB(255, 10, 10, 10)),
                  controller: _dateFinController,
                  decoration: InputDecoration(
                    labelText: 'Date fin',
                    labelStyle: TextStyle(
                      color: Color.fromARGB(255, 11, 95, 163),
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 30, right: 30),
                child: TextField(
                  style: TextStyle(color: Color.fromARGB(255, 10, 10, 10)),
                  controller: _salarieController,
                  decoration: InputDecoration(
                    labelText: 'Salarié',
                    labelStyle: TextStyle(
                      color: Color.fromARGB(255, 11, 95, 163),
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 30, right: 30),
                child: TextField(
                  style: TextStyle(color: Color.fromARGB(255, 10, 10, 10)),
                  controller: _modeReglementController,
                  decoration: InputDecoration(
                    labelText: 'Mode de règlement par défaut',
                    labelStyle: TextStyle(
                      color: Color.fromARGB(255, 11, 95, 163),
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 30, right: 30),
                child: TextField(
                  style: TextStyle(color: Color.fromARGB(255, 10, 10, 10)),
                  controller: _montantController,
                  decoration: InputDecoration(
                    labelText: 'Montant',
                    labelStyle: TextStyle(
                      color: Color.fromARGB(255, 11, 95, 163),
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 30, right: 30),
                child: TextField(
                  style: TextStyle(color: Color.fromARGB(255, 10, 10, 10)),
                  controller: _etatController,
                  decoration: InputDecoration(
                    labelText: 'Etat',
                    labelStyle: TextStyle(
                      color: Color.fromARGB(255, 11, 95, 163),
                    ),
                  ),
                ),
              ),
              Container(
                height: 30,
                margin: EdgeInsets.only(left: 120, right: 120),
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 14, 89, 160),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: TextButton(
                  style: ButtonStyle(
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.white),
                    overlayColor: MaterialStateProperty.resolveWith<Color?>(
                      (Set<MaterialState> states) {
                        if (states.contains(MaterialState.hovered))
                          return Color.fromARGB(255, 11, 95, 163)
                              .withOpacity(0.04);
                        if (states.contains(MaterialState.focused) ||
                            states.contains(MaterialState.pressed))
                          return Color.fromARGB(255, 7, 98, 173)
                              .withOpacity(0.12);
                        return null;
                      },
                    ),
                  ),
                  onPressed: () {},
                  child: Text('ENREGISTRER'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ListesalarieState extends State<Listesalarie> {
  List<Map<String, dynamic>> _dataList = [];

  @override
  void initState() {
    super.initState();
    _generateData();
  }

  void _generateData() {
    final rng = Random();
    for (int i = 1; i <= 10; i++) {
      _dataList.add({
        'ref': 'REF-$i',
        'libelle': 'Libelle $i',
        'dateDebut': DateTime(2022, rng.nextInt(12) + 1, rng.nextInt(28) + 1),
        'dateFin': DateTime(2023, rng.nextInt(12) + 1, rng.nextInt(28) + 1),
        'salarie':
            rng.nextBool() ? 'Ingénieur Télécoms' : 'Ingénieur Informatique',
        'modeDeReglement': rng.nextBool() ? 'Chèque' : 'Espèce',
        'montant': rng.nextInt(50000) + 10000,
        'etat': rng.nextBool() ? 'Payé' : 'Impayé',
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('LISTE SALAIRES'),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: DataTable(
          columns: [
            DataColumn(label: Text('Réf')),
            DataColumn(label: Text('Libellé')),
            DataColumn(label: Text('Date Début'), numeric: false),
            DataColumn(label: Text('Date fin'), numeric: false),
            DataColumn(label: Text('Salarié')),
            DataColumn(label: Text('Mode de règlement par défaut')),
            DataColumn(label: Text('Montant'), numeric: true),
            DataColumn(label: Text('Etat')),
          ],
          rows: _dataList.map((data) {
            return DataRow(cells: [
              DataCell(Text(data['ref'])),
              DataCell(Text(data['libelle'])),
              DataCell(Text(
                  '${data['dateDebut'].day}/${data['dateDebut'].month}/${data['dateDebut'].year}')),
              DataCell(Text(
                  '${data['dateFin'].day}/${data['dateFin'].month}/${data['dateFin'].year}')),
              DataCell(Text(data['salarie'])),
              DataCell(Text(data['modeDeReglement'])),
              DataCell(Text('${data['montant']} €')),
              DataCell(Text(data['etat'])),
            ]);
          }).toList(),
          columnSpacing: 16.0,
        ),
      ),
    );
  }
}

class ReglementPage extends StatefulWidget {
  @override
  _ReglementPageState createState() => _ReglementPageState();
}

class _ReglementPageState extends State<ReglementPage> {
  List<Map<String, dynamic>> _dataList = [];

  @override
  void initState() {
    super.initState();
    _generateData();
  }

  void _generateData() {
    final rng = Random();
    for (int i = 1; i <= 10; i++) {
      _dataList.add({
        'ref paiement': 'REF-$i',
        'montant': rng.nextInt(50000) + 10000,
        'libelle': 'Libelle $i',
        'dateFin': DateTime(2023, rng.nextInt(12) + 1, rng.nextInt(28) + 1),
        'datePaiement':
            DateTime(2024, rng.nextInt(12) + 1, rng.nextInt(28) + 1),
        'salarie':
            rng.nextBool() ? 'Ingénieur Télécoms' : 'Ingénieur Informatique',
        'modeDeReglement': rng.nextBool() ? 'Chèque' : 'Espèce',
        'numéro': 770000000 + 1573928 * i,
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('RÈGLEMENT DES SALAIRES'),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: DataTable(
          columns: [
            DataColumn(label: Text('Réf paiement')),
            DataColumn(label: Text('Montant'), numeric: true),
            DataColumn(label: Text('Libellé')),
            DataColumn(label: Text('Date Fin'), numeric: false),
            DataColumn(label: Text('Date paiement'), numeric: false),
            DataColumn(label: Text('Salarié')),
            DataColumn(label: Text('Mode de règlement par défaut')),
            DataColumn(label: Text('Numéro')),
          ],
          rows: _dataList.map((data) {
            return DataRow(cells: [
              DataCell(Text(data['ref paiement'])),
              DataCell(Text('${data['montant']} €')),
              DataCell(Text(data['libelle'])),
              DataCell(Text(
                  '${data['dateFin'].day}/${data['dateFin'].month}/${data['dateFin'].year}')),
              DataCell(Text(
                  '${data['datePaiement'].day}/${data['datePaiement'].month}/${data['datePaiement'].year}')),
              DataCell(Text(data['salarie'])),
              DataCell(Text(data['modeDeReglement'])),
              DataCell(Text('${data['numéro']}')),
            ]);
          }).toList(),
          columnSpacing: 16.0,
        ),
      ),
    );
  }
}

class Employee {
  final String name;
  final int salary;

  Employee(this.name, this.salary);
}

class SalarysChart extends StatefulWidget {
  @override
  _SalarysChartState createState() => _SalarysChartState();
}

class _SalarysChartState extends State<SalarysChart> {
  List<Employee> _employeeList = [];

  @override
  void initState() {
    super.initState();
    _generateData();
  }

  void _generateData() {
    final rng = Random();
    for (int i = 1; i <= 10; i++) {
      final salary = rng.nextInt(20000) + 30000;
      _employeeList.add(Employee('Employé $i', salary));
    }
  }

  List<charts.Series<Employee, String>> _createSeries() {
    return [
      charts.Series<Employee, String>(
        id: 'Salaries',
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (Employee employee, _) => employee.name,
        measureFn: (Employee employee, _) => employee.salary,
        data: _employeeList,
      )
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('STATISTIQUES'),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              'Salaires mensuels',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            SizedBox(height: 16.0),
            Expanded(
              child: charts.BarChart(
                _createSeries(),
                animate: true,
                vertical: true,
                domainAxis: charts.OrdinalAxisSpec(
                  renderSpec: charts.SmallTickRendererSpec(
                    labelRotation: 50,
                  ),
                ),
                primaryMeasureAxis: charts.NumericAxisSpec(
                  renderSpec: charts.GridlineRendererSpec(
                    labelAnchor: charts.TickLabelAnchor.centered,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
