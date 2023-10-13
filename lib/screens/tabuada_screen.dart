import 'package:flutter/material.dart';

void main() {
  runApp(TabuadaApp());
}

class TabuadaApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TabuadaScreen(),
    );
  }
}

class TabuadaScreen extends StatefulWidget {
  @override
  _TabuadaScreenState createState() => _TabuadaScreenState();
}

class _TabuadaScreenState extends State<TabuadaScreen> {
  int selectedNumber = 1;
  List<int> tabuada = List.generate(10, (index) => (index + 1) * 1);

  void updateTabuada(int number) {
    setState(() {
      selectedNumber = number;
      tabuada = List.generate(10, (index) => (index + 1) * number);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tabuada App'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Selecione o número da tabuada:",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
            Card(
              color: Colors.deepOrange,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: DropdownButton<int>(
                  isExpanded: true,
                  dropdownColor: Colors.deepOrange,
                  value: selectedNumber,
                  onChanged: (newValue) {
                    updateTabuada(newValue!);
                  },
                  items: List.generate(10, (index) {
                    return DropdownMenuItem<int>(
                      value: index + 1,
                      child: Text(
                        (index + 1).toString(),
                        style: TextStyle(color: Colors.white),
                      ),
                    );
                  }),
                ),
              ),
            ),
            SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                'Aqui está a tabuada do: ${selectedNumber}',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
            SizedBox(height: 20),
            ListView.builder(
              shrinkWrap: true,
              physics: ClampingScrollPhysics(),
              itemCount: tabuada.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(
                    '$selectedNumber x ${index + 1} = ${tabuada[index]}',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
