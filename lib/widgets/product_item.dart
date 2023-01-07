// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/product.dart';
import '../providers/cart.dart';
import '../providers/scroll_controller.dart';

class ProductItem extends StatelessWidget {
  var productData;
  ProductItem({required this.productData});
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context, listen: false);
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        child: GestureDetector(
          onTap: () {},
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            elevation: 10,
            color: Color.fromARGB(255, 47, 48, 60),
            child: InkWell(
              onTap: () {
                cart.addItem(
                    productData.id, productData.price, productData.title);
                ScrollControl().scrollDown();
                ScaffoldMessenger.of(context).hideCurrentSnackBar();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    duration: Duration(milliseconds: 5),
                    content: Text("Added to cart!"),
                    action: SnackBarAction(
                      label: 'UNDO',
                      onPressed: () {
                        cart.removeSingleItem(productData.id);
                      },
                    ),
                  ),
                );
              },
              splashColor: Colors.blue[100],
              child: ClipRRect(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                          height: 120,
                          width: 180,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.network(
                              productData.icon.toString(),
                              fit: BoxFit.cover,
                            ),
                          )),
                      Text(
                        productData.title,
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                      Text(
                        'P ${productData.price}'.toString(),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.deepOrange,
                          fontSize: 20,
                        ),
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
