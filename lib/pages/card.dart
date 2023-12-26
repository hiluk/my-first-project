import 'package:flutter/material.dart';
import 'package:technical_dz/models/smartphones_model.dart';

class SmartphonePage extends StatefulWidget {
  final SmartphoneModel smartphoneDetail;
  const SmartphonePage({Key? key, required this.smartphoneDetail})
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
                Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Padding(
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
                ),
              ],
            ),
          )
        ],
      ),
      // bottomNavigationBar: BottomAppBar(
      //   height: 100,
      //   color: Colors.white,
      //   child: Row(
      //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //     children: [
      //       InkWell(
      //         borderRadius: BorderRadius.circular(24),
      //         onTap: () {
      //           widget.smartphoneDetail.isSmartphoneFavorite =
      //               !widget.smartphoneDetail.isSmartphoneFavorite;
      //         },
      //         child: Container(
      //           height: 70,
      //           width: 280,
      //           decoration: BoxDecoration(
      //             border: Border.all(
      //               color: Colors.black,
      //               width: 4,
      //             ),
      //             borderRadius: BorderRadius.circular(24),
      //           ),
      //           child: const Column(
      //             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //             children: [
      //               Icon(
      //                 Icons.shopping_cart_checkout,
      //                 size: 30,
      //               ),
      //               Text(
      //                 'В корзину',
      //                 style: TextStyle(
      //                   fontSize: 16,
      //                   fontWeight: FontWeight.w700,
      //                 ),
      //               ),
      //             ],
      //           ),
      //         ),
      //       ),
      //       IconButton(
      //           style: const ButtonStyle(
      //               iconSize: MaterialStatePropertyAll(50),
      //               iconColor: MaterialStatePropertyAll(Colors.black)),
      //           onPressed: () {
      //             setState(() {
      //               widget.smartphoneDetail.isSmartphoneFavorite =
      //                   !widget.smartphoneDetail.isSmartphoneFavorite;
      //             });
      //           },
      //           icon: widget.smartphoneDetail.isSmartphoneFavorite
      //               ? const Icon(Icons.favorite)
      //               : const Icon(Icons.favorite_outline))
      //     ],
      //   ),
      // ),
    );
  }
}
