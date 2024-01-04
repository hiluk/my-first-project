import 'package:flutter/material.dart';

class SmartphoneModel with ChangeNotifier {
  String name;
  String color;
  String memory;
  String processor;
  int price;
  String imagePath;
  String description;
  bool isSmartphoneFavorite;
  bool inBasket;
  int id;

  SmartphoneModel({
    required this.name,
    required this.color,
    required this.memory,
    required this.processor,
    required this.price,
    required this.imagePath,
    required this.description,
    required this.isSmartphoneFavorite,
    required this.inBasket,
    required this.id,
  });

  SmartphoneModel copyWith({
    String? name,
    String? color,
    String? memory,
    String? processor,
    int? price,
    String? imagePath,
    int? id,
    bool? isSmartphoneFavorite,
    bool? inBasket,
    String? description,
  }) {
    return SmartphoneModel(
        name: name ?? this.name,
        color: color ?? this.color,
        memory: memory ?? this.memory,
        processor: processor ?? this.processor,
        price: price ?? this.price,
        imagePath: imagePath ?? this.imagePath,
        description: description ?? this.description,
        isSmartphoneFavorite: isSmartphoneFavorite ?? this.isSmartphoneFavorite,
        inBasket: inBasket ?? this.inBasket,
        id: id ?? this.id);
  }
}
