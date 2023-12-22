import 'package:flutter/material.dart';
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
      theme: ThemeData(
        fontFamily: 'Montserrat',
        appBarTheme: const AppBarTheme(color: Colors.white),
        bottomSheetTheme:
            const BottomSheetThemeData(backgroundColor: Colors.white),
      ),
      home: const HomePage(),
    );
  }
}
