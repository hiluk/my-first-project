class SmartphoneModel {
  String name;
  String color;
  String memory;
  String processor;
  String price;
  String imagePath;
  String description;
  int id;

  SmartphoneModel({
    required this.name,
    required this.color,
    required this.memory,
    required this.processor,
    required this.price,
    required this.imagePath,
    required this.description,
    required this.id,
  });

  static List<SmartphoneModel> getSmartphoneModel() {
    List<SmartphoneModel> smartphones = [];

    smartphones.add(
      SmartphoneModel(
        name: 'Apple iPhone 15 Pro',
        color: 'Белый',
        memory: '512 ГБ',
        processor: 'A17 Pro',
        price: '184 990 ₽',
        imagePath: 'asset/img/iphone.png',
        id: 1,
        description:
            'Познакомьтесь с Action Button. В iPhone 15 Pro больше нет переключателя беззвучного режима. Вместо него установлена сенсорная кнопка, которая отвечает сразу за несколько действий: включение беззвучного режима, активация камеры, фонарика и других функций.',
      ),
    );

    smartphones.add(
      SmartphoneModel(
        name: 'Redmi 12',
        color: 'Черный',
        memory: '128 ГБ',
        processor: 'MediaTek Helio G88',
        price: '12 790 ₽',
        imagePath: 'asset/img/redmi.jpg',
        id: 2,
        description:
            'Вся линейка Xiaomi Redmi Note 12 оснащена большим, привлекательным AMOLED-дисплеем. Идеальный черный цвет и яркая цветопередача оживает прямо на глазах.',
      ),
    );

    smartphones.add(
      SmartphoneModel(
          name: 'Realme C53',
          color: 'Золотистый',
          memory: '128 ГБ',
          processor: 'Unisoc Tiger T612',
          price: '12 490 ₽',
          imagePath: 'asset/img/realme.jpeg',
          id: 3,
          description:
              'Realme C53. Высокая скорость. Высокая четкость. Захватывающий дизайн. Чемпион в своем классе.'),
    );

    smartphones.add(
      SmartphoneModel(
        name: 'Apple iPhone 13',
        color: 'Черный',
        memory: '256 ГБ',
        processor: 'A15 Bionic',
        price: '83 990 ₽',
        imagePath: 'asset/img/iphone_13.png',
        id: 4,
        description:
            'Дисплей Super Retina XDR 6,1 дюйма. Режим «Киноэффект» автоматически переводит фокус между объектами при съёмке видео и создаёт красивый эффект размытия',
      ),
    );

    smartphones.add(
      SmartphoneModel(
        name: 'Apple iPad Pro 11',
        color: 'Серый',
        memory: '128 ГБ',
        processor: 'Apple M2',
        price: '122 990 ₽',
        imagePath: 'asset/img/ipad_11.png',
        id: 5,
        description:
            'Планшет Apple iPad Pro 11 2022 — модель с рубленными гранями и закругленными углами, выполнена в корпусе из алюминия.Объем встроенной памяти равен 128 Гб. 11-дюймовый экран типа Liquid Retina отображает изображение с реалистичной цветопередачей. Разрешение 1668х2388 пикселей дает возможность наслаждаться детализированной графикой. Предусмотрена поддержка Apple Pencil (2 gen.). Планшет оснащен динамиками, выдающими чистое звучание в широком диапазоне частот.',
      ),
    );

    smartphones.add(
      SmartphoneModel(
        name: 'Samsung Galaxy S23 Ultra',
        color: 'Серый',
        memory: '128 ГБ',
        processor: 'Qualcomm Snapdragon',
        price: '89 990 ₽',
        imagePath: 'asset/img/galaxy.png',
        id: 6,
        description:
            'Новый флагман Samsung Galaxy S23 Ultra — смартфон, у которого есть все шансы стать легендой. В нем гармонично сочетаются стильный дизайн, материалы премиум-класса, топовая «начинка», камера профессионального уровня. Встроенный стилус S-Pen сделает новинку желанной покупкой для дизайнеров, художников и всех, кто любит использовать возможности смартфона на полную.',
      ),
    );

    smartphones.add(
      SmartphoneModel(
        name: 'Xiaomi 13 Lite',
        color: 'Голубой',
        memory: '128 ГБ',
        processor: 'Qualcomm Snapdragon',
        price: '32 990 ₽',
        imagePath: 'asset/img/xiaomi.jpeg',
        id: 7,
        description:
            'Xiaomi 13 Lite имеет все шансы стать лучшим в категории доступных флагманов в 2023 году. Стильная новинка обладает тонким и элегантным корпусом, предложенным в многообразии цветов. Xiaomi 13 Lite определенно создан для тех, кто ценит дизайн и считает смартфон продолжением своего стиля.',
      ),
    );

    return smartphones;
  }
}
