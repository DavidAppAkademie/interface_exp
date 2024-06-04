import 'package:flutter/material.dart';
import 'package:interface_exp/src/app.dart';
import 'package:interface_exp/src/data/database_repository.dart';
import 'package:interface_exp/src/data/mock_database.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );
  // final prefs = await SharedPreferences.getInstance();

  DatabaseRepository databaseRepository = MockDatabase();

  runApp(App(databaseRepository: databaseRepository));
}
