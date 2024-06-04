import 'package:interface_exp/src/data/database_repository.dart';

class MockFailureDatabase implements DatabaseRepository {
  @override
  Future<int?> getStoredNumber() async {
    await Future.delayed(const Duration(seconds: 2));
    throw Exception("simulated error");
  }

  @override
  Future<void> storeNumber(int n) async {
    await Future.delayed(const Duration(seconds: 2));
    throw Exception("simulated error");
  }
}
