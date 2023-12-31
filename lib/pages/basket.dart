import 'package:flutter/material.dart';
import 'package:intl/intl.dart' as intl;
import 'package:technical_dz/models/smartphones_model.dart';

class BasketPage extends StatefulWidget {
  final List<SmartphoneModel> basketSmartphones;
  const BasketPage({Key? key, required this.basketSmartphones})
      : super(key: key);

  @override
  State<BasketPage> createState() => _BasketPageState();
}

class _BasketPageState extends State<BasketPage> {
  final formatter = intl.NumberFormat.decimalPattern();
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
      bottomSheet: _bottomSheet(context),
      body: Column(
        children: [
          _buildScreen(),
        ],
      ),
    );
  }

  SizedBox _bottomSheet(BuildContext context) {
    return SizedBox(
      height: 100,
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
                'Кол-во смартфонов: ${widget.basketSmartphones.length} | Cумма: ${_getSum()}'),
            InkWell(
              borderRadius: BorderRadius.circular(24),
              onTap: () {
                AlertDialog alert = _getAlertMessage();
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return alert;
                  },
                );
              },
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
    );
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
                            '${formatter.format(widget.basketSmartphones[index].price)} ₽',
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

  Widget _buildScreen() {
    if (widget.basketSmartphones.isEmpty) {
      return const Expanded(
        child: Center(
          child: Text(
            'Корзина пустая',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 17,
              color: Colors.black,
            ),
          ),
        ),
      );
    } else {
      return _buildListView();
    }
  }

  AlertDialog _getAlertMessage() {
    if (widget.basketSmartphones.isEmpty) {
      AlertDialog alert = const AlertDialog(
        title: Text(
          'Добавьте что-нибудь в корзину',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 14,
          ),
        ),
      );
      return alert;
    } else {
      AlertDialog alert = const AlertDialog(
        title: Text(
          'Покупка успешна',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 14,
          ),
        ),
      );
      return alert;
    }
  }

  String _getSum() {
    int sum = 0;

    if (widget.basketSmartphones.isEmpty) {
      return formatter.format(sum);
    } else {
      for (int i = 0; i < widget.basketSmartphones.length; i++) {
        sum += widget.basketSmartphones[i].price;
      }
    }

    return formatter.format(sum);
  }
}
