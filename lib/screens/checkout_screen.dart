// ignore_for_file: prefer_const_constructors, unused_local_variable

import 'package:flutter/material.dart';
import 'package:reality_pos/widgets/ticket.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
              title: Text(
                "Ticket",
                style: TextStyle(fontSize: 20),
              ),
              automaticallyImplyLeading: false,
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.person),
                )
              ],
            ),
            body: Ticket(),
          ),
        ),
        Expanded(
          flex: 2,
          child: Scaffold(
            appBar: AppBar(),
            body: SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(
                    "MONEY AMOUNT HERE",
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
                        child: Text(
                          "50",
                          style: textTheme.labelMedium,
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        child: Text("100"),
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        child: Text("500"),
                      ),
                    ],
                  ),
                  Text("Cash recieved"),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Expanded(flex: 1, child: Icon(Icons.money)),
                      Expanded(flex: 3, child: TextField()),
                      Expanded(
                          flex: 1,
                          child: TextButton(
                            onPressed: () {},
                            child: Text("CHARGE"),
                          )),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(onPressed: () {}, child: Text("CARD")),
                  ElevatedButton(onPressed: () {}, child: Text("CASH")),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
