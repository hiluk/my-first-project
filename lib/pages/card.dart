import 'package:flutter/material.dart';
import 'package:technical_dz/models/smartphones_model.dart';

class SmartphonePage extends StatefulWidget {
  final List<SmartphoneModel> smartphones;
  final SmartphoneModel smartphoneDetail;
  final void Function(List<SmartphoneModel> smartphones) onChanged;
  const SmartphonePage(
      {Key? key,
      required this.smartphoneDetail,
      required this.smartphones,
      required this.onChanged})
      : super(key: key);

  @override
  State<SmartphonePage> createState() => _SmartphonePageState();
}

class _SmartphonePageState extends State<SmartphonePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        physics: const ClampingScrollPhysics(),
        slivers: [
          SliverAppBar(
            pinned: true,
            expandedHeight: 400,
            flexibleSpace: FlexibleSpaceBar(
              title: Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  widget.smartphoneDetail.name,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              background: Padding(
                padding: const EdgeInsets.all(70.0),
                child: Image.asset(widget.smartphoneDetail.imagePath),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.smartphoneDetail.description,
                        style: const TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 10),
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
                          const SizedBox(height: 20),
                          Text(
                            'Цена: ${widget.smartphoneDetail.price}',
                            style: const TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const SizedBox(height: 10),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        height: 100,
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            InkWell(
              borderRadius: BorderRadius.circular(24),
              onTap: () {
                setState(() {
                  final correctIndex = widget.smartphones.indexWhere(
                      (element) => element.id == widget.smartphoneDetail.id);
                  widget.smartphones[correctIndex].inBasket =
                      !widget.smartphones[correctIndex].inBasket;
                  widget.onChanged(widget.smartphones);
                });
              },
              child: Container(
                height: 70,
                width: 280,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black,
                    width: 4,
                  ),
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    widget.smartphoneDetail.inBasket
                        ? const Icon(
                            Icons.remove_shopping_cart_outlined,
                            size: 30,
                          )
                        : const Icon(
                            Icons.shopping_cart_outlined,
                            size: 30,
                          ),
                    const Text(
                      'В корзину',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            IconButton(
                style: const ButtonStyle(
                    iconSize: MaterialStatePropertyAll(50),
                    iconColor: MaterialStatePropertyAll(Colors.black)),
                onPressed: () {
                  setState(() {
                    final correctIndex = widget.smartphones.indexWhere(
                        (element) => element.id == widget.smartphoneDetail.id);
                    widget.smartphones[correctIndex].isSmartphoneFavorite =
                        !widget.smartphones[correctIndex].isSmartphoneFavorite;
                    widget.onChanged(widget.smartphones);
                  });
                },
                icon: widget.smartphoneDetail.isSmartphoneFavorite
                    ? const Icon(Icons.favorite)
                    : const Icon(Icons.favorite_outline))
          ],
        ),
      ),
    );
  }
}
