import 'package:flutter/material.dart';
import 'package:intl/intl.dart' as intl;
import 'package:technical_dz/models/smartphones_model.dart';

class BasketPage extends StatefulWidget {
  final void Function(List<SmartphoneModel> smartphones) onChanged;
  final List<SmartphoneModel> smartphones;
  const BasketPage({
    Key? key,
    required this.smartphones,
    required this.onChanged,
  }) : super(key: key);

  @override
  State<BasketPage> createState() => _BasketPageState();
}

class _BasketPageState extends State<BasketPage> {
  final formatter = intl.NumberFormat.decimalPattern();
  List<SmartphoneModel> get basketSmartphones =>
      widget.smartphones.where((element) => element.inBasket).toList();
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
                'Кол-во смартфонов: ${basketSmartphones.length} | Cумма: ${_getSum()}'),
            InkWell(
              borderRadius: BorderRadius.circular(24),
              onTap: () {
                showModalBottomSheet(
                    context: context,
                    builder: (BuildContext context) {
                      return SizedBox(
                        height: 100,
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                _getAlertMessage(),
                              )
                            ],
                          ),
                        ),
                      );
                    });
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
        itemCount: basketSmartphones.length,
        itemBuilder: (context, index) {
          return Dismissible(
            key: ValueKey<int>(basketSmartphones[index].id),
            background: Container(
              alignment: Alignment.centerRight,
              color: Colors.red,
              child: const Padding(
                padding: EdgeInsets.only(right: 50.0),
                child: Icon(Icons.delete),
              ),
            ),
            onDismissed: (DismissDirection direction) {
              setState(() {
                final correctIndex = widget.smartphones.indexWhere(
                    (element) => element.id == basketSmartphones[index].id);
                widget.smartphones[correctIndex].inBasket =
                    !widget.smartphones[correctIndex].inBasket;
                widget.onChanged(widget.smartphones);
              });
            },
            child: InkWell(
              onTap: () {},
              child: Container(
                padding: const EdgeInsets.only(right: 5),
                height: 100,
                color: Colors.white,
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        width: 100,
                        height: 100,
                        child: Image.asset(basketSmartphones[index].imagePath),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            basketSmartphones[index].name,
                            style: const TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 18,
                              color: Colors.black,
                            ),
                          ),
                          Row(
                            children: [
                              Flexible(
                                child: Text(
                                  '${basketSmartphones[index].memory} | ${basketSmartphones[index].processor}',
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                  style: const TextStyle(
                                    color: Colors.grey,
                                  ),
                                ),
                              )
                            ],
                          ),
                          Text(
                            basketSmartphones[index].description,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: const TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                          Text(
                            '${formatter.format(basketSmartphones[index].price)} ₽',
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
    if (basketSmartphones.isEmpty) {
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

  String _getAlertMessage() {
    String text = '';
    if (basketSmartphones.isEmpty) {
      text = 'Добавьте что нибудь в корзину';
    } else {
      text = 'Покупка прошла успешно';
    }

    return text;
  }

  String _getSum() {
    int sum = 0;

    if (basketSmartphones.isEmpty) {
      return formatter.format(sum);
    } else {
      for (int i = 0; i < basketSmartphones.length; i++) {
        sum += basketSmartphones[i].price;
      }
    }

    return formatter.format(sum);
  }
}
