import 'package:flutter/material.dart';
import 'package:technical_dz/methods/smartphones_model.dart';
import 'package:technical_dz/pages/basket.dart';
import 'package:technical_dz/pages/card.dart';
import 'package:technical_dz/pages/favorites.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final searchController = TextEditingController();
  bool isGrid = true;
  List<SmartphoneModel> smartphones = [];
  List<SmartphoneModel> filteredSmartphones = [];

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
      leading: IconButton(
        onPressed: () {
          setState(() {
            isGrid = !isGrid;
          });
        },
        icon: _getScreenStyleIcon(),
      ),
      actions: [
        IconButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const BasketPage(),
              ),
            );
          },
          icon: const Icon(Icons.shopping_cart),
        ),
        IconButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const FavoritesPage(),
              ),
            );
          },
          icon: const Icon(Icons.favorite),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: appBar(),
      body: Column(
        children: [
          _searchField(),
          _buildScreen(),
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
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const SmartphonePage()));
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
                  Container(
                    height: 130,
                    width: 100,
                    color: Colors.white,
                    child: SizedBox(
                      width: 100,
                      height: 100,
                      child: Image.asset(filteredSmartphones[index].imagePath),
                    ),
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
                    filteredSmartphones[index].price,
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
                        icon: const Icon(Icons.favorite),
                        iconSize: 40,
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.add_shopping_cart),
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
        separatorBuilder: (context, index) => const SizedBox(height: 1),
        itemCount: filteredSmartphones.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const SmartphonePage()));
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
                            filteredSmartphones[index].price,
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
    if (isGrid == true) {
      return _buildGridView();
    } else {
      return _buildListView();
    }
  }

  Widget _getScreenStyleIcon() {
    if (isGrid == true) {
      return const Icon(Icons.list);
    } else {
      return const Icon(Icons.grid_view);
    }
  }

  void _getSmartphones() {
    smartphones = SmartphoneModel.getSmartphoneModel();
    filteredSmartphones = SmartphoneModel.getSmartphoneModel();
  }

  Container _searchField() {
    return Container(
      padding: const EdgeInsets.all(10),
      height: 70,
      decoration: const BoxDecoration(color: Colors.white),
      child: TextField(
        textAlignVertical: TextAlignVertical.center,
        decoration: InputDecoration(
          hintText: 'Введите название смартфона',
          suffixIcon: IconButton(
            onPressed: () {
              filterCards(searchController.text);
            },
            icon: const Icon(Icons.search),
          ),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 4, horizontal: 7),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
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
}
