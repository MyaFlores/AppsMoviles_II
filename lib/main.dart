import 'package:flutter/material.dart';
import 'screens/cafes_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Consumo API Café',
      theme: ThemeData(
        primarySwatch: Colors.brown, // Color temático de café
      ),
      home: const CafesScreen(),
    );
  }
}