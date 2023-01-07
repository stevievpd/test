// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reality_pos/screens/checkout_screen.dart';

import '../providers/cart.dart' show Cart;
import 'cart_item.dart';
import '../providers/scroll_controller.dart';

class CartGrid extends StatelessWidget {
  static const routeName = '/cart';

  const CartGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    return Column(
      children: <Widget>[
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.04,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.12,
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 47, 48, 60),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.zero),
                    ),
                  ),
                  icon: Icon(Icons.shopping_basket_outlined),
                  onPressed: () {},
                  label: Text(
                    'Order',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.10,
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepOrange,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.zero),
                    ),
                  ),
                  icon: Icon(
                    Icons.delete,
                    size: 30,
                  ),
                  onPressed: cart.clear,
                  label: Text('CLEAR'),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.45,
          child: Padding(
            padding: const EdgeInsets.only(top: 8.0, left: 18, right: 20),
            child: cart.items.isEmpty
                ? Container(
                    color: Color.fromARGB(255, 47, 48, 60),
                    child: Center(
                        child: Image.asset(
                      'assets/images/cart_logo.png',
                      fit: BoxFit.cover,
                    )),
                  )
                : ListView.builder(
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
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            elevation: 4,
            color: Color.fromARGB(255, 47, 48, 60),
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.28,
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 15, right: 10, bottom: 10, top: 10),
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
                      padding: const EdgeInsets.only(
                          left: 15, right: 10, bottom: 10),
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
                    Divider(
                      indent: 15,
                      endIndent: 10,
                      color: Colors.white,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 15, right: 10, bottom: 30),
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
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.07,
                      width: double.infinity,
                      child: ElevatedButton.icon(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Colors.deepOrange),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                            ),
                          ),
                        ),
                        icon: Icon(Icons.print),
                        label: Text(
                          'Place Order',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.white),
                        ),
                        // onPressed: cart.totalAmount <= 0
                        //     ? null
                        //     : () async {
                        //         await Provider.of<Orders>(context,
                        //                 listen: false)
                        //             .addOrders(
                        //           cart.items.values.toList(),
                        //           cart.totalAmount,
                        //         );
                        //         cart.clear();
                        //       },
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CheckoutScreen(),
                            ),
                          );
                        },
                      ),
                    ),
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
