import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_new/controllers/cart_controller.dart';
import 'package:shopping_new/controllers/products_controller.dart';
import 'package:shopping_new/firebase_options.dart';
import 'package:shopping_new/views/screens/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
        home: const HomePage(),
      ),
    );
  }
}
