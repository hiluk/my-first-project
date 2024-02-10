import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:technical_dz/news/providers/user_data_notifier.dart';
import 'package:technical_dz/news/routers/router.dart';
import 'package:technical_dz/news/validators/validators.dart';
import 'package:technical_dz/news/widgets/profile_field_widget.dart';
import 'package:technical_dz/news/widgets/profile_head.dart';

@RoutePage()
class UserProfileScreen extends HookConsumerWidget {
  const UserProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isUpdateActive = useState(false);
    String emptyProfirePic =
        'https://cdn.vectorstock.com/i/preview-1x/66/14/default-avatar-photo-placeholder-profile-picture-vector-21806614.jpg';
    FirebaseAuth auth = FirebaseAuth.instance;
    final userData = ref.watch(userDataProvider).valueOrNull;
    if (userData == null) {
      return Scaffold(
        appBar: AppBar(
          title: const Text(''),
        ),
        body: const Center(
          child: Text('User not found'),
        ),
      );
    }
    final validator = Validator();
    final TextEditingController emailController =
        useTextEditingController(text: userData.email);
    TextEditingController passwordController =
        useTextEditingController(text: userData.password);
    TextEditingController userNameController =
        useTextEditingController(text: userData.name);
    TextEditingController phoneNumberController =
        useTextEditingController(text: userData.phoneNumber);
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ProfileHeadWidget(
              imageSrc: emptyProfirePic,
              userData: userData,
            ),
            Container(
              constraints: const BoxConstraints(
                maxHeight: 410,
              ),
              child: Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ProfileField(
                      label: 'Username',
                      isActive: isUpdateActive.value,
                      controller: userNameController,
                    ),
                    ProfileField(
                      label: 'Email',
                      isActive: false,
                      controller: emailController,
                      validator: validator.validateEmail,
                    ),
                    ProfileField(
                      label: 'Password',
                      isActive: false,
                      controller: passwordController,
                      validator: validator.validatePassword,
                      obscure: true,
                    ),
                    ProfileField(
                      label: 'Phone number',
                      isActive: isUpdateActive.value,
                      controller: phoneNumberController,
                      validator: validator.validatePhoneNumber,
                    ),
                  ],
                ),
              ),
            ),
            OutlinedButton(
                onPressed: () {
                  if (isUpdateActive.value) {
                    if (formKey.currentState!.validate()) {
                      final data = userData
                          .copyWith(
                            name: userNameController.text,
                            email: emailController.text,
                            password: passwordController.text,
                            phoneNumber: phoneNumberController.text,
                          )
                          .toJson();
                    }
                  } else {
                    isUpdateActive.value = true;
                  }
                  isUpdateActive.value = isUpdateActive.value;
                },
                child: Text(
                  isUpdateActive.value
                      ? 'Save information'
                      : 'Update information',
                  style: const TextStyle(
                    color: Colors.black,
                  ),
                )),
            OutlinedButton(
              onPressed: () {
                auth.signOut();
                AutoRouter.of(context).pushAndPopUntil(
                  const SignInScreenRoute(),
                  predicate: (_) => false,
                );
              },
              child: const Text(
                'Sign out',
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
