import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_new/controllers/products_controller.dart';
import 'package:shopping_new/views/screens/admin/add_product.dart';
import 'package:shopping_new/views/screens/category_screen.dart';

class AdminScreen extends StatefulWidget {
  const AdminScreen({super.key});

  @override
  State<AdminScreen> createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  @override
  Widget build(BuildContext context) {
    var controller = Provider.of<ProductsController>(context);
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: Theme.of(context).colorScheme.surfaceTint,
        title: const Text("Prodcuts"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigator.push(
          //     context,
          //     MaterialPageRoute(
          //         builder: (context) => AddProductScreen(categoryId: controller.categories,)));
        },
        child: const Icon(Icons.add),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 170,
            child: ListView.builder(
              padding: const EdgeInsets.all(20),
              scrollDirection: Axis.vertical,
              itemCount: controller.categories.length,
              itemBuilder: (context, index) {
                print(controller.categories[index].name);
                return Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (ctx) => CategoryScreen(
                            isAdmin: true,
                            category: controller.categories[index],
                          ),
                        ),
                      );
                    },
                    borderRadius: BorderRadius.circular(20),
                    child: Ink(
                      height: 200,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(controller.categories[index].image),
                          colorFilter: const ColorFilter.srgbToLinearGamma(),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(
                        child: Text(
                          controller.categories[index].name,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
