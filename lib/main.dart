import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:provider/provider.dart';
import 'package:jwt_decode/jwt_decode.dart';

import './screens/auth_screen.dart';
import './screens/products_overview_screen.dart';
import './providers/products.dart';
import './providers/cart.dart';
import './providers/orders.dart';
import './providers/category.dart';
import './providers/auth.dart';
import './screens/orders_screen.dart';
import './widgets/cart_grid.dart';

Future<void> main() async {
  await dotenv.load();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  final storage = const FlutterSecureStorage();

  const MyApp({super.key});

  Future<String> get jwtOrEmpty async {
    var jwt = await storage.read(key: "token");
    if (jwt == null) return "";
    return jwt;
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);

    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: Auth()),
        ChangeNotifierProvider(
          create: (_) => Products(),
        ),
        ChangeNotifierProvider(
          create: (_) => Cart(),
        ),
        ChangeNotifierProvider(
          create: (_) => Orders(),
        ),
        ChangeNotifierProvider(
          create: (_) => CategoriesItem(),
        ),
      ],
      child: MaterialApp(
        title: 'MyShop',
        theme: ThemeData(
          primaryColor: const Color(0xff1f2029),
          textTheme: const TextTheme(
            titleLarge: TextStyle(fontWeight: FontWeight.bold),
            bodyLarge: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
            labelMedium: TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
            labelLarge: TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
            displayMedium: TextStyle(fontFamily: "Anton"),
            headlineSmall: TextStyle(fontFamily: "Anton"),
          ),
          fontFamily: 'Lato',
        ),
        home: FutureBuilder(
          future: jwtOrEmpty,
          builder: ((context, snapshot) {
            if (!snapshot.hasData) return const CircularProgressIndicator();
            if (snapshot.data != "") {
              var jwtToken = snapshot.data;
              var isExpired = Jwt.isExpired(jwtToken.toString());
              if (isExpired == false) {
                return const ProductsOverviewScreen();
              } else {
                return const AuthScreen();
              }
            } else {
              return const AuthScreen();
            }
          }),
        ),
        routes: {
          CartGrid.routeName: (ctx) => const CartGrid(),
          OrdersScreen.routeName: (ctx) => const OrdersScreen(),
          AuthScreen.routeName: (ctx) => const AuthScreen(),
          ProductsOverviewScreen.routeName: (ctx) =>
              const ProductsOverviewScreen(),
        },
      ),
    );
  }
}
