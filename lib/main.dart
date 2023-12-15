import 'package:flutter/material.dart';
import 'package:technical_dz/pages/basket.dart';
import 'package:technical_dz/pages/card.dart';
import 'package:technical_dz/pages/favorites.dart';
import 'package:technical_dz/pages/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Montserrat'),
      routes: {
        '/': (context) => const HomePage(),
        '/favorites': (context) => const FavoritesPage(),
        '/basket': (context) => const BasketPage(),
        '/smartphone': (context) {
          final arguments = ModalRoute.of(context)?.settings.arguments;
          if (arguments is int) {
            return SmartphonePage(smartphoneId: arguments);
          } else {
            return const SizedBox.shrink();
          }
        }
      },
    );
  }
}
