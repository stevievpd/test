import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/screens/more_screen.dart';
import 'package:flutter_complete_guide/screens/orders_screen.dart';
import 'package:provider/provider.dart';

import '../widgets/app_drawer.dart';
import '../widgets/category_grid.dart';
import '../widgets/products_grid.dart';
import '../widgets/badge.dart';
import '../providers/cart.dart';
import '../widgets/cart_grid.dart';

enum FilterOptions {
  Favorites,
  All,
}

class ProductsOverviewScreen extends StatefulWidget {
  @override
  _ProductsOverviewScreenState createState() => _ProductsOverviewScreenState();
}

class _ProductsOverviewScreenState extends State<ProductsOverviewScreen> {
  int _selectedIndex = 0;

  final List<Widget> _widgetOptions = <Widget>[
    MenuScreen(),
    OrdersScreen(),
    MoreScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Shop'),
      ),
      drawer: AppDrawer(),
      body: SafeArea(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_checkout),
            label: 'Checkout',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.receipt_long),
            label: 'Transactions',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.more),
            label: 'More',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: _onItemTapped,
      ),
    );
  }
}

class MenuScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Row(
      children: [
        Column(
          children: [
            SizedBox(
              width: screenSize.width * 0.75,
              height: screenSize.height * 0.40,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  border: Border.all(width: 0.05),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: CategoryGrid(),
                ),
              ),
            ),
            SizedBox(
              width: screenSize.width * 0.75,
              height: screenSize.height * 0.4,
              child: ProductsGrid(),
            ),
          ],
        ),
        SizedBox(
          width: screenSize.width * 0.25,
          height: screenSize.height,
          child: DecoratedBox(
            decoration: BoxDecoration(
              border: Border.all(width: 0.05),
            ),
            child: CartGrid(),
          ),
        ),
      ],
    );
  }
}
