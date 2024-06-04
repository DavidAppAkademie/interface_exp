import 'package:interface_exp/src/data/database_repository.dart';

class MockDatabase implements DatabaseRepository {
  // simulierte Datenbank
  int? x;

  @override
  Future<int?> getStoredNumber() async {
    await Future.delayed(const Duration(seconds: 2));
    return x;
  }

  @override
  Future<void> storeNumber(int n) async {
    await Future.delayed(const Duration(seconds: 2));
    x = n;
  }
}
