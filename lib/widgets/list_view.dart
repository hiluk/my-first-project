import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart' as intl;
import 'package:technical_dz/models/smartphones_model.dart';
import 'package:technical_dz/pages/card.dart';

class ListViewScreen extends ConsumerWidget {
  const ListViewScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    throw UnimplementedError();
  }

  static buildListView(List<SmartphoneModel> smartphones) {
    final formatter = intl.NumberFormat.decimalPattern();
    return Expanded(
      child: ListView.separated(
        padding: const EdgeInsets.only(top: 1),
        separatorBuilder: (context, index) => Container(
          height: 1,
        ),
        itemCount: smartphones.length,
        itemBuilder: (context, index) {
          return Slidable(
            endActionPane: ActionPane(
              motion: const ScrollMotion(),
              children: [
                SlidableAction(
                  foregroundColor: Colors.black,
                  autoClose: false,
                  onPressed: (context) {},
                  icon: smartphones[index].inBasket
                      ? Icons.remove_shopping_cart_outlined
                      : Icons.shopping_cart_outlined,
                  backgroundColor: Colors.deepPurpleAccent.withOpacity(0.7),
                ),
                SlidableAction(
                  foregroundColor: Colors.black,
                  autoClose: false,
                  onPressed: (context) {},
                  icon: smartphones[index].isSmartphoneFavorite
                      ? Icons.favorite
                      : Icons.favorite_outline,
                  backgroundColor: Colors.yellow.withOpacity(0.7),
                ),
              ],
            ),
            child: InkWell(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) {
                      return SmartphonePage(
                          smartphoneDetail: smartphones[index]);
                    },
                  ),
                );
              },
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
                          child: Image.asset(smartphones[index].imagePath),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Flexible(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              smartphones[index].name,
                              style: const TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 18,
                                color: Colors.black,
                              ),
                            ),
                            Row(
                              children: [
                                Text(
                                  '${smartphones[index].memory} | ${smartphones[index].processor}',
                                  style: const TextStyle(
                                    color: Colors.grey,
                                  ),
                                )
                              ],
                            ),
                            Expanded(
                              child: Text(
                                smartphones[index].description,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                style: const TextStyle(
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                            Text(
                              '${formatter.format(smartphones[index].price)} ₽',
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
            ),
          );
        },
      ),
    );
  }
}
