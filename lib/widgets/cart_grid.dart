import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/cart.dart' show Cart;
import 'cart_item.dart';
import '../providers/orders.dart';
import '../providers/scroll_controller.dart';

class CartGrid extends StatelessWidget {
  static const routeName = '/cart';

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    return Column(
      children: <Widget>[
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.05,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.15,
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.zero),
                    ),
                  ),
                  icon: Icon(Icons.food_bank),
                  onPressed: () {},
                  label: Text('Current Order'),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.10,
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.zero),
                    ),
                  ),
                  icon: Icon(
                    Icons.delete,
                    size: 30,
                  ),
                  onPressed: cart.clear,
                  label: Text(''),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 10),
        Expanded(
          child: ListView.builder(
            controller: controller,
            itemCount: cart.items.length,
            itemBuilder: (ctx, i) => CartItem(
              cart.items.values.toList()[i].id,
              cart.items.keys.toList()[i],
              cart.items.values.toList()[i].price,
              cart.items.values.toList()[i].quantity,
              cart.items.values.toList()[i].title,
            ),
          ),
        ),
        Card(
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Total',
                  style: TextStyle(fontSize: 20),
                ),
                Chip(
                  label: Text(
                    '\$${cart.totalAmount.toStringAsFixed(2)}',
                    style: TextStyle(
                      color:
                          Theme.of(context).primaryTextTheme.headline6!.color,
                    ),
                  ),
                  backgroundColor: Theme.of(context).primaryColor,
                ),
                TextButton(
                  child: Text('CHARGE'),
                  onPressed: () {
                    Provider.of<Orders>(context, listen: false).addOrder(
                      cart.items.values.toList(),
                      cart.totalAmount,
                    );
                    cart.clear();
                  },
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
