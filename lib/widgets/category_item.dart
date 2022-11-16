import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/category.dart';
import '../providers/products.dart';

class CategoryItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var categoryData = Provider.of<Categories>(context, listen: false);
    var productData = Provider.of<Products>(context);
    return Card(
      elevation: 3,
      color: Color.fromARGB(255, 120, 194, 247),
      child: InkWell(
        splashColor: Colors.blue.shade100,
        onTap: () {
          productData.productItemsByCate(categoryData.id.toInt());
        },
        child: Padding(
          padding: EdgeInsets.all(13),
          child: Text(
            categoryData.title.toString(),
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
      ),
    );
  }
}
