import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:technical_dz/models/smartphones_model.dart';
import 'package:technical_dz/news/views/articles_view.dart';

void main() {
  runApp(
    const ProviderScope(child: MyApp()),
  );
}

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

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Montserrat',
        appBarTheme: const AppBarTheme(color: Colors.white),
        bottomSheetTheme:
            const BottomSheetThemeData(backgroundColor: Colors.white),
      ),
      home: ArticlesView(),
    );
  }
}
