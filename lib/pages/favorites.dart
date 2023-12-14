import 'package:flutter/material.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  AppBar appBar() {
    return AppBar(
      title: const Text(
        'Избранное',
        style: TextStyle(
          color: Colors.black,
          fontSize: 20,
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
