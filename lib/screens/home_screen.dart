import 'package:flutter/material.dart';
import 'package:mathflutter/screens/calculadora_screen.dart';
import 'package:mathflutter/screens/tabuada_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  navTabuada() {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => TabuadaScreen()),
    );
  }

  navCalculadora() {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => CalculadoraScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MathFlutter'),
        centerTitle: true,
      ),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return Container(
              child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'O que quer usar hoje?',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                SizedBox(height: 50),
                Container(
                    width: constraints.maxWidth * .9,
                    height: constraints.maxHeight * .1,
                    child: ElevatedButton(
                        onPressed: () {
                          navTabuada();
                        },
                        child: Text("Tabuada"))),
                SizedBox(height: 10),
                Container(
                    width: constraints.maxWidth * .9,
                    height: constraints.maxHeight * .1,
                    child: ElevatedButton(
                      onPressed: () {
                        navCalculadora();
                      },
                      child: Text("Calculadora"),
                    ))
              ],
            ),
          ));
        },
      ),
    );
  }
}
