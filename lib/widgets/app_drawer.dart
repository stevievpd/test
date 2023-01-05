import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:reality_pos/providers/category.dart';
import 'package:reality_pos/screens/auth_screen.dart';
import 'package:provider/provider.dart';

import '../screens/orders_screen.dart';
import '../providers/auth.dart';
import '../providers/products.dart';

class AppDrawer extends StatelessWidget {
  final storage = FlutterSecureStorage();
  String? test;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          AppBar(
            title: const Text('Hello Friend!'),
            automaticallyImplyLeading: false,
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.shop),
            title: const Text('Shop'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed('/');
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.payment),
            title: const Text('Orders'),
            onTap: () {
              Navigator.of(context)
                  .pushReplacementNamed(OrdersScreen.routeName);
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Logout'),
            onTap: () async {
              Provider.of<CategoriesItem>(context, listen: false)
                  .clearCategories;
              Provider.of<Products>(context, listen: false).clearProducts;
              await storage.delete(key: "token");
              Navigator.of(context).pushReplacementNamed(AuthScreen.routeName);
            },
          ),
          const Divider(),
        ],
      ),
    );
  }
}
