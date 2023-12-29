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
  bool isGrid = false;
  List<SmartphoneModel> smartphones = [
    SmartphoneModel(
      name: 'Apple iPhone 15 Pro',
      color: 'Белый',
      memory: '512 ГБ',
      processor: 'A17 Pro',
      price: 184990,
      imagePath: 'asset/img/iphone.png',
      id: 1,
      isSmartphoneFavorite: false,
      inBasket: false,
      description:
          'Аппаратной основой Apple iPhone 15 Pro Max стал 3-нанометровый чипсет A17 Pro с 6-ядерным GPU и поддержкой трассировки лучей. Чип выдает высочайшую производительность в играх. Также имеется 16-ядерный Neural Engine, который обрабатывает 35 миллионов операций в секунду. Корпус смартфона изготовлен из титана 5-го класса (такой, например, используется в космическом ровере NASA). Титан прочнее, легче и долговечнее, чем алюминий и сталь. У iPhone 15 Pro Max нет физического переключателя для перехода в бесшумный режим. На его месте расположена программируемая кнопка, которая реагирует на силу нажатия. С ее помощью можно, например, включить камеру или фонарик. У iPhone 15 Pro Max 6,7-дюймовый OLED-экран с разрешением 2796 × 1290 пикселей, кадровой частотой 120 Гц и пиковой яркостью 2000 нит. Основная камера состоит из трех сенсоров. Главный на 48 Мп. Пользователь может выбрать фокусное расстояние — 24, 28 или 35 мм. Также у смартфона ширик и телевик с 5-кратным приближением без потери качества на 12 Мп. iPhone 15 Pro Max получил порты USB-C с поддержкой USB 3 и скоростью передачи данных до 10 Гбит/с. Операционная система — iOS 17.',
    ),
    SmartphoneModel(
      name: 'Redmi 12',
      color: 'Черный',
      memory: '128 ГБ',
      processor: 'MediaTek Helio G88',
      price: 12790,
      imagePath: 'asset/img/redmi.jpg',
      id: 2,
      isSmartphoneFavorite: false,
      inBasket: false,
      description:
          'Смартфон Xiaomi Redmi 12C с 8-ядерным процессором MediaTek Helio G85 удивляет производительностью даже искушенных пользователей – он позволяет редактировать видео и проходить тяжеловесные игры. Для хранения информации и ПО у него есть 128 ГБ встроенной памяти. Иммерсивный IPS-экран диагональю 6.71 дюйма транслирует изображение с четкостью 1650x720 пикс. Это означает, что фото, которые вы сделали на 50-мегапиксельную камеру с ИИ, будет легко редактировать. Для удобного общения по видеомессенджерам у смартфона есть фронтальный модуль на 5 Мп.',
    ),
    SmartphoneModel(
        name: 'Realme C53',
        color: 'Золотистый',
        memory: '128 ГБ',
        processor: 'Unisoc Tiger T612',
        price: 12490,
        imagePath: 'asset/img/realme.jpeg',
        id: 3,
        isSmartphoneFavorite: false,
        inBasket: false,
        description:
            'Смартфон realme C53 128 ГБ изготовлен в тонком пластиковом корпусе 7.49 мм черного цвета. Благодаря обтекаемым граням и отзывчивой сенсорной панели им удобно пользоваться. Матрица диагональю 6.74" с технологией IPS передает четкую картинку с яркими и насыщенными оттенками. Процессор Unisoc Tiger T612 в паре с 6 ГБ оперативной памяти обеспечивает скорость и производительность аппаратной системы. Внутреннюю память 128 ГБ можно увеличить картой microSD емкостью до 2048 ГБ. На тыловой панели размещена сдвоенная камера 50+0.08 Мп для создания детализированных фотографий и видео. Фронтальная камера с разрешением 8 Мп предназначена для селфи и звонков по видеосвязи. В смартфоне установлен аккумулятор емкостью 5000 мА*ч, который гарантирует до 951 часов автономной работы в режиме ожидания. Для ускоренного восстановления энергоресурса реализована технология SuperVOOC с выходной мощностью 33 Вт.'),
    SmartphoneModel(
      name: 'Apple iPhone 13',
      color: 'Черный',
      memory: '256 ГБ',
      processor: 'A15 Bionic',
      price: 83990,
      imagePath: 'asset/img/iphone_13.png',
      id: 4,
      isSmartphoneFavorite: false,
      inBasket: false,
      description:
          'Дисплей Super Retina XDR 6,1 дюйма. Режим «Киноэффект» автоматически переводит фокус между объектами при съёмке видео и создаёт красивый эффект размытия',
    ),
    SmartphoneModel(
      name: 'Apple iPad Pro 11',
      color: 'Серый',
      memory: '128 ГБ',
      processor: 'Apple M2',
      price: 122990,
      imagePath: 'asset/img/ipad_11.png',
      id: 5,
      isSmartphoneFavorite: false,
      inBasket: false,
      description:
          'Планшет Apple iPad Pro 11 2022 — модель с рубленными гранями и закругленными углами, выполнена в корпусе из алюминия.Объем встроенной памяти равен 128 Гб. 11-дюймовый экран типа Liquid Retina отображает изображение с реалистичной цветопередачей. Разрешение 1668х2388 пикселей дает возможность наслаждаться детализированной графикой. Предусмотрена поддержка Apple Pencil (2 gen.). Планшет оснащен динамиками, выдающими чистое звучание в широком диапазоне частот.',
    ),
    SmartphoneModel(
      name: 'Samsung Galaxy S23',
      color: 'Серый',
      memory: '128 ГБ',
      processor: 'Qualcomm Snapdragon',
      price: 89990,
      imagePath: 'asset/img/galaxy.png',
      id: 6,
      isSmartphoneFavorite: false,
      inBasket: false,
      description:
          'Новый флагман Samsung Galaxy S23 Ultra — смартфон, у которого есть все шансы стать легендой. В нем гармонично сочетаются стильный дизайн, материалы премиум-класса, топовая «начинка», камера профессионального уровня. Встроенный стилус S-Pen сделает новинку желанной покупкой для дизайнеров, художников и всех, кто любит использовать возможности смартфона на полную.',
    ),
    SmartphoneModel(
      name: 'Xiaomi 13 Lite',
      color: 'Голубой',
      memory: '128 ГБ',
      processor: 'Qualcomm Snapdragon',
      price: 32990,
      imagePath: 'asset/img/xiaomi.jpeg',
      id: 7,
      isSmartphoneFavorite: false,
      inBasket: false,
      description:
          'Xiaomi 13 Lite имеет все шансы стать лучшим в категории доступных флагманов в 2023 году. Стильная новинка обладает тонким и элегантным корпусом, предложенным в многообразии цветов. Xiaomi 13 Lite определенно создан для тех, кто ценит дизайн и считает смартфон продолжением своего стиля.',
    ),
  ];
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
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (BuildContext context) {
                  return BasketPage(
                    smartphones: smartphones,
                    onChanged: onChanged,
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
                      smartphones: smartphones, onChanged: onChanged);
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

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
  }

  onChanged(result) {
    setState(() {
      smartphones = result;
    });
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
        itemCount: filterSmartphones.length,
        itemBuilder: (context, index) {
          return InkWell(
            key: ValueKey(filterSmartphones[index].id),
            borderRadius: BorderRadius.circular(20),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext context) {
                    return SmartphonePage(
                      smartphoneDetail: filterSmartphones[index],
                      smartphones: smartphones,
                      onChanged: onChanged,
                    );
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
                    child: Image.asset(filterSmartphones[index].imagePath),
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
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) {
                      return SmartphonePage(
                        smartphoneDetail: filterSmartphones[index],
                        smartphones: smartphones,
                        onChanged: onChanged,
                      );
                    },
                  ),
                );
              },
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
                        child: Image.asset(filterSmartphones[index].imagePath),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            filterSmartphones[index].name,
                            style: const TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 18,
                              color: Colors.black,
                            ),
                          ),
                          Row(
                            children: [
                              Text(
                                '${filterSmartphones[index].memory} | ${filterSmartphones[index].processor}',
                                style: const TextStyle(
                                  color: Colors.grey,
                                ),
                              )
                            ],
                          ),
                          Text(
                            filterSmartphones[index].description,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: const TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                          Text(
                            '${formatter.format(filterSmartphones[index].price)} ₽',
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

  Container _searchField() {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: TextField(
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
