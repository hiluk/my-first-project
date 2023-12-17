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
      body: ColoredBox(
        color: Colors.white,
        child: Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 15.0, right: 15),
            child: ListView(
              children: [
                SizedBox(
                  height: 400,
                  child: Image.asset(widget.smartphoneDetail.imagePath),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  height: 60,
                  child: Text(
                    widget.smartphoneDetail.name,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                Text(
                  widget.smartphoneDetail.description,
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Цвет: ${widget.smartphoneDetail.color}',
                    ),
                    Text(
                      'Процессор: ${widget.smartphoneDetail.processor}',
                    ),
                    Text(
                      'Кол-во памяти: ${widget.smartphoneDetail.memory}',
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Text(
                  'Цена: ${widget.smartphoneDetail.price}',
                  style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {},
                      child: Container(
                        height: 70,
                        width: 170,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.black,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(24),
                        ),
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Icon(
                              Icons.shopping_cart_checkout,
                              size: 30,
                            ),
                            Text(
                              'В корзину',
                              style: TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        height: 70,
                        width: 170,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.black,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(24),
                        ),
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Icon(
                              Icons.favorite,
                              size: 30,
                            ),
                            Text(
                              'В избранное',
                              style: TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
