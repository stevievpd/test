import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/error/dialog_error.dart';
import '../providers/cart.dart';
import '../providers/orders.dart';
import '../widgets/ticket.dart';
import '../assets/custom_icons/custom_icons_icons.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  final cashPaymentController = TextEditingController();
  final errorDialog = ErrorDialog();
  String _paymentText = '';

  final _formKey = GlobalKey<FormState>();

  void _submit() {
    if (_formKey.currentState!.validate()) {
      try {
        checkOut(
          Provider.of<Cart>(context, listen: false),
          double.parse(cashPaymentController.text),
        );
        Provider.of<Cart>(context, listen: false).clear();
      } catch (error) {
        errorDialog.showDialog1(context, error.toString());
      }
    }
  }

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
    final screenSize = MediaQuery.of(context).size;
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
                    Padding(
                      padding: const EdgeInsets.only(top: 50, bottom: 10),
                      child: Text(
                        "P${cart.totalAmount.toString()}",
                        style: textTheme.bodyLarge,
                      ),
                    ),
                    Text(
                      "Total amount due",
                      style: textTheme.titleMedium,
                    ),
                    Form(
                      key: _formKey,
                      child: SizedBox(
                        width: screenSize.width,
                        child: Padding(
                          padding: const EdgeInsets.only(right: 100),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              const Expanded(
                                  flex: 1,
                                  child: Padding(
                                    padding: EdgeInsets.only(left: 100),
                                    child: Icon(CustomIcons.money_bill_alt),
                                  )),
                              Expanded(
                                flex: 4,
                                child: Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: TextFormField(
                                    onChanged: (value) => setState(() {
                                      _paymentText = value;
                                    }),
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return "Input field cannot be empty!";
                                      }
                                      if (double.parse(value) <
                                          cart.totalAmount) {
                                        return "Invalid payment amount!";
                                      }
                                      return null;
                                    },
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                    ),
                                    controller: cashPaymentController,
                                    keyboardType: TextInputType.number,
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        Theme.of(context).primaryColor,
                                  ),
                                  onPressed:
                                      _paymentText.isNotEmpty ? _submit : null,
                                  child: const Text("CHARGE"),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      width: screenSize.width * 0.40,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Theme.of(context).primaryColor,
                              fixedSize: const Size(100, 50),
                            ),
                            onPressed: () {
                              setState(() {
                                cashPaymentController.text = 50.toString();
                                _paymentText = 50.toString();
                              });
                            },
                            child: Text("50", style: textTheme.labelMedium),
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Theme.of(context).primaryColor,
                              fixedSize: const Size(100, 50),
                            ),
                            onPressed: () {
                              setState(() {
                                cashPaymentController.text = 100.toString();
                                _paymentText = 100.toString();
                              });
                            },
                            child: Text("100", style: textTheme.labelMedium),
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Theme.of(context).primaryColor,
                              fixedSize: const Size(100, 50),
                            ),
                            onPressed: () {
                              setState(() {
                                cashPaymentController.text = 500.toString();
                                _paymentText = 500.toString();
                              });
                            },
                            child: Text("500", style: textTheme.labelMedium),
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Theme.of(context).primaryColor,
                              fixedSize: const Size(100, 50),
                            ),
                            onPressed: () {
                              setState(() {
                                cashPaymentController.text = 1000.toString();
                                _paymentText = 1000.toString();
                              });
                            },
                            child: Text("1000", style: textTheme.labelMedium),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      width: screenSize.width * 0.4,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          ElevatedButton.icon(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Theme.of(context).primaryColor,
                              fixedSize: const Size(100, 50),
                            ),
                            icon: const Icon(Icons.credit_card),
                            onPressed: () {},
                            label: const Text("CARD"),
                          ),
                          ElevatedButton.icon(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Theme.of(context).primaryColor,
                              fixedSize: const Size(100, 50),
                            ),
                            icon: const Icon(Icons.money),
                            onPressed: () {},
                            label: const Text("CASH"),
                          ),
                        ],
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
