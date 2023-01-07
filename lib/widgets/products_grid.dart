// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/products.dart';
import './product_item.dart';

class ProductsGrid extends StatefulWidget {
  const ProductsGrid({super.key});

  @override
  State<ProductsGrid> createState() => _ProductsGridState();
}

class _ProductsGridState extends State<ProductsGrid> {
  var _isInit = true;

  @override
  void didChangeDependencies() {
    if (_isInit) {
      Provider.of<Products>(context).clearProducts();
      Provider.of<Products>(context).fetchProducts();
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final productList = Provider.of<Products>(context);
    return productList.productList.isEmpty
        ? Container(
            color: Color.fromARGB(255, 47, 48, 60),
            child: Center(
              child: Image.asset(
                'assets/images/category_logo.png',
                fit: BoxFit.cover,
              ),
            ),
          )
        : GridView.builder(
            padding: const EdgeInsets.all(10),
            itemCount: productList.productList.length,
            itemBuilder: (ctx, i) => ProductItem(
              productList.productList[i],
            ),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              childAspectRatio: 1,
            ),
          );
  }
}
