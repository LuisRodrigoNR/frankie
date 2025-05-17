import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:frankie/pantallas/principal.dart';

class Calendario extends StatefulWidget {
  const Calendario({super.key, required this.titulo});

  final String titulo;

  @override
  State<Calendario> createState() => _CalendarioState();
}

class _CalendarioState extends State<Calendario> {
  final TextEditingController _eventoController = TextEditingController();
  DateTime _fechaSeleccionada = DateTime.now();
  List<String> _eventos = [];

  // Cargar eventos guardados desde SharedPreferences
  Future<void> _cargarEventos() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _eventos = prefs.getStringList('eventos') ?? [];
    });
  }

  // Guardar un nuevo evento
  Future<void> _guardarEvento() async {
    if (_eventoController.text.isEmpty) return;

    SharedPreferences prefs = await SharedPreferences.getInstance();
    String evento = "${_fechaSeleccionada.toLocal().toString().split(' ')[0]} - ${_eventoController.text}";

    setState(() {
      _eventos.add(evento);
      _eventoController.clear();
    });

    await prefs.setStringList('eventos', _eventos);
  }

  @override
  void initState() {
    super.initState();
    _cargarEventos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.titulo),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () async {
                final DateTime? fecha = await showDatePicker(
                  context: context,
                  initialDate: _fechaSeleccionada,
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2100),
                );
                if (fecha != null) {
                  setState(() {
                    _fechaSeleccionada = fecha;
                  });
                }
              },
              child: Text(
                "Seleccionar fecha: ${_fechaSeleccionada.toLocal().toString().split(' ')[0]}",
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _eventoController,
              decoration: const InputDecoration(
                labelText: "Descripción del evento",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _guardarEvento,
              child: const Text("Agregar evento"),
            ),
            const SizedBox(height: 24),
            const Text(
              "Eventos guardados:",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Expanded(
              child: ListView.builder(
                itemCount: _eventos.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: const Icon(Icons.event),
                    title: Text(_eventos[index]),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
