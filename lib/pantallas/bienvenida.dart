import 'package:flutter/material.dart';
import 'package:frankie/pantallas/ingresar.dart';

class Bienvenida extends StatefulWidget {
  // Recibo el título que usaré
  const Bienvenida({super.key, required this.titulo});

  final String titulo;

  @override
  State<Bienvenida> createState() => _BienvenidaState();
}

class _BienvenidaState extends State<Bienvenida> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,

      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("BIENVENIDA"), // Título de arriba
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "BIENVENID@",
              style: TextStyle(fontSize: 40, color: Colors.white),
            ),
            SizedBox(height: 30),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.calculate, size: 40, color: Colors.white),
                SizedBox(width: 30),
                Icon(Icons.place, size: 40, color: Colors.white),
                SizedBox(width: 30),
                Icon(Icons.calendar_today, size: 40, color: Colors.white),
              ],
            ),
            SizedBox(height: 30),

            ElevatedButton(
              onPressed: () {
                // Voy a la pantalla de inicio
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Ingresar(
                      titulo: "Iniciar sesión",
                      funcionCambio: null,
                    ),
                  ),
                );
              },
              child: Text("Iniciar Sesión"), // Botón para entrar
            ),
          ],
        ),
      ),
    );
  }
}
