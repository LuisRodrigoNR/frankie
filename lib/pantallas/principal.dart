import 'package:flutter/material.dart';

import 'package:frankie/pantallas/calculadora.dart';
import 'package:frankie/pantallas/calendario.dart';
import 'package:frankie/pantallas/localizacion.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _texto = "Inicio";

  void _cambiaCaracter(String caracterViejo, String cadenaNueva) {
    setState(() {
      _texto = _texto.replaceAll(caracterViejo, cadenaNueva);
    });
  }

  @override
  Widget build(BuildContext context) {
    final ButtonStyle estiloBotonMorado = ElevatedButton.styleFrom(
      backgroundColor: Colors.purple,
      padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 60),
      textStyle: const TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      drawer: Drawer(
        child: Text(_texto),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Separar con SizedBox para espacio vertical
            ElevatedButton(
              style: estiloBotonMorado,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Calculadora(titulo: "Calculadora")),
                );
              },
              child: const Text("Calculadora"),
            ),
            const SizedBox(height: 20), // Espacio entre botones

            ElevatedButton(
              style: estiloBotonMorado,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Calendario(titulo: "Calendario")),
                );
              },
              child: const Text("Calendario"),
            ),
            const SizedBox(height: 20),

            ElevatedButton(
              style: estiloBotonMorado,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Localizacion(titulo: "Localización")),
                );
              },
              child: const Text("Localización"),
            ),
          ],
        ),
      ),
    );
  }
}
