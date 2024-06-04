import 'package:interface_exp/src/data/database_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefsDatabase implements DatabaseRepository {
  final SharedPreferences _prefs;

  const SharedPrefsDatabase(this._prefs);

  @override
  Future<int?> getStoredNumber() async {
    return _prefs.getInt('number');
  }

  @override
  Future<void> storeNumber(int n) async {
    await _prefs.setInt('number', n);
  }
}
