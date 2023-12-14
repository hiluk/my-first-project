import 'package:flutter/material.dart';

class SmartphonePage extends StatelessWidget {
  const SmartphonePage({super.key});

  AppBar appBar() {
    return AppBar(
      title: const Text(
        'Карточка',
        style: TextStyle(
          color: Colors.black,
          fontSize: 18,
        ),
      ),
      centerTitle: true,
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.shopping_cart),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.favorite),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: appBar(),
      body: const Column(
        children: [],
      ),
    );
  }
}
