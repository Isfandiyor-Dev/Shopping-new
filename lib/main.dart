import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_new/controllers/cart_controller.dart';
import 'package:shopping_new/controllers/products_controller.dart';
import 'package:shopping_new/views/screens/home_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ProductsController(),
        ),
        ChangeNotifierProvider(
          create: (context) => CartController(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(colorSchemeSeed: Colors.lightGreen),
        home: HomePage(),
      ),
    );
  }
}
