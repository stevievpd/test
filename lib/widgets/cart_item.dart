import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/cart.dart';

class CartItem extends StatelessWidget {
  final String id;
  final String productId;
  final double price;
  final int quantity;
  final String title;

  const CartItem(this.id, this.productId, this.price, this.quantity, this.title,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: Dismissible(
        key: ValueKey(id),
        background: Container(
          color: Theme.of(context).errorColor,
          alignment: Alignment.centerRight,
          padding: const EdgeInsets.only(right: 10),
          margin: const EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 4,
          ),
          child: const Icon(
            Icons.delete,
            color: Colors.white,
            size: 40,
          ),
        ),
        direction: DismissDirection.endToStart,
        confirmDismiss: (direction) {
          return showDialog(
            context: context,
            builder: (ctx) => AlertDialog(
              title: const Text('Are you sure?'),
              content:
                  const Text('Do you want to remove the item from the cart?'),
              actions: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop(false);
                  },
                  child: const Text('No'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop(true);
                  },
                  child: const Text('Yes'),
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
          color: const Color.fromARGB(255, 47, 48, 60),
          margin: const EdgeInsets.symmetric(
            horizontal: 1,
            vertical: 4,
          ),
          child: Padding(
            padding: const EdgeInsets.all(1),
            child: ListTile(
              leading: CircleAvatar(
                maxRadius: 15,
                child: Padding(
                  padding: const EdgeInsets.all(2),
                  child: FittedBox(
                    child: Text(
                      productId,
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
              title: Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text('Total: P$price',
                  style: const TextStyle(color: Colors.grey)),
              trailing: Text(
                '$quantity x',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
