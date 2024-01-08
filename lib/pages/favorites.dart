import 'package:flutter/material.dart';
import 'package:technical_dz/main.dart';
import 'package:technical_dz/models/smartphones_model.dart';
import 'package:technical_dz/pages/card.dart';
import 'package:technical_dz/widgets/item_tile.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({
    Key? key,
  }) : super(key: key);

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  List<SmartphoneModel> get favoriteSmartphones =>
      smartphones.where((element) => element.isSmartphoneFavorite).toList();
  AppBar appBar() {
    return AppBar(
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context, smartphones);
        },
        icon: const Icon(
          Icons.arrow_back,
        ),
      ),
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
                final correctIndex = smartphones.indexWhere(
                    (element) => element.id == favoriteSmartphones[index].id);
                smartphones[correctIndex].isSmartphoneFavorite =
                    !smartphones[correctIndex].isSmartphoneFavorite;
              });
            },
            child: InkWell(
              onTap: () {
                _sendSmartphoneDetail(context, index);
              },
              child: ItemTile(
                smartphone: favoriteSmartphones[index],
                smartphones: favoriteSmartphones,
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

  Future<void> _sendSmartphoneDetail(BuildContext context, index) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SmartphonePage(
          smartphoneDetail: smartphones[index],
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
