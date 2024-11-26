import 'package:flutter/material.dart';
import 'login_screen.dart';

void main() {
  runApp(EficienciaEnergeticaApp());
}

class EficienciaEnergeticaApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Eficiência Energética',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: LoginScreen(),
    );
  }
}
