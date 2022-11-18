import 'package:flutter/cupertino.dart';

class Categories with ChangeNotifier {
  int? id;
  String? title;

  Categories({
    this.id,
    this.title,
  });
}

class CategoriesItem with ChangeNotifier {
  final List<Categories> _categoryList = [
    Categories(
      id: 1,
      title: 'Milk Tea Series',
    ),
    Categories(
      id: 2,
      title: 'Quick & Easy',
    ),
    Categories(
      id: 3,
      title: 'Hamburgers',
    ),
    Categories(
      id: 4,
      title: 'German',
    ),
    Categories(
      id: 5,
      title: 'Light & Lovely',
    ),
    Categories(
      id: 6,
      title: 'Exotic',
    ),
    Categories(
      id: 7,
      title: 'Breakfast',
    ),
    Categories(
      id: 8,
      title: 'Asian',
    ),
    Categories(
      id: 9,
      title: 'French',
    ),
    Categories(
      id: 10,
      title: 'Summer',
    ),
  ];

  List<Categories> get categories {
    return [..._categoryList];
  }

  int get categoryCount {
    return _categoryList.length;
  }
}
