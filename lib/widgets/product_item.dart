import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/product.dart';
import '../providers/cart.dart';
import '../providers/scroll_controller.dart';

class ProductItem extends StatefulWidget {
  @override
  State<ProductItem> createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  @override
  Widget build(BuildContext context) {
    bool isEmpty = false;
    final product = Provider.of<Product>(context, listen: false);
    final cart = Provider.of<Cart>(context, listen: false);
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        child: GestureDetector(
          onTap: () {},
          child: Consumer<Product>(
            builder: (ctx, product, _) => Card(
              elevation: 10,
              color: Colors.blue[300],
              child: InkWell(
                onTap: () {
                  cart.addItem(product.id, product.price, product.title);
                  ScrollControl().scrollDown();
                  ScaffoldMessenger.of(context).hideCurrentSnackBar();
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      duration: Duration(milliseconds: 5),
                      content: Text("Added to cart!"),
                      action: SnackBarAction(
                        label: 'UNDO',
                        onPressed: () {
                          cart.removeSingleItem(product.id);
                        },
                      ),
                    ),
                  );
                },
                splashColor: Colors.blue[100],
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        product.title,
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                      Text(
                        'P${product.price}'.toString(),
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
