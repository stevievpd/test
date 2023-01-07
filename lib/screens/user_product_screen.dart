// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/products.dart';
import '../widgets/user_product_item.dart';

class UserProductScreen extends StatelessWidget {
  static const routeName = '/user-products';

  const UserProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<Products>(context);
    return Row(
      children: [
        Container(
          color: Colors.blue,
          width: MediaQuery.of(context).size.width * 0.4,
        ),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.58,
              child: ListView.builder(
                itemCount: productsData.items.length,
                itemBuilder: (_, i) => Column(
                  children: [
                    UserProductItem(
                      productsData.items[i].title,
                    ),
                    Divider(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
