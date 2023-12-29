import 'package:flutter/material.dart';
import 'package:technical_dz/models/smartphones_model.dart';

class FavoritePage extends StatefulWidget {
  final void Function(List<SmartphoneModel> smartphones) onChanged;
  final List<SmartphoneModel> favoriteSmartphones;
  const FavoritePage({
    Key? key,
    required this.favoriteSmartphones,
    required this.onChanged,
  }) : super(key: key);

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  List<SmartphoneModel> smartphones = [];
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
    smartphones = widget.favoriteSmartphones;

    super.initState();
  }

  Widget _buildListView() {
    return Expanded(
      child: ListView.separated(
        padding: const EdgeInsets.only(top: 1),
        separatorBuilder: (context, index) => const SizedBox(height: 1),
        itemCount: smartphones.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {},
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
                            '${smartphones[index].price.toString()} ₽',
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
    if (smartphones.isEmpty) {
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
          'Количество смартфонов: ${widget.favoriteSmartphones.length}',
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
