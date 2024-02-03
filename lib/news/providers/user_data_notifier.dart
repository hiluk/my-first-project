import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:technical_dz/news/user_auth/firebase_implementation/firebase_firestore_services.dart';

part 'user_data_notifier.g.dart';

@riverpod
class UserData extends _$UserData {
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestoreServices fstore = FirebaseFirestoreServices();
  final firestoreInstance = FirebaseFirestore.instance;
  Map<String, dynamic>? userData = {};

  Future<Map<String, dynamic>?> build() async {
    return getDataFromFirestore();
  }

  Future<Map<String, dynamic>?> getDataFromFirestore() async {
    final user = auth.currentUser!;
    final userId = user.uid;
    return await fstore
        .getUserDataFromFirestore(collectionName: 'users', docName: userId)
        .then(
      (value) {
        return value;
      },
    );
  }

  Future<void> updateDataToFirebase(
      Map<String, dynamic> data, String collectionName, String docName) async {
    try {
      await firestoreInstance
          .collection(collectionName)
          .doc(docName)
          .update(data);
      ref.notifyListeners();
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<void> updateFirebaseAuthData(Map<String, dynamic> data) async {
    if (data['email'] != state.value!['email']) {
      try {
        await auth.currentUser!.updateEmail(data['email']);
      } catch (e) {
        Exception(e.toString());
      }
    } else if (data['password'] != state.value!['password']) {
      try {
        await auth.currentUser!.updatePassword(data['password']);
      } catch (e) {
        Exception(e.toString());
      }
    } else if (data['name'] != state.value!['name']) {
      try {
        await auth.currentUser!.updateDisplayName(data['name']);
      } catch (e) {
        Exception(e.toString());
      }
    }
  }

  Future<void> updateUserDataFromFirestore() async {
    final user = auth.currentUser!;
    final userId = user.uid;
    userData = state.value;
    userData = await fstore
        .getUserDataFromFirestore(collectionName: 'users', docName: userId)
        .then(
      (value) {
        return value;
      },
    );
    state = AsyncData(userData);
  }
}
