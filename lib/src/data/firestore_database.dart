import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:interface_exp/src/data/database_repository.dart';

class FirestoreDatabase implements DatabaseRepository {
  final FirebaseFirestore _firestore;

  const FirestoreDatabase(this._firestore);
  @override
  Future<int?> getStoredNumber() async {
    final doc =
        await _firestore.collection('numbers').doc('storedNumber').get();
    return doc.data()!['value'] as int?;
  }

  @override
  Future<void> storeNumber(int n) async {
    await _firestore
        .collection('numbers')
        .doc('storedNumber')
        .set({'value': n});
  }
}
