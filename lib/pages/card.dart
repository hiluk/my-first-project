import 'package:flutter/material.dart';
import 'package:technical_dz/methods/smartphones_model.dart';

class SmartphonePage extends StatefulWidget {
  final SmartphoneModel smartphoneDetail;
  const SmartphonePage({Key? key, required this.smartphoneDetail})
      : super(key: key);

  @override
  State<SmartphonePage> createState() => _SmartphonePageState();
}

class _SmartphonePageState extends State<SmartphonePage> {
  AppBar appBar() {
    return AppBar(
      title: Text(
        widget.smartphoneDetail.name,
        style: const TextStyle(
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
      body: Column(
        children: [],
      ),
    );
  }
}
