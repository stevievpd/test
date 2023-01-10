import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:provider/provider.dart';

import '../providers/cart.dart';
import '../providers/category.dart';
import '../screens/orders_screen.dart';
import '../providers/products.dart';
import '../screens/auth_screen.dart';

class AppDrawer extends StatelessWidget {
  final storage = const FlutterSecureStorage();

  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final navigator = Navigator.of(context);
    return Drawer(
      backgroundColor: const Color.fromARGB(255, 234, 236, 255),
      child: Column(
        children: <Widget>[
          AppBar(
            backgroundColor: Theme.of(context).primaryColor,
            title: const Text('Hello Friend!'),
            automaticallyImplyLeading: false,
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.shop),
            title: const Text('Shop'),
            onTap: () {
              navigator.pushReplacementNamed('/');
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.payment),
            title: const Text('Orders'),
            onTap: () {
              navigator.pushReplacementNamed(OrdersScreen.routeName);
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
              Provider.of<Cart>(context, listen: false).clear();
              await storage.delete(key: "token");
              navigator.pushReplacementNamed(AuthScreen.routeName);
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.payment),
            title: const Text('Authscreen'),
            onTap: () {
              navigator.pushReplacementNamed(AuthScreen.routeName);
            },
          ),
          const Divider(),
        ],
      ),
    );
  }
}
