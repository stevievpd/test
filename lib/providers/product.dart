import 'package:flutter/foundation.dart';

class Product with ChangeNotifier {
  late String id;
  late String title;
  late String description;
  late double price;
  late int category;
  late String icon;

  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.category,
    required this.icon,
  });

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'].toString();
    title = json['title'] as String;
    description = json['description'] as String;
    price = (json['price'] as num).toDouble();
    category = json['categoryId'] as int;
    icon = json['icon'] as String;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['description'] = description;
    data['price'] = price;
    data['category'] = category;
    data['icon'] = icon;
    return data;
  }
}
