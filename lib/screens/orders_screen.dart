import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/orders.dart' show Orders;
import '../widgets/order_item.dart';
import '../widgets/app_drawer.dart';

class OrdersScreen extends StatelessWidget {
  static const routeName = '/orders';

  @override
  Widget build(BuildContext context) {
    final orderData = Provider.of<Orders>(context);
    return Row(
      children: [
        SizedBox(
          height: double.infinity,
          width: MediaQuery.of(context).size.width * 0.4,
          child: ListView.builder(
            itemCount: orderData.orders.length,
            itemBuilder: (ctx, i) => OrderItem(orderData.orders[i]),
          ),
        ),
        Container(
          color: Colors.red,
          height: double.infinity,
          width: MediaQuery.of(context).size.width * 0.6,
        ),
      ],
    );
  }
}
