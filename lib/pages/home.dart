import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart' as intl;
import 'package:technical_dz/models/smartphones_model.dart';
import 'package:technical_dz/pages/basket.dart';
import 'package:technical_dz/pages/card.dart';
import 'package:technical_dz/pages/favorites.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  final searchController = TextEditingController();
  bool _validate = false;
  late AnimationController _animationController;
  bool isGrid = true;
  List<SmartphoneModel> smartphones = [];
  List<SmartphoneModel> filteredSmartphones = [];
  List<SmartphoneModel> favoriteSmartphones = [];
  List<SmartphoneModel> basketSmartphones = [];
  final formatter = intl.NumberFormat.decimalPattern();

  AppBar appBar() {
    return AppBar(
      title: const Text(
        'Каталог товаров',
        style: TextStyle(
          color: Colors.black,
          fontSize: 18,
        ),
      ),
      centerTitle: true,
      leading: viewIconTapped(),
      actions: [
        IconButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (BuildContext context) {
                  return BasketPage(
                    basketSmartphones: basketSmartphones,
                  );
                },
              ),
            );
          },
          icon: const Icon(Icons.shopping_cart),
          color: Colors.black,
        ),
        IconButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (BuildContext context) {
                  return FavoritePage(
                    favoriteSmartphones: favoriteSmartphones,
                  );
                },
              ),
            );
          },
          icon: const Icon(Icons.favorite),
          color: Colors.black,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: appBar(),
      body: Column(
        children: [
          _searchField(),
          _buildScreen(),
          const SizedBox(height: 1),
          _smartphonesCount(),
        ],
      ),
    );
  }

  void filterCards(String value) {
    setState(() {
      if (value.isEmpty) {
        filteredSmartphones.clear();
        filteredSmartphones.addAll(smartphones);
      } else {
        filteredSmartphones = smartphones
            .where((smartphones) =>
                smartphones.name.toLowerCase().contains(value.toLowerCase()))
            .toList();
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _getSmartphones();
    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
  }

  IconButton viewIconTapped() {
    return IconButton(
      onPressed: () {
        if (isGrid == true) {
          setState(() {
            _animationController.forward();
            isGrid = false;
          });
        } else {
          setState(() {
            _animationController.reverse();
            isGrid = true;
          });
        }
      },
      icon: AnimatedIcon(
        icon: AnimatedIcons.list_view,
        color: Colors.black,
        progress: _animationController,
      ),
    );
  }

  Widget _buildGridView() {
    return Expanded(
      child: GridView.builder(
        shrinkWrap: true,
        padding: const EdgeInsetsDirectional.all(20),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1,
          crossAxisSpacing: 10,
          mainAxisSpacing: 20,
        ),
        itemCount: filteredSmartphones.length,
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
                    child: Image.asset(filteredSmartphones[index].imagePath),
                  ),
                  Text(
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    filteredSmartphones[index].name,
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
                        '${filteredSmartphones[index].memory} | ${filteredSmartphones[index].processor} | ${filteredSmartphones[index].color}',
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
                        filteredSmartphones[index].description,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 3,
                        style: const TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                  Text(
                    '${formatter.format(filteredSmartphones[index].price)} ₽',
                    style: const TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 30,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                        onPressed: () {
                          if (filteredSmartphones[index].isSmartphoneFavorite ==
                              false) {
                            setState(() {
                              filteredSmartphones[index].isSmartphoneFavorite =
                                  true;
                              favoriteSmartphones
                                  .add(filteredSmartphones[index]);
                            });
                          } else {
                            setState(
                              () {
                                filteredSmartphones[index]
                                    .isSmartphoneFavorite = false;
                                favoriteSmartphones
                                    .remove(filteredSmartphones[index]);
                              },
                            );
                          }
                        },
                        icon: filteredSmartphones[index].isSmartphoneFavorite
                            ? const Icon(Icons.favorite)
                            : const Icon(Icons.favorite_outline),
                        iconSize: 40,
                      ),
                      IconButton(
                        onPressed: () {
                          if (filteredSmartphones[index].inBasket == false) {
                            setState(() {
                              filteredSmartphones[index].inBasket = true;
                              basketSmartphones.add(filteredSmartphones[index]);
                            });
                          } else {
                            setState(
                              () {
                                filteredSmartphones[index].inBasket = false;
                                basketSmartphones
                                    .remove(filteredSmartphones[index]);
                              },
                            );
                          }
                        },
                        icon: filteredSmartphones[index].inBasket
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

  Widget _buildListView() {
    return Expanded(
      child: ListView.separated(
        padding: const EdgeInsets.only(top: 1),
        separatorBuilder: (context, index) => Container(
          height: 1,
        ),
        itemCount: filteredSmartphones.length,
        itemBuilder: (context, index) {
          return Slidable(
            endActionPane: ActionPane(
              motion: const ScrollMotion(),
              children: [
                SlidableAction(
                  foregroundColor: Colors.black,
                  autoClose: false,
                  onPressed: (context) {
                    if (filteredSmartphones[index].inBasket == false) {
                      setState(() {
                        filteredSmartphones[index].inBasket = true;
                        basketSmartphones.add(filteredSmartphones[index]);
                      });
                    } else {
                      setState(
                        () {
                          filteredSmartphones[index].inBasket = false;
                          basketSmartphones.remove(filteredSmartphones[index]);
                        },
                      );
                    }
                  },
                  icon: filteredSmartphones[index].inBasket
                      ? Icons.remove_shopping_cart_outlined
                      : Icons.shopping_cart_outlined,
                  backgroundColor: Colors.deepPurpleAccent.withOpacity(0.7),
                ),
                SlidableAction(
                  foregroundColor: Colors.black,
                  autoClose: false,
                  onPressed: (context) {
                    if (filteredSmartphones[index].isSmartphoneFavorite ==
                        false) {
                      setState(() {
                        filteredSmartphones[index].isSmartphoneFavorite = true;
                        favoriteSmartphones.add(filteredSmartphones[index]);
                      });
                    } else {
                      setState(
                        () {
                          filteredSmartphones[index].isSmartphoneFavorite =
                              false;
                          favoriteSmartphones
                              .remove(filteredSmartphones[index]);
                        },
                      );
                    }
                  },
                  icon: filteredSmartphones[index].isSmartphoneFavorite
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
                          child:
                              Image.asset(filteredSmartphones[index].imagePath),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Flexible(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              filteredSmartphones[index].name,
                              style: const TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 18,
                                color: Colors.black,
                              ),
                            ),
                            Row(
                              children: [
                                Text(
                                  '${filteredSmartphones[index].memory} | ${filteredSmartphones[index].processor}',
                                  style: const TextStyle(
                                    color: Colors.grey,
                                  ),
                                )
                              ],
                            ),
                            Expanded(
                              child: Text(
                                filteredSmartphones[index].description,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                style: const TextStyle(
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                            Text(
                              '${formatter.format(filteredSmartphones[index].price)} ₽',
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

  Widget _buildScreen() {
    if (isGrid == true) {
      return _buildGridView();
    } else {
      return _buildListView();
    }
  }

  void _getSmartphones() {
    smartphones = SmartphoneModel.getSmartphoneModel();
    filteredSmartphones = SmartphoneModel.getSmartphoneModel();
  }

  Container _searchField() {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: TextField(
        cursorColor: Colors.black,
        textAlignVertical: TextAlignVertical.center,
        decoration: InputDecoration(
          errorText: _validate ? 'Введите название смартфона' : null,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(24),
          ),
          hintText: 'Поиск',
          hintStyle: const TextStyle(fontSize: 14),
          suffixIcon: IconButton(
            onPressed: () {
              setState(() {
                searchController.text.isEmpty
                    ? _validate = true
                    : _validate = false;
              });
              filterCards(searchController.text);
            },
            icon: const Icon(Icons.search),
          ),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 4, horizontal: 20),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(24),
          ),
          focusColor: Colors.black,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(24),
            borderSide: const BorderSide(
              color: Colors.black,
              width: 2.0,
            ),
          ),
        ),
        controller: searchController,
      ),
    );
  }

  Container _smartphonesCount() {
    return Container(
      color: Colors.white,
      height: 30,
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.only(left: 8.0, top: 2),
        child: Text(
          'Количество смартфонов: ${filteredSmartphones.length}',
          textAlign: TextAlign.left,
          style: TextStyle(
            color: Colors.black,
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
