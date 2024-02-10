import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:technical_dz/news/models/my_user.dart';

part 'user_data_notifier.g.dart';

@riverpod
class UserData extends _$UserData {
  final db = FirebaseFirestore.instance;
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  FutureOr<MyUser?> build() async {
    final ref = db.collection('users').doc(auth.currentUser!.uid).withConverter(
          fromFirestore: MyUser.fromFireStore,
          toFirestore: (MyUser myUser, _) => myUser.toFirestore(),
        );
    final docSnap = await ref.get();
    final myUser = docSnap.data();
    if (myUser != null) {
      return myUser;
    } else {
      print('No such document');
    }
  }

  void setData(MyUser myUser) async {
    final ref = db.collection('users').doc(auth.currentUser!.uid).withConverter(
          fromFirestore: MyUser.fromFireStore,
          toFirestore: (MyUser myUser, _) => myUser.toFirestore(),
        );
    ref.set(myUser);
    final newUser = await ref.get();
    state = AsyncData(newUser.data());
  }
}
