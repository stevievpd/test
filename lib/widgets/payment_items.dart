import 'package:flutter/material.dart';

import '../providers/cart.dart';

class PaymentItem extends StatelessWidget {
  final CartItem cartData;
  const PaymentItem(this.cartData, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: Text(
            cartData.title,
          ),
          trailing: Text("${cartData.quantity.toString()}x"),
          subtitle: Text(
              "Total: P${(cartData.quantity * cartData.price).toString()}"),
        ),
        const Divider(),
      ],
    );
  }
}
