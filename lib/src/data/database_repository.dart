abstract class DatabaseRepository {
  // Methoden
  Future<void> storeNumber(int n);
  Future<int?> getStoredNumber();
}
