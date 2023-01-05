import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:provider/provider.dart';
import 'package:reality_pos/screens/products_overview_screen.dart';
import 'package:jwt_decode/jwt_decode.dart';

import './providers/products.dart';
import './providers/cart.dart';
import './providers/orders.dart';
import './providers/category.dart';
import './providers/auth.dart';
import './screens/orders_screen.dart';
import './screens/auth_screen.dart';
import './widgets/cart_grid.dart';

Future<void> main() async {
  await dotenv.load();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final storage = const FlutterSecureStorage();

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
          textTheme: const TextTheme(
            bodyLarge: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
            labelMedium: TextStyle(fontSize: 20),
          ),
          fontFamily: 'Lato',
          colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue)
              .copyWith(secondary: Colors.deepOrange),
        ),
        home: FutureBuilder(
          future: jwtOrEmpty,
          builder: ((context, snapshot) {
            if (!snapshot.hasData) return const CircularProgressIndicator();
            if (snapshot.data != "") {
              var jwtToken = snapshot.data;
              var isExpired = Jwt.isExpired(jwtToken.toString());
              if (isExpired == false) {
                return ProductsOverviewScreen();
              } else {
                return AuthScreen();
              }
            } else {
              return AuthScreen();
            }
          }),
        ),
        routes: {
          CartGrid.routeName: (ctx) => CartGrid(),
          OrdersScreen.routeName: (ctx) => OrdersScreen(),
          AuthScreen.routeName: (ctx) => AuthScreen(),
        },
      ),
    );
  }
}
