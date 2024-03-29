import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseFirestoreServices {
  final firestoreInstance = FirebaseFirestore.instance;

  Future<void> addDataToFirestore(
      Map<String, dynamic> data, String collectionName, String docName) async {
    try {
      await firestoreInstance.collection(collectionName).doc(docName).set(data);
    } catch (e) {
      print(e);
      throw Exception(e.toString());
    }
  }

  Future<Map<String, dynamic>?> updateDataFromFirestore({
    required String collectionName,
    required String docName,
  }) async {
    try {
      final userData =
          await firestoreInstance.collection(collectionName).doc(docName).get();
      return userData.data();
    } catch (e) {
      print(e);
      throw Exception(e.toString());
    }
  }

  Future<void> updateDataToFirestore(
      Map<String, dynamic> data, String collectionName, String docName) async {
    try {
      await firestoreInstance
          .collection(collectionName)
          .doc(docName)
          .update(data);
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
