import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart' as intl;
import 'package:technical_dz/models/smartphones_model.dart';
import 'package:technical_dz/pages/card.dart';

class GridViewScreen extends ConsumerWidget {
  const GridViewScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    throw UnimplementedError();
  }

  static buildGridView(List<SmartphoneModel> smartphones) {
    final formatter = intl.NumberFormat.decimalPattern();
    return Expanded(
      child: GridView.builder(
        shrinkWrap: true,
        padding: const EdgeInsetsDirectional.all(20),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1,
          crossAxisSpacing: 10,
          mainAxisSpacing: 20,
        ),
        itemCount: smartphones.length,
        itemBuilder: (context, index) {
          return InkWell(
            borderRadius: BorderRadius.circular(20),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext context) {
                    return SmartphonePage(smartphoneDetail: smartphones[index]);
                  },
                ),
              );
            },
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 100,
                    height: 100,
                    child: Image.asset(smartphones[index].imagePath),
                  ),
                  Text(
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    smartphones[index].name,
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                      color: Colors.black,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '${smartphones[index].memory} | ${smartphones[index].processor} | ${smartphones[index].color}',
                        style: const TextStyle(
                          color: Colors.grey,
                        ),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Expanded(
                      child: Text(
                        smartphones[index].description,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 3,
                        style: const TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                  Text(
                    '${formatter.format(smartphones[index].price)} ₽',
                    style: const TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 30,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: smartphones[index].isSmartphoneFavorite
                            ? const Icon(Icons.favorite)
                            : const Icon(Icons.favorite_outline),
                        iconSize: 40,
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: smartphones[index].inBasket
                            ? const Icon(Icons.remove_shopping_cart_outlined)
                            : const Icon(Icons.shopping_cart_outlined),
                        iconSize: 40,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
