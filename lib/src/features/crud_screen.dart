import 'package:flutter/material.dart';
import 'package:interface_exp/src/data/database_repository.dart';

class CrudScreen extends StatefulWidget {
  // Attribute
  final DatabaseRepository databaseRepository;

  // Konstruktor
  const CrudScreen({super.key, required this.databaseRepository});

  @override
  State<CrudScreen> createState() => _CrudScreenState();
}

class _CrudScreenState extends State<CrudScreen> {
  // State
  late Future<int?> numberFuture = widget.databaseRepository.getStoredNumber();
  final TextEditingController _numControler = TextEditingController();

  // Methoden
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              FutureBuilder(
                future: numberFuture,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done &&
                      !snapshot.hasError) {
                    // Fall 1: Future ist komplett und hat Daten!
                    return Text("Zahl: ${snapshot.data}");
                  } else if (snapshot.connectionState != ConnectionState.done) {
                    // Fall 2: Sind noch im Ladezustand
                    return const CircularProgressIndicator();
                  } else {
                    // Fall 3: Es gab nen Fehler
                    return const Icon(Icons.error);
                  }
                },
              ),
              const SizedBox(height: 16),
              TextField(
                controller: _numControler,
              ),
              const SizedBox(height: 16),
              FilledButton(
                onPressed: () async {
                  int number = int.parse(_numControler.text);
                  _numControler.clear();
                  await widget.databaseRepository.storeNumber(number);
                },
                child: const Text("Zahl speichern"),
              ),
              const SizedBox(height: 8),
              OutlinedButton(
                onPressed: () async {
                  numberFuture = widget.databaseRepository.getStoredNumber();
                  setState(() {});
                },
                child: const Text("Neu laden"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _numControler.dispose();
    super.dispose();
  }
}
