import 'package:flutter/material.dart';
import 'package:shopping_new/views/screens/admin/add_product.dart';

class AdminScreen extends StatefulWidget {
  const AdminScreen({super.key});

  @override
  State<AdminScreen> createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: Theme.of(context).colorScheme.surfaceTint,
        title: const Text("Prodcuts"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => AddProductScreen()));
        },
        child: const Icon(Icons.add),
      ),
      // body: ,
    );
  }
}
