import 'package:flutter/material.dart';
import 'package:technical_dz/methods/smartphones_model.dart';

class SmartphonePage extends StatelessWidget {
  final SmartphoneModel smartphone;
  const SmartphonePage({required this.smartphone});

  AppBar appBar() {
    return AppBar(
      title: const Text(
        'Карточка',
        style: TextStyle(
          color: Colors.black,
          fontSize: 20,
        ),
      ),
      centerTitle: true,
      leading: IconButton(
        onPressed: () {},
        icon: const Icon(Icons.keyboard_arrow_left),
      ),
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
