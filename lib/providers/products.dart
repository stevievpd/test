import 'package:flutter/material.dart';

import './product.dart';

class Products with ChangeNotifier {
  List<Product> productList = [];
  List<Product> _items = [
    Product(
      id: '1',
      title: "DM Okinawa",
      description:
          "Thin pastry cases stuffed with fresh horseradish and creamed sweetcorn",
      price: 70.00,
      category: 2,
    ),
    Product(
      id: '2',
      title: "DM Triple Choco",
      description: "A crisp salad featuring caramalised red onion and millet",
      price: 80.00,
      category: 1,
    ),
    Product(
      id: '3',
      title: "DM Dark Choco",
      description:
          "Crisp slices of bread filled with scotch bonnet chilli and fresh avocado",
      price: 80.00,
      category: 1,
    ),
    Product(
      id: '4',
      title: "Salted Caramel",
      description: "A crisp salad featuring fresh delicata and sweet potato",
      price: 140,
      category: 1,
    ),
    Product(
      id: '5',
      title: "Taro",
      description:
          "Succulent burgers made from fresh squash and chickpea, served in a roll",
      price: 90,
      category: 1,
    ),
    Product(
      id: '6',
      title: "Matcha",
      description: "Crumbly cupcakes made with pumpkin seeds and fresh raisin",
      price: 100,
      category: 1,
    ),
    Product(
      id: '7',
      title: "Squash and prune cookies",
      description: "Crunchy cookies made with butternut squash and fresh prune",
      price: 130,
      category: 1,
    ),
    Product(
      id: '8',
      title: "Strawberry",
      description: "Green cardamom and tart apple topped with crunchy crumble",
      price: 122,
      category: 1,
    ),
    Product(
      id: '9',
      title: "Cookies N' Cream",
      description: "Delicious spaghetti",
      price: 2,
      category: 2,
    ),
    Product(
      id: '16',
      title: "Oreo Cheesecake",
      description: "Green cardamom and tart apple topped with crunchy crumble",
      price: 150,
      category: 1,
    ),
    Product(
      id: '17',
      title: "Taro Cheesecake",
      description: "Green cardamom and tart apple topped with crunchy crumble",
      price: 130,
      category: 1,
    ),
    Product(
      id: '18',
      title: "WinterMelon Cheesecake",
      description: "Green cardamom and tart apple topped with crunchy crumble",
      price: 120,
      category: 1,
    ),
    Product(
      id: '19',
      title: "Matcha Cheesecake",
      description: "Green cardamom and tart apple topped with crunchy crumble",
      price: 150,
      category: 1,
    ),
  ];
  // var _showFavoritesOnly = false;

  List<Product> get items {
    // if (_showFavoritesOnly) {
    //   return _items.where((prodItem) => prodItem.isFavorite).toList();
    // }
    return [..._items];
  }

  List<Product> get favoriteItems {
    return _items.where((prodItem) => prodItem.isFavorite).toList();
  }

  Product findById(String id) {
    return _items.firstWhere((prod) => prod.id == id);
  }

  void addProduct() {
    // _items.add(value);
    notifyListeners();
  }

  List<Product> productItemsByCate(int categoryId) {
    productList = _items;
    productList =
        productList.where((element) => element.category == categoryId).toList();
    notifyListeners();
    return productList;
  }
}
