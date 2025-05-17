/*20/02/25*/
import 'package:frankie/pantallas/principal.dart';
import 'package:flutter/material.dart';

class Calculadora extends StatefulWidget {
  const Calculadora({super.key, required this.titulo});

  final String titulo;

  @override
  State<Calculadora> createState() => _CalculadoraState();
}

class _CalculadoraState extends State<Calculadora> {

  /*FUNCIONES DE CALCULADORA  */
  double _respuesta = 0;
  double _a = 0;
  int _op = 0;
  String _respuestaS = "";
  bool _punto = false;

  void _borrarNumero() {
    setState(() {
      if (_respuestaS.isNotEmpty) {
        _respuestaS = _respuestaS.substring(0, _respuestaS.length - 1);
        _respuesta = _respuestaS.isNotEmpty ? double.parse(_respuestaS) : 0;
      }
    });
  }

  void _calcularPorcentaje() {
    setState(() {
      _respuesta = _respuesta / 100;
      _respuestaS = _respuesta.toString();
    });
  }

  void _presionaNumero(int n) {
    setState(() {
      _respuestaS += n.toString();
      _respuesta = double.parse(_respuestaS);
    });
  }

  void _presionaSimbolo(String s) {
    if (s == '.') {
      if (!_punto) {
        setState(() {
          _punto = true;
          _respuestaS += ".";
        });
      }
    } else if (s == '/') {
      _operarAnterior();
      setState(() {
        _a = _respuesta;
        _respuesta = 0;
        _respuestaS = "";
        _punto = false;
        _op = 4;
      });
    } else if (s == '*') {
      _operarAnterior();
      setState(() {
        _a = _respuesta;
        _respuesta = 0;
        _respuestaS = "";
        _punto = false;
        _op = 3;
      });
    } else if (s == '-') {
      _operarAnterior();
      setState(() {
        _a = _respuesta;
        _respuesta = 0;
        _respuestaS = "";
        _punto = false;
        _op = 2;
      });
    } else if (s == '+') {
      _operarAnterior();
      setState(() {
        _a = _respuesta;
        _respuesta = 0;
        _respuestaS = "";
        _punto = false;
        _op = 1;
      });
    } else if (s == '=') {
      setState(() {
        _respuesta = _opera();
        _respuestaS = _respuesta.toString();
        _op = 0;
      });
    }
  }

  void _operarAnterior() {
    if (_op != 0) {
      setState(() {
        _respuesta = _opera();
        _a = _respuesta;
      });
    }
  }

  double _opera() {
    _respuestaS = "";
    switch (_op) {
      case 1:
        return _a + _respuesta;
      case 2:
        return _a - _respuesta;
      case 3:
        return _a * _respuesta;
      case 4:
        return _a / _respuesta;
      default:
        return _respuesta;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("SOY LA CALCULADORA"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  color: Colors.deepPurple,
                  width: 320,
                  child: Text(
                    "$_respuesta",
                    textAlign: TextAlign.end,
                    style: TextStyle(fontSize: 42),
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MaterialButton(
                  color: Theme.of(context).colorScheme.inversePrimary,
                  onPressed: _borrarNumero,
                  child: Text(
                    "⌫",
                    style: TextStyle(fontSize: 42),
                  ),
                ),
                MaterialButton(
                  color: Theme.of(context).colorScheme.inversePrimary,
                  onPressed: _calcularPorcentaje,
                  child: Text(
                    "%",
                    style: TextStyle(fontSize: 42),
                  ),
                ),
                MaterialButton(
                  color: Theme.of(context).colorScheme.inversePrimary,
                  onPressed: () {
                    _respuesta = 0;
                    _respuestaS = "";
                    _a = 0;
                    _op = 0;
                    _punto = false;
                    setState(() {});
                  },
                  child: Text(
                    "C",
                    style: TextStyle(fontSize: 42),
                  ),
                ),
                MaterialButton(
                  color: Theme.of(context).colorScheme.inversePrimary,
                  onPressed: () {
                    _presionaSimbolo("/");
                  },
                  child: Text(
                    "/",
                    style: TextStyle(fontSize: 42),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MaterialButton(
                  color: Theme.of(context).colorScheme.inversePrimary,
                  onPressed: () {
                    _presionaNumero(7);
                  },
                  child: Text(
                    "7",
                    style: TextStyle(fontSize: 42),
                  ),
                ),
                MaterialButton(
                  color: Theme.of(context).colorScheme.inversePrimary,
                  onPressed: () {
                    _presionaNumero(8);
                  },
                  child: Text(
                    "8",
                    style: TextStyle(fontSize: 42),
                  ),
                ),
                MaterialButton(
                  color: Theme.of(context).colorScheme.inversePrimary,
                  onPressed: () {
                    _presionaNumero(9);
                  },
                  child: Text(
                    "9",
                    style: TextStyle(fontSize: 42),
                  ),
                ),
                MaterialButton(
                  color: Theme.of(context).colorScheme.inversePrimary,
                  onPressed: () {
                    _presionaSimbolo("*");
                  },
                  child: Text(
                    "*",
                    style: TextStyle(fontSize: 42),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MaterialButton(
                  color: Theme.of(context).colorScheme.inversePrimary,
                  onPressed: () {
                    _presionaNumero(4);
                  },
                  child: Text(
                    "4",
                    style: TextStyle(fontSize: 42),
                  ),
                ),
                MaterialButton(
                  color: Theme.of(context).colorScheme.inversePrimary,
                  onPressed: () {
                    _presionaNumero(5);
                  },
                  child: Text(
                    "5",
                    style: TextStyle(fontSize: 42),
                  ),
                ),
                MaterialButton(
                  color: Theme.of(context).colorScheme.inversePrimary,
                  onPressed: () {
                    _presionaNumero(6);
                  },
                  child: Text(
                    "6",
                    style: TextStyle(fontSize: 42),
                  ),
                ),
                MaterialButton(
                  color: Theme.of(context).colorScheme.inversePrimary,
                  onPressed: () {
                    _presionaSimbolo("-");
                  },
                  child: Text(
                    "-",
                    style: TextStyle(fontSize: 42),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MaterialButton(
                  color: Theme.of(context).colorScheme.inversePrimary,
                  onPressed: () {
                    _presionaNumero(1);
                  },
                  child: Text(
                    "1",
                    style: TextStyle(fontSize: 42),
                  ),
                ),
                MaterialButton(
                  color: Theme.of(context).colorScheme.inversePrimary,
                  onPressed: () {
                    _presionaNumero(2);
                  },
                  child: Text(
                    "2",
                    style: TextStyle(fontSize: 42),
                  ),
                ),
                MaterialButton(
                  color: Theme.of(context).colorScheme.inversePrimary,
                  onPressed: () {
                    _presionaNumero(3);
                  },
                  child: Text(
                    "3",
                    style: TextStyle(fontSize: 42),
                  ),
                ),
                MaterialButton(
                  color: Theme.of(context).colorScheme.inversePrimary,
                  onPressed: () {
                    _presionaSimbolo("+");
                  },
                  child: Text(
                    "+",
                    style: TextStyle(fontSize: 42),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MaterialButton(
                  minWidth: 114.5,
                  color: Theme.of(context).colorScheme.inversePrimary,
                  onPressed: () {
                    _presionaNumero(0);
                  },
                  child: Text(
                    "0",
                    style: TextStyle(fontSize: 42),
                  ),
                ),
                MaterialButton(
                  minWidth: 114.5,
                  color: Theme.of(context).colorScheme.inversePrimary,
                  onPressed: () {
                    _presionaSimbolo(".");
                  },
                  child: Text(
                    ".",
                    style: TextStyle(fontSize: 42),
                  ),
                ),
                MaterialButton(
                  minWidth: 114.5,
                  color: Theme.of(context).colorScheme.inversePrimary,
                  onPressed: () {
                    _presionaSimbolo("=");
                  },
                  child: Text(
                    "=",
                    style: TextStyle(fontSize: 42),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
