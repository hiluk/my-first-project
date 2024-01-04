import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart' as intl;
import 'package:technical_dz/main.dart';
import 'package:technical_dz/models/smartphones_model.dart';
import 'package:technical_dz/pages/basket.dart';
import 'package:technical_dz/pages/card.dart';
import 'package:technical_dz/pages/favorites.dart';
import 'package:technical_dz/widgets/item_tile.dart';

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
  bool isGrid = false;
  final formatter = intl.NumberFormat.decimalPattern();
  List<SmartphoneModel> get basketSmartphones =>
      smartphones.where((element) => element.inBasket).toList();
  List<SmartphoneModel> get favoriteSmartphones =>
      smartphones.where((element) => element.isSmartphoneFavorite).toList();
  List<SmartphoneModel> get filterSmartphones => searchController.text.isEmpty
      ? smartphones
      : smartphones
          .where((element) => element.name
              .toLowerCase()
              .contains(searchController.text.toLowerCase()))
          .toList();
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
            _sendSmartphones(context, const BasketPage());
          },
          icon: const Icon(Icons.shopping_cart),
          color: Colors.black,
        ),
        IconButton(
          onPressed: () {
            _sendSmartphones(context, const FavoritePage());
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

  @override
  void initState() {
    super.initState();
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
      child: ListView.separated(
        separatorBuilder: (context, index) => const SizedBox(height: 20),
        shrinkWrap: true,
        padding: const EdgeInsetsDirectional.all(20),
        itemCount: filterSmartphones.length,
        itemBuilder: (context, index) {
          return InkWell(
            key: ValueKey(filterSmartphones[index].id),
            borderRadius: BorderRadius.circular(20),
            onTap: () {
              _sendSmartphoneDetail(context, index);
            },
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(35),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      constraints: const BoxConstraints(
                        minHeight: 80,
                        maxHeight: 90,
                      ),
                      child: Image.asset(filterSmartphones[index].imagePath),
                    ),
                  ),
                  Text(
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    filterSmartphones[index].name,
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
                        '${filterSmartphones[index].memory} | ${filterSmartphones[index].processor} | ${filterSmartphones[index].color}',
                        style: const TextStyle(
                          color: Colors.grey,
                        ),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      filterSmartphones[index].description,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 3,
                      style: const TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  Text(
                    '${formatter.format(filterSmartphones[index].price)} ₽',
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
                          setState(() {
                            final correctIndex = smartphones.indexWhere(
                                (element) =>
                                    element.id == filterSmartphones[index].id);
                            smartphones[correctIndex].isSmartphoneFavorite =
                                !smartphones[correctIndex].isSmartphoneFavorite;
                          });
                        },
                        icon: filterSmartphones[index].isSmartphoneFavorite
                            ? const Icon(Icons.favorite)
                            : const Icon(Icons.favorite_outline),
                        iconSize: 40,
                      ),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            final correctIndex = smartphones.indexWhere(
                                (element) =>
                                    element.id == filterSmartphones[index].id);
                            smartphones[correctIndex].inBasket =
                                !smartphones[correctIndex].inBasket;
                          });
                        },
                        icon: filterSmartphones[index].inBasket
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
        itemCount: filterSmartphones.length,
        itemBuilder: (context, index) {
          return Slidable(
              endActionPane: ActionPane(
                motion: const ScrollMotion(),
                children: [
                  SlidableAction(
                    foregroundColor: Colors.black,
                    autoClose: false,
                    onPressed: (context) {
                      setState(() {
                        final correctIndex = smartphones.indexWhere((element) =>
                            element.id == filterSmartphones[index].id);
                        smartphones[correctIndex].inBasket =
                            !smartphones[correctIndex].inBasket;
                      });
                    },
                    icon: filterSmartphones[index].inBasket
                        ? Icons.remove_shopping_cart_outlined
                        : Icons.shopping_cart_outlined,
                    backgroundColor: Colors.deepPurpleAccent.withOpacity(0.7),
                  ),
                  SlidableAction(
                    foregroundColor: Colors.black,
                    autoClose: false,
                    onPressed: (context) {
                      setState(() {
                        final correctIndex = smartphones.indexWhere((element) =>
                            element.id == filterSmartphones[index].id);
                        smartphones[correctIndex].isSmartphoneFavorite =
                            !smartphones[correctIndex].isSmartphoneFavorite;
                      });
                    },
                    icon: filterSmartphones[index].isSmartphoneFavorite
                        ? Icons.favorite
                        : Icons.favorite_outline,
                    backgroundColor: Colors.yellow.withOpacity(0.7),
                  ),
                ],
              ),
              child: InkWell(
                onTap: () {
                  _sendSmartphoneDetail(context, index);
                },
                child: ItemTile(
                  smartphone: filterSmartphones[index],
                  smartphones: filterSmartphones,
                ),
              ));
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

  Container _searchField() {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: TextField(
        onChanged: (value) {
          setState(() {
            filterSmartphones;
          });
        },
        onEditingComplete: () {
          setState(() {
            _validate = false;
          });
        },
        cursorColor: Colors.black,
        textAlignVertical: TextAlignVertical.center,
        decoration: InputDecoration(
          labelText: 'Поиск',
          labelStyle: const TextStyle(fontSize: 14),
          errorText: _validate ? 'Введите название смартфона' : null,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(24),
          ),
          suffixIcon: IconButton(
            onPressed: () {
              setState(() {
                searchController.text.isEmpty
                    ? _validate = true
                    : _validate = false;
                filterSmartphones;
              });
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

  Future<void> _sendSmartphoneDetail(BuildContext context, index) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SmartphonePage(
          smartphoneDetail: filterSmartphones[index],
        ),
      ),
    );

    if (!mounted) return;

    setState(() {
      final correctIndex =
          smartphones.indexWhere((element) => element.id == result.id);
      smartphones[correctIndex] = result;
    });
  }

  Future<void> _sendSmartphones(BuildContext context, page) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => page),
    );

    if (!mounted) return;

    setState(() {
      smartphones = result;
    });
  }

  Container _smartphonesCount() {
    return Container(
      color: Colors.white,
      height: 30,
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.only(left: 8.0, top: 2),
        child: Text(
          'Количество смартфонов: ${filterSmartphones.length}',
          textAlign: TextAlign.left,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
