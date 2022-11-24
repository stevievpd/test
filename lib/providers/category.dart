import 'package:flutter/cupertino.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Categories with ChangeNotifier {
  int? id;
  String? title;
  String? icon;

  Categories({
    this.id,
    this.title,
  });

  Categories.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int;
    title = json['title'].toString();
    icon = json['icon'].toString();
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['icon'] = icon;
    return data;
  }
}

class CategoriesItem with ChangeNotifier {
  List<Categories> _categoryList = [];

  List<Categories> get categories {
    return [..._categoryList];
  }

  int get categoryCount {
    return _categoryList.length;
  }

  Future<void> fetchCategories() async {
    var url = Uri.parse(
        "http://${dotenv.env['apiUrl']}/categories/get-all-categories");
    try {
      final response = await http.get(url);
      var data = json.decode(response.body);
      var rest = data as List;
      List<Categories> loadedCategories;
      loadedCategories =
          rest.map<Categories>((json) => Categories.fromJson(json)).toList();
      _categoryList = loadedCategories;
      notifyListeners();
    } catch (e) {}
  }
}
