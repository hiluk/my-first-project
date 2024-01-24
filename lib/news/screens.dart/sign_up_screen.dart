import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:technical_dz/news/routers/router.dart';
import 'package:technical_dz/news/user_auth/firebase_auth_implementation/firebase_auth_services.dart';

@RoutePage()
class SingUpScreen extends ConsumerWidget {
  const SingUpScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TextEditingController _userNameController = TextEditingController();
    final TextEditingController _emailController = TextEditingController();
    final TextEditingController _passwordController = TextEditingController();
    return Scaffold(
      extendBody: true,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'SpaceFlight News',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Sign Up',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.w400,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                child: Column(
                  children: [
                    TextFormField(
                      controller: _userNameController,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: 4,
                          horizontal: 20,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(35),
                        ),
                        hintText: 'Username',
                        focusColor: Colors.black,
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Enter username';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: 4,
                          horizontal: 20,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(35),
                        ),
                        hintText: 'Email',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Enter Email';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: _passwordController,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: 4,
                          horizontal: 20,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(35),
                        ),
                        hintText: 'Password',
                        focusColor: Colors.black,
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Enter password';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () => _signUp(
                        context,
                        _emailController.text,
                        _passwordController.text,
                      ),
                      child: const SizedBox(
                        height: 50,
                        width: 120,
                        child: Center(
                          child: Text(
                            'Sign Up',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void _signUp(
    context,
    String email,
    String password,
  ) async {
    final FirebaseAuthService auth = FirebaseAuthService();
    User? user = await auth.signUpWithEmailAndPassword(email, password);

    if (user != null) {
      print('User is successfully created');
    }
    AutoRouter.of(context).push(const SingInScreenRoute());
  }
}