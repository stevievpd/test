import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/error/dialog_error.dart';
import '../providers/cart.dart';
import '../providers/orders.dart';
import '../widgets/ticket.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  final cashPaymentController = TextEditingController();
  final errorDialog = ErrorDialog();

  @override
  void dispose() {
    cashPaymentController.dispose();
    super.dispose();
  }

  void checkOut(cart, double? amountPayment) async {
    try {
      var cashPayment = amountPayment!.toDouble();
      var cashChange = cashPayment - cart.totalAmount;
      final result =
          await Provider.of<Orders>(context, listen: false).addOrders(
        cart.items.values.toList(),
        cart.totalAmount,
        cashPayment,
        cashChange,
      );
      if (!mounted) {
        return;
      }
      if (result) {
        Navigator.of(context).pop();
      }
    } catch (error) {
      errorDialog.showDialog1(context, error);
    }
  }

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    final textTheme = Theme.of(context).textTheme;
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Expanded(
          flex: 1,
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: Theme.of(context).primaryColor,
              title: const Text(
                "Ticket",
                style: TextStyle(fontSize: 20),
              ),
              automaticallyImplyLeading: false,
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.person),
                )
              ],
            ),
            body: const SingleChildScrollView(child: Ticket()),
            floatingActionButton: null,
          ),
        ),
        Expanded(
          flex: 2,
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: Theme.of(context).primaryColor,
            ),
            floatingActionButton: null,
            body: SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text(
                      "P${cart.totalAmount.toString()}",
                      style: textTheme.bodyLarge,
                    ),
                    Text(
                      "Total amount due",
                      style: textTheme.titleMedium,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        ElevatedButton(
                          onPressed: () {
                            checkOut(cart, 50);
                            cart.clear();
                          },
                          child: Text("50", style: textTheme.labelMedium),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            checkOut(cart, 100);
                            cart.clear();
                          },
                          child: Text("100", style: textTheme.labelMedium),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            checkOut(cart, 500);
                            cart.clear();
                          },
                          child: Text("500", style: textTheme.labelMedium),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            checkOut(cart, 1000);
                            cart.clear();
                          },
                          child: Text("1000", style: textTheme.labelMedium),
                        ),
                      ],
                    ),
                    const Text("Cash recieved"),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        const Expanded(flex: 1, child: Icon(Icons.money)),
                        Expanded(
                          flex: 3,
                          child: TextField(
                            controller: cashPaymentController,
                            keyboardType: TextInputType.number,
                          ),
                        ),
                        Expanded(
                            flex: 1,
                            child: TextButton(
                              onPressed: () {
                                checkOut(
                                  cart,
                                  double.parse(cashPaymentController.text),
                                );
                                cart.clear();
                              },
                              child: const Text("CHARGE"),
                            )),
                      ],
                    ),
                    const SizedBox(height: 10),
                    ElevatedButton.icon(
                      icon: const Icon(Icons.credit_card),
                      onPressed: () {},
                      label: const Text("CARD"),
                    ),
                    ElevatedButton.icon(
                      icon: const Icon(Icons.money),
                      onPressed: () {},
                      label: const Text("CASH"),
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
