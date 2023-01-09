// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reality_pos/providers/scroll_controller.dart';
import 'package:reality_pos/widgets/cart_grid.dart';
import 'package:reality_pos/widgets/cart_item.dart';

import '../providers/cart.dart' show Cart;

class Ticket extends StatelessWidget {
  const Ticket({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    final screenSize = MediaQuery.of(context).size;
    return Column(children: [
      Container(
        height: screenSize.height * 0.64,
        color: const Color(0xff1f2029),
        child: Padding(
          padding: const EdgeInsets.only(top: 8.0, left: 18, right: 20),
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
      ),
      Container(
        height: screenSize.height * 0.2376,
        color: const Color(0xff1f2029),
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 10, bottom: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                const Text(
                  'Subtotal',
                  style: TextStyle(fontSize: 15, color: Colors.white),
                ),
                Text(
                  'P ${cart.subTotal.toStringAsFixed(2)}',
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 10, bottom: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                const Text(
                  'Tax (12%)',
                  style: TextStyle(fontSize: 15, color: Colors.white),
                ),
                Text(
                  'P ${cart.totalTax.toStringAsFixed(2)}',
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 10, bottom: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                const Text(
                  'Total',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
                Text(
                  'P ${cart.totalAmount.toStringAsFixed(2)}',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ],
            ),
          ),
        ]),
      )
    ]);
  }
}
