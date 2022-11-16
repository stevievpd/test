import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/category.dart';
import './category_item.dart';

class CategoryGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final categoryData = Provider.of<CategoriesItem>(context);
    final category = categoryData.categories;
    return GridView.builder(
      itemCount: category.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        childAspectRatio: 2,
      ),
      itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
        value: category[i],
        child: CategoryItem(),
      ),
    );
  }
}
