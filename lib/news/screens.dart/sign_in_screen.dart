import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:technical_dz/news/routers/router.dart';
import 'package:technical_dz/news/user_auth/firebase_implementation/firebase_auth_services.dart';
import 'package:technical_dz/news/validators/validators.dart';

@RoutePage()
class SignInScreen extends HookConsumerWidget {
  const SignInScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final validator = Validator();
    final signInFormKey = useMemoized(GlobalKey<FormState>.new);
    TextEditingController emailController = useTextEditingController(text: '');
    TextEditingController passwordController =
        useTextEditingController(text: '');
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
              'Sign In',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.w400,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                key: signInFormKey,
                child: Column(
                  children: [
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      controller: emailController,
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
                      validator: validator.validateEmail,
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      onEditingComplete: () {},
                      autocorrect: false,
                      obscureText: true,
                      controller: passwordController,
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
                      validator: validator.validatePassword,
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        if (signInFormKey.currentState!.validate()) {
                          signIn(
                            context: context,
                            email: emailController.text,
                            password: passwordController.text,
                          );
                        }
                      },
                      child: const SizedBox(
                        height: 50,
                        width: 120,
                        child: Center(
                          child: Text(
                            'Sign In',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: () => AutoRouter.of(context)
                          .replace(const SignUpScreenRoute()),
                      child: const Text('Sign Up'),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void signIn({
    required context,
    required String email,
    required String password,
  }) async {
    final FirebaseAuthService auth = FirebaseAuthService();
    UserCredential? user = await auth.signInWithEmailAmdPassword(
      email: email,
      password: password,
    );
    if (user != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('You authorized'),
        ),
      );
      AutoRouter.of(context).push(const HomeScreenRoute());
    }
  }
}
