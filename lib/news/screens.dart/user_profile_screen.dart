import 'package:auto_route/annotations.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:technical_dz/news/providers/user_data_notifier.dart';
import 'package:technical_dz/news/validators/validators.dart';
import 'package:technical_dz/news/widgets/profile_head.dart';
import 'package:technical_dz/news/widgets/profile_string_widget.dart';

@RoutePage()
class UserProfileScreen extends HookConsumerWidget {
  const UserProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    FirebaseAuth.instance.authStateChanges().listen(
      (User? user) {
        if (user == null) {
          print('User is currently signed out!');
        } else {
          print('Load Data');
        }
      },
    );
    final isUpdateActive = useState(false);
    String imageSrc =
        'https://play-lh.googleusercontent.com/ZCY6FSY545GwyveH1qC3YOT15ud9xhqPbp5TdEbTa1F0lCxTS9KukvGrDersh4KGvQ=w240-h480-rw';
    FirebaseAuth auth = FirebaseAuth.instance;
    final user = auth.currentUser!;
    final userId = user.uid;
    final userDataNotifier = ref.read(userDataProvider.notifier);
    final userData = ref.watch(userDataProvider).valueOrNull;
    final TextEditingController emailController =
        useTextEditingController(text: userData!['email']);
    TextEditingController passwordController =
        useTextEditingController(text: userData['password']);
    TextEditingController userNameController =
        useTextEditingController(text: userData['name']);
    TextEditingController phoneNumberController =
        useTextEditingController(text: userData['phoneNumber']);
    final formKey = useMemoized(GlobalKey<FormState>.new);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Profile',
          style: TextStyle(
            fontSize: 18,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ProfileHeadWidget(
              imageSrc: imageSrc,
              userData: userData,
            ),
            Form(
              key: formKey,
              child: Column(
                children: [
                  ProfileString(
                    labelText: userData['name'],
                    label: 'Username',
                    isActive: isUpdateActive.value,
                    controller: userNameController,
                  ),
                  ProfileString(
                    labelText: userData['email'],
                    label: 'Email',
                    isActive: isUpdateActive.value,
                    controller: emailController,
                    validator: Validator().validateEmail,
                  ),
                  ProfileString(
                    labelText: userData['password'],
                    label: 'Password',
                    isActive: isUpdateActive.value,
                    controller: passwordController,
                    validator: Validator().validatePassword,
                  ),
                  ProfileString(
                    labelText: userData['phoneNumber'],
                    label: 'Phone number',
                    isActive: isUpdateActive.value,
                    controller: phoneNumberController,
                    validator: Validator().validatePhoneNumber,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            OutlinedButton(
                onPressed: () {
                  if (isUpdateActive.value) {
                    if (formKey.currentState!.validate()) {
                      final data = {
                        'email': emailController.text,
                        'password': passwordController.text,
                        'name': userNameController.text,
                        'phoneNumber': phoneNumberController.text,
                      };
                      userDataNotifier.updateDataToFirestore(
                          data, 'users', userId);
                      userDataNotifier.updateUserDataFromFirestore();
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('User update completed'),
                        ),
                      );
                      isUpdateActive.value = false;
                    }
                  } else {
                    isUpdateActive.value = true;
                  }
                  isUpdateActive.value = isUpdateActive.value;
                },
                child: isUpdateActive.value
                    ? const Text(
                        'Save information',
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      )
                    : const Text(
                        'Update information',
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ))
          ],
        ),
      ),
    );
  }
}
