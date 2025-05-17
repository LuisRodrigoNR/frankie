import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:frankie/pantallas/principal.dart';

class Ingresar extends StatefulWidget {
  const Ingresar({super.key, required this.titulo, required this.funcionCambio});

  final String titulo;
  final Function? funcionCambio;

  @override
  State<Ingresar> createState() => _IngresarState();
}

class _IngresarState extends State<Ingresar> {
  final TextEditingController _usuarioController = TextEditingController();
  final TextEditingController _contrasenaController = TextEditingController();

  String _mensaje = "";

  Future<SharedPreferences> _obtenerPreferencias() async {
    final SharedPreferences _prefs = await SharedPreferences.getInstance();
    return _prefs;
  }

  void _validarUsuario() async {
    String usuario = _usuarioController.text;

    if (usuario.isNotEmpty) {
      SharedPreferences _prefs = await _obtenerPreferencias();
      await _prefs.setString("Kevin", usuario);

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => MyHomePage(title: "Pantalla Casa"),
        ),
      );
    } else {
      setState(() {
        _mensaje = "Por favor ingresa un usuario";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.titulo),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _usuarioController,
              decoration: const InputDecoration(
                labelText: "Usuario",
              ),
            ),
            TextField(
              controller: _contrasenaController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: "Contraseña",
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _validarUsuario,
              child: const Text("Ingresar"),
            ),
            const SizedBox(height: 16),
            Text(
              _mensaje,
              style: const TextStyle(color: Colors.red),
            ),
          ],
        ),
      ),
    );
  }
}
