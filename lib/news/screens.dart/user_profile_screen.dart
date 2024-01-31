import 'package:auto_route/annotations.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:technical_dz/news/providers/auth_provider.dart';

@RoutePage()
class UserProfileScreen extends ConsumerWidget {
  const UserProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final firestoreNotifier = ref.watch(authProvider.notifier);
    FirebaseAuth auth = FirebaseAuth.instance;
    final userId = auth.currentUser!.uid;
    final userData = firestoreNotifier.getUserData(
            collectionName: 'users', docName: userId) ??
        {};
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(userData['name']),
      ),
      body: Column(
        children: [],
      ),
    );
  }
}
