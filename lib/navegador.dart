import 'package:frankie/Pantallas/principal.dart';
import 'package:flutter/material.dart';
import 'package:frankie/pantallas/localizacion.dart';
import 'Pantallas/calculadora.dart';
import 'Pantallas/bienvenida.dart';
import 'Pantallas/ingresar.dart';
import 'Pantallas/calendario.dart';

class Navegador extends StatefulWidget {
  const Navegador({super.key});

  @override
  State<Navegador> createState() => _NavegadorState();
}

class _NavegadorState extends State<Navegador> {
  int _p = 0; // DEBE DE SER 0

  List<Widget> _pantallas = [];
  Widget _cuerpo = MyHomePage(title: "FRANKIE");
  // Widget _cuerpo=Otra(title: "La otra");

  void _cambiaPantalla(int v) {
    _p = v;
    setState(() {
      _cuerpo = _pantallas[_p];
    });
  }

  @override
  void initState() {
    super.initState();
    _pantallas.add(const MyHomePage(title: "INICIO"));
    _pantallas.add(const Bienvenida(titulo: "BIENVENIDA"));
    _pantallas.add(const Calculadora(titulo: "CALCULADORA"));
    _pantallas.add(const Calendario(titulo: "CALENDARIO"));
    _pantallas.add(const  Localizacion(titulo: "Localizacion"));
    _pantallas.add(Ingresar(titulo: "INGRESA TU NOMBRE", funcionCambio: _cambiaPantalla));
    _cuerpo = _pantallas[_p];
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _cuerpo,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _p, // determinar cual es la pantalla
        onTap: (value) {
          _cambiaPantalla(value);
        },
        type: BottomNavigationBarType.fixed, // soluciona el error de que no se vea blanco la barra
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            label: "Casa",
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            label: "Bienvenida",
            icon: Icon(Icons.handshake_outlined),
          ),
          BottomNavigationBarItem(
            label: "Calculadora",
            icon: Icon(Icons.calculate),
          ),
          BottomNavigationBarItem(
            label: "Ingresar",
            icon: Icon(Icons.login),
          ),
          BottomNavigationBarItem(
            label: "Calendario",
            icon: Icon(Icons.calendar_today),
          ),
          BottomNavigationBarItem(
            label: "Localización",
            icon: Icon(Icons.location_on),
          ),
        ],
      ),
    );
  }
}
