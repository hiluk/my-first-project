import 'package:flutter/material.dart';
import 'package:technical_dz/models/smartphones_model.dart';

class FavoritePage extends StatefulWidget {
  final void Function(List<SmartphoneModel> smartphones) onChanged;
  final List<SmartphoneModel> smartphones;
  const FavoritePage({
    Key? key,
    required this.smartphones,
    required this.onChanged,
  }) : super(key: key);

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  List<SmartphoneModel> get favoriteSmartphones => widget.smartphones
      .where((element) => element.isSmartphoneFavorite)
      .toList();
  AppBar appBar() {
    return AppBar(
      title: const Text(
        'Избранное',
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
      body: Column(
        children: [
          _buildScreen(),
          const SizedBox(height: 1),
          _smartphonesCount(),
        ],
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  Expanded _buidEmptyScreen() {
    return const Expanded(
      child: Center(
        child: Text(
          'Избраннное пусто',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 17,
            color: Colors.black,
          ),
        ),
      ),
    );
  }

  Widget _buildListView() {
    return Expanded(
      child: ListView.separated(
        padding: const EdgeInsets.only(top: 1),
        separatorBuilder: (context, index) => const SizedBox(height: 1),
        itemCount: favoriteSmartphones.length,
        itemBuilder: (context, index) {
          return Dismissible(
            key: UniqueKey(),
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
                    (element) => element.id == favoriteSmartphones[index].id);
                widget.smartphones[correctIndex].isSmartphoneFavorite =
                    !widget.smartphones[correctIndex].isSmartphoneFavorite;
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
                        child:
                            Image.asset(favoriteSmartphones[index].imagePath),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            favoriteSmartphones[index].name,
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
                                  '${favoriteSmartphones[index].memory} | ${favoriteSmartphones[index].processor}',
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
                            favoriteSmartphones[index].description,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: const TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                          Text(
                            '${favoriteSmartphones[index].price.toString()} ₽',
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
    if (favoriteSmartphones.isEmpty) {
      return _buidEmptyScreen();
    } else {
      return _buildListView();
    }
  }

  Container _smartphonesCount() {
    return Container(
      color: Colors.white,
      height: 30,
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.only(left: 8.0, top: 2),
        child: Text(
          'Количество смартфонов: ${favoriteSmartphones.length}',
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
