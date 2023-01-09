import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

import '../providers/cart.dart';
import '../widgets/ticket.dart';

class CheckoutScreen extends StatelessWidget {
  CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    final screenSize = MediaQuery.of(context).size;
    final textTheme = Theme.of(context).textTheme;
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Expanded(
          flex: 1,
          child: Scaffold(
            appBar: AppBar(
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
          ),
        ),
        Expanded(
          flex: 2,
          child: Scaffold(
            appBar: AppBar(),
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
                          onPressed: () {},
                          child: Text("50", style: textTheme.labelMedium),
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          child: Text("100", style: textTheme.labelMedium),
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          child: Text("500", style: textTheme.labelMedium),
                        ),
                        ElevatedButton(
                          onPressed: () {},
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
                        const Expanded(flex: 3, child: TextField()),
                        Expanded(
                            flex: 1,
                            child: TextButton(
                              onPressed: () {},
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
