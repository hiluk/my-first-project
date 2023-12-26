import 'package:flutter/material.dart';
import 'package:technical_dz/methods/smartphones_model.dart';

class BasketPage extends StatefulWidget {
  final List<SmartphoneModel> basketSmartphones;
  const BasketPage({Key? key, required this.basketSmartphones})
      : super(key: key);

  @override
  State<BasketPage> createState() => _BasketPageState();
}

class _BasketPageState extends State<BasketPage> {
  AppBar appBar() {
    return AppBar(
      title: const Text(
        'Корзина',
        style: TextStyle(
          color: Colors.black,
          fontSize: 18,
        ),
      ),
      centerTitle: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: appBar(),
      bottomSheet: SizedBox(
        height: 100,
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                  'Кол-во смартфонов: ${widget.basketSmartphones.length} | Cумма:'),
              InkWell(
                borderRadius: BorderRadius.circular(24),
                onTap: () {},
                child: Container(
                    height: 40,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      border: Border.all(),
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Оформить покупку',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    )),
              ),
            ],
          ),
        ),
      ),
      body: Column(
        children: [
          _buildListView(),
        ],
      ),
    );
  }

  Widget sumOfBasket() {
    int sum = 0;
    widget.basketSmartphones.forEach((price) {
      sum.toInt() += price;
    });
  }

  Widget _buildListView() {
    return Expanded(
      child: ListView.separated(
        padding: const EdgeInsets.only(top: 1),
        separatorBuilder: (context, index) => const SizedBox(height: 1),
        itemCount: widget.basketSmartphones.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {},
            child: Container(
              padding: const EdgeInsets.only(right: 5),
              height: 100,
              color: Colors.white,
              child: Flexible(
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        width: 100,
                        height: 100,
                        child: Image.asset(
                            widget.basketSmartphones[index].imagePath),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            widget.basketSmartphones[index].name,
                            style: const TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 18,
                              color: Colors.black,
                            ),
                          ),
                          Row(
                            children: [
                              Text(
                                '${widget.basketSmartphones[index].memory} | ${widget.basketSmartphones[index].processor}',
                                style: const TextStyle(
                                  color: Colors.grey,
                                ),
                              )
                            ],
                          ),
                          Expanded(
                            child: Text(
                              widget.basketSmartphones[index].description,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style: const TextStyle(
                                color: Colors.grey,
                              ),
                            ),
                          ),
                          Text(
                            widget.basketSmartphones[index].price,
                            style: const TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 22,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
