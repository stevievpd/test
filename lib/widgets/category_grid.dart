import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/category.dart';
import './category_item.dart';

class CategoryGrid extends StatefulWidget {
  const CategoryGrid({super.key});

  @override
  State<CategoryGrid> createState() => _CategoryGridState();
}

class _CategoryGridState extends State<CategoryGrid> {
  var _isInit = true;

  @override
  void didChangeDependencies() {
    if (_isInit) {
      Provider.of<CategoriesItem>(context).fetchCategories();
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final categoryData = Provider.of<CategoriesItem>(context);
    final category = categoryData.categories;
    return ListView.builder(
      padding: const EdgeInsets.all(4),
      scrollDirection: Axis.horizontal,
      itemCount: category.length,
      itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
        value: category[i],
        child: const SizedBox(
          width: 225,
          child: CategoryItem(),
        ),
      ),
    );
  }
}
