import 'package:frankie/navegador.dart';
import 'package:flutter/material.dart';
import 'package:frankie/pantallas/principal.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FRANKIE',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
        ),
        useMaterial3: true,
      ),
      home: Navegador(),
    );
  }
}
