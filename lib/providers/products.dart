import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'category.dart';

import './product.dart';

class Products with ChangeNotifier {
  List<Product> productList = [];
  List<Product> _items = [];

  List<Product> get items {
    return [..._items];
  }

  get length => null;

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

  Future<void> fetchProducts() async {
    var url =
        Uri.parse("http://${dotenv.env['apiUrl']}/products/get-all-products");
    try {
      final response = await http.get(url);
      var data = json.decode(response.body);
      var rest = data as List;
      List<Product> loadedMeals;
      loadedMeals =
          rest.map<Product>((json) => Product.fromJson(json)).toList();
      _items = loadedMeals;
      notifyListeners();
    } catch (e) {
      rethrow;
    }
  }
}
