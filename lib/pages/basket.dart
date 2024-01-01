import 'package:flutter/material.dart';
import 'package:intl/intl.dart' as intl;
import 'package:technical_dz/models/smartphones_model.dart';
import 'package:technical_dz/pages/card.dart';
import 'package:technical_dz/widgets/item_tile.dart';

class BasketPage extends StatefulWidget {
  final List<SmartphoneModel> smartphones;
  const BasketPage({
    Key? key,
    required this.smartphones,
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
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context, widget.smartphones);
        },
        icon: const Icon(
          Icons.arrow_back,
        ),
      ),
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
              });
            },
            child: InkWell(
              onTap: () {
                _sendSmartphoneDetail(context, index);
              },
              child: ItemTile(
                smartphone: basketSmartphones[index],
                smartphones: widget.smartphones,
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
      text = 'Добавьте что-нибудь в корзину';
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

  Future<void> _sendSmartphoneDetail(BuildContext context, index) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SmartphonePage(
          smartphoneDetail: widget.smartphones[index],
        ),
      ),
    );

    if (!mounted) return;

    setState(() {
      final correctIndex =
          widget.smartphones.indexWhere((element) => element.id == result.id);
      widget.smartphones[correctIndex] = result;
    });
  }
}
