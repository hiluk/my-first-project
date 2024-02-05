import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:technical_dz/news/models/my_user.dart';
import 'package:technical_dz/news/user_auth/firebase_implementation/firebase_firestore_services.dart';

part 'user_data_notifier.g.dart';

@riverpod
class UserData extends _$UserData {
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestoreServices fstore = FirebaseFirestoreServices();
  final firestoreInstance = FirebaseFirestore.instance;

  @override
  FutureOr<MyUser?> build() async {
    User? user = auth.currentUser!;
    final userId = user.uid;
    return await fstore
        .updateDataFromFirestore(collectionName: 'users', docName: userId)
        .then(
      (value) {
        return MyUser.fromJson(value!);
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

  // Future<void> updateFirebaseAuthData(Map<String, dynamic> data) async {
  //   User? user = auth.currentUser;
  //   if (user != null) {
  //     for (final providerProfile in user.providerData) {
  //       final name = providerProfile.displayName;
  //       final emailAddress = providerProfile.email;
  //       final phoneNumber = providerProfile.phoneNumber;
  //       if (data['email'] != emailAddress) {
  //         try {
  //           await user.updateEmail(data['email']);
  //           print('Email updated');
  //         } on FirebaseAuthException catch (e) {
  //           print(e.code);
  //         }
  //       } else if (data['password'] != state.value!['password']) {
  //         try {
  //           await user.updatePassword(data['password']);
  //           print('Password updated');
  //         } on FirebaseAuthException catch (e) {
  //           print(e.code);
  //         }
  //       } else if (data['name'] != name) {
  //         try {
  //           await user.updateDisplayName(data['name']);
  //           print('Display name updated');
  //         } on FirebaseAuthException catch (e) {
  //           print(e.code);
  //         }
  //       } else if (data['phoneNumber'] != phoneNumber) {
  //         try {
  //           await user.updatePhoneNumber(data['phoneNumber']);
  //           print('Phone number updated');
  //         } on FirebaseAuthException catch (e) {
  //           print(e.code);
  //         }
  //       }
  //     }
  //   }
  // }

  Future<void> updateUserDataFromFirestore() async {
    final user = auth.currentUser!;
    final userId = user.uid;
    MyUser? userData = await fstore
        .updateDataFromFirestore(collectionName: 'users', docName: userId)
        .then(
      (value) {
        return MyUser.fromJson(value!);
      },
    );
    state = AsyncData(userData);
  }
}
