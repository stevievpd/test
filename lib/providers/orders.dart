import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import './cart.dart';

double? discountAmount = 0.0;

class OrderItem {
  final String id;
  final double amount;
  final List<CartItem> products;
  final DateTime dateTime;

  OrderItem({
    required this.id,
    required this.amount,
    required this.products,
    required this.dateTime,
  });
}

class Orders with ChangeNotifier {
  List<OrderItem> _orders = [];

  List<OrderItem> get orders {
    return [..._orders];
  }

  // Future<void> addOrder(List<CartItem> cartProducts, double total) async {
  //   var url = Uri.parse("http://${dotenv.env['apiUrl']}/order/add-order");
  //   try {
  //     final response = await http.post(url);
  //   } catch (e) {
  //     rethrow;
  //   }
  //   _orders.insert(
  //     0,
  //     OrderItem(
  //       id: DateTime.now().toString(),
  //       amount: total,
  //       dateTime: DateTime.now(),
  //       products: cartProducts,
  //     ),
  //   );
  //   notifyListeners();
  // }

  void clearOrderList() {
    _orders = [];
    notifyListeners();
  }

  Future<void> addOrders(List<CartItem> cartProducts, double total) async {
    final url = Uri.parse("http://${dotenv.env['apiUrl']}/order/add-order");
    final timestamp = DateTime.now();
    try {
      final response = await http.post(
        headers: {
          "Content-type": "application/json",
          "Accept": "application/json"
        },
        url,
        body: json.encode({
          'amount': total,
          'dateTime': timestamp.toIso8601String(),
          'products': cartProducts
              .map((cp) => {
                    'id': cp.id,
                    'title': cp.title,
                    'quantity': cp.quantity,
                    'price': cp.price,
                  })
              .toList(),
          "storeId": 1,
        }),
      );
      _orders.insert(
        0,
        OrderItem(
          id: json.decode(response.body)['name'],
          amount: total,
          dateTime: timestamp,
          products: cartProducts,
        ),
      );
    } catch (err) {
      rethrow;
    }
    notifyListeners();
  }
}
