// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:technical_dz/news/user_auth/firebase_implementation/firebase_auth_services.dart';
import 'package:technical_dz/news/user_auth/firebase_implementation/firebase_firestore_services.dart';

final authProvider =
    ChangeNotifierProvider<AuthProvider>((ref) => AuthProvider());

class AuthProvider extends ChangeNotifier {
  bool _isLoading = false;
  UserCredential? _userCredential;
  Map<String, dynamic>? _userData = {};
  FirebaseAuthService fauth = FirebaseAuthService();
  FirebaseFirestoreServices fstore = FirebaseFirestoreServices();
  bool get isLoading => _isLoading;

  Future<bool> addUserToDatabase(
      Map<String, dynamic>? data, String collectionName, String docName) async {
    var value = false;
    try {
      await fstore
          .addDataToFirestore(data!, collectionName, docName)
          .then((value) {
        value = true;
      });
    } catch (e) {
      print(e);
      value = false;
    }
    return value;
  }

  Map<String, dynamic>? getUserData({
    required String collectionName,
    required String docName,
  }) {
    fstore
        .getUserDataFromFirestore(
            collectionName: collectionName, docName: docName)
        .then(
      (value) {
        _userData = value;
      },
    );
    return _userData;
  }

  Future<UserCredential?> loginUserWithFirebase({
    required String email,
    required String password,
  }) async {
    setLoader(true);
    try {
      _userCredential = await fauth.signInWithEmailAmdPassword(
          email: email, password: password);
      setLoader(false);
    } catch (e) {
      print(e);
      setLoader(false);
    }
    return _userCredential;
  }

  setLoader(bool loader) {
    _isLoading = loader;
    notifyListeners();
  }

  Future<UserCredential?> signUpUserWithFirebase({
    required String email,
    required String password,
    String? name,
  }) async {
    bool isSuccess = false;
    setLoader(true);
    _userCredential = await fauth.signUpWithEmailAndPassword(
        email: email, password: password);
    _userData = {
      'email': email,
      'password': password,
      'uid': _userCredential!.user!.uid,
      'createdAt': DateTime.now().microsecondsSinceEpoch.toString(),
      'name': name,
      'bio': '',
      'phoneNumber': '',
      'favoriteIds': <int>[],
    };
    String uid = _userCredential!.user!.uid;

    isSuccess = await addUserToDatabase(_userData, 'users', uid);
    if (_userCredential != null || isSuccess) {
      return _userCredential;
    } else {
      throw Exception('Error to sign up to the user');
    }
  }
}
