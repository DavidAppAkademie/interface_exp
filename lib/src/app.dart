import 'package:flutter/material.dart';
import 'package:interface_exp/src/data/database_repository.dart';
import 'package:interface_exp/src/features/crud_screen.dart';

class App extends StatelessWidget {
  // Attribute
  final DatabaseRepository databaseRepository;

  // Konstruktor
  const App({super.key, required this.databaseRepository});

  // Methoden
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.from(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightBlueAccent)),
      home: CrudScreen(
        databaseRepository: databaseRepository,
      ),
    );
  }
}
