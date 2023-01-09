import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './inventory_screen.dart';
import './more_screen.dart';
import './orders_screen.dart';
import '../widgets/app_drawer.dart';
import '../widgets/category_grid.dart';
import '../widgets/products_grid.dart';
import '../widgets/cart_grid.dart';
import '../providers/products.dart';
import '../providers/category.dart';
import '../widgets/confirm_exit_app.dart';

class ProductsOverviewScreen extends StatefulWidget {
  const ProductsOverviewScreen({super.key});

  @override
  State<ProductsOverviewScreen> createState() => _ProductsOverviewScreenState();
}

class _ProductsOverviewScreenState extends State<ProductsOverviewScreen> {
  int _selectedIndex = 0;

  final List<Widget> _widgetOptions = <Widget>[
    const MenuScreen(),
    const OrdersScreen(),
    const InventoryScreen(),
    const MoreScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ConfirmExit(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: const Text('My Shop'),
          backgroundColor: const Color(0xff1f2029),
        ),
        drawer: const AppDrawer(),
        body: SafeArea(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: const Color(0xff1f2029),
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
              icon: Icon(Icons.inventory_2),
              label: 'Inventory',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.more),
              label: 'More',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.deepOrange,
          unselectedItemColor: Colors.white,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final productData = Provider.of<Products>(context);
    final categoryData = Provider.of<CategoriesItem>(context);
    var screenSize = MediaQuery.of(context).size;
    return Row(
      children: [
        Column(
          children: [
            SizedBox(
              width: screenSize.width * 0.75,
              height: screenSize.height * 0.16,
              child: DecoratedBox(
                decoration: const BoxDecoration(color: Color(0xff1f2029)),
                child: Padding(
                  padding: const EdgeInsets.all(30),
                  child: RefreshIndicator(
                      onRefresh: categoryData.fetchCategories,
                      child: const CategoryGrid()),
                ),
              ),
            ),
            SizedBox(
              width: screenSize.width * 0.75,
              height: screenSize.height * 0.639,
              child: DecoratedBox(
                decoration: const BoxDecoration(color: Color(0xff1f2029)),
                child: Padding(
                  padding:
                      const EdgeInsets.only(left: 25.0, right: 25, top: 10),
                  child: RefreshIndicator(
                      onRefresh: productData.fetchProducts,
                      child: const ProductsGrid()),
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          width: screenSize.width * 0.25,
          height: screenSize.height,
          child: const DecoratedBox(
            decoration: BoxDecoration(color: Color(0xff1f2029)),
            child: CartGrid(),
          ),
        ),
      ],
    );
  }
}
