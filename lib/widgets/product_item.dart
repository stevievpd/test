import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../screens/product_detail_screen.dart';
import '../providers/product.dart';
import '../providers/cart.dart';
import '../providers/scroll_controller.dart';

class ProductItem extends StatelessWidget {
  // final String id;
  // final String title;
  // final String imageUrl;

  // ProductItem(this.id, this.title, this.imageUrl);

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context, listen: false);
    final cart = Provider.of<Cart>(context, listen: false);
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(
              ProductDetailScreen.routeName,
              arguments: product.id,
            );
          },
          child: Consumer<Product>(
            builder: (ctx, product, _) => Card(
              child: InkWell(
                onTap: () {
                  cart.addItem(product.id, product.price, product.title);
                  ScrollControl().scrollDown();
                },
                splashColor: Colors.blue,
                child: Column(
                  children: [
                    Text(product.title),
                    Text(product.price.toString()),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
