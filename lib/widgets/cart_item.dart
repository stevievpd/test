// ignore_for_file: sort_child_properties_last, prefer_const_constructors

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/cart.dart';

class CartItem extends StatelessWidget {
  final String id;
  final String productId;
  final double price;
  final int quantity;
  final String title;

  CartItem(
    this.id,
    this.productId,
    this.price,
    this.quantity,
    this.title,
  );

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: Dismissible(
        key: ValueKey(id),
        background: Container(
          color: Theme.of(context).errorColor,
          child: Icon(
            Icons.delete,
            color: Colors.white,
            size: 40,
          ),
          alignment: Alignment.centerRight,
          padding: EdgeInsets.only(right: 20),
          margin: EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 4,
          ),
        ),
        direction: DismissDirection.endToStart,
        confirmDismiss: (direction) {
          return showDialog(
            context: context,
            builder: (ctx) => AlertDialog(
              title: Text('Are you sure?'),
              content: Text('Do you want to remove the item from the cart?'),
              actions: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop(false);
                  },
                  child: Text('No'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop(true);
                  },
                  child: Text('Yes'),
                ),
              ],
            ),
          );
        },
        onDismissed: (direction) {
          Provider.of<Cart>(context, listen: false).removeItem(productId);
        },
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          elevation: 4,
          color: Color.fromARGB(255, 58, 59, 74),
          margin: EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 4,
          ),
          child: Padding(
            padding: EdgeInsets.all(1),
            child: ListTile(
              leading: CircleAvatar(
                maxRadius: 15,
                child: Padding(
                  padding: EdgeInsets.all(2),
                  child: FittedBox(
                    child: Text(
                      productId,
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
              title: Text(title, style: TextStyle(color: Colors.white)),
              subtitle:
                  Text('Total: P$price', style: TextStyle(color: Colors.white)),
              trailing:
                  Text('($quantity x)', style: TextStyle(color: Colors.white)),
            ),
          ),
        ),
      ),
    );
  }
}
