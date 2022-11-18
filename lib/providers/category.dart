import 'package:flutter/cupertino.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Categories with ChangeNotifier {
  int? id;
  String? title;

  Categories({
    required this.id,
    required this.title,
  });

  Categories.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int;
    title = json['title'].toString();
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    return data;
  }
}

class CategoriesItem with ChangeNotifier {
  List<Categories> _categoryList = [
    // Categories(
    //   id: 1,
    //   title: 'Milk Tea Series',
    // ),
    // Categories(
    //   id: 2,
    //   title: 'Quick & Easy',
    // ),
    // Categories(
    //   id: 3,
    //   title: 'Hamburgers',
    // ),
    // Categories(
    //   id: 4,
    //   title: 'German',
    // ),
    // Categories(
    //   id: 5,
    //   title: 'Light & Lovely',
    // ),
    // Categories(
    //   id: 6,
    //   title: 'Exotic',
    // ),
    // Categories(
    //   id: 7,
    //   title: 'Breakfast',
    // ),
    // Categories(
    //   id: 8,
    //   title: 'Asian',
    // ),
    // Categories(
    //   id: 9,
    //   title: 'French',
    // ),
    // Categories(
    //   id: 10,
    //   title: 'Summer',
    // ),
  ];

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
