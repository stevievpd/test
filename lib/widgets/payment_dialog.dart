import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../screens/products_overview_screen.dart';
import '../widgets/payment_items.dart';
import '../providers/cart.dart';

//TODO: Add Reciept Number

class PaymentDialog extends StatelessWidget {
  final BuildContext ctx;
  final double paymentAmount;
  int count = 0;

  PaymentDialog(this.ctx, this.paymentAmount, {super.key});

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<Cart>(context);
    final screenSize = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: AlertDialog(
        title: Text(
          "Summary",
          style: Theme.of(context).textTheme.titleLarge,
        ),
        actions: [
          ElevatedButton(
            onPressed: () {
              Provider.of<Cart>(context, listen: false).clear();
              Navigator.popUntil(context, (route) {
                return count++ == 2;
              });
              // Navigator.pushReplacement(ctx,
              //     MaterialPageRoute(builder: (BuildContext context) {
              //   return ProductsOverviewScreen();
              // }));
            },
            child: Text("Close"),
          ),
        ],
        content: SizedBox(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: screenSize.height * 0.5,
                width: screenSize.width * 0.4,
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: cartProvider.itemCount,
                  itemBuilder: (context, index) =>
                      PaymentItem(cartProvider.items.values.toList()[index]),
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Total amount: P${cartProvider.totalAmount.toString()}",
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Amount paid: P${paymentAmount.toString()}",
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                ),
              ),
              Divider(),
              Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Change: P${(paymentAmount - cartProvider.totalAmount).toString()}",
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
