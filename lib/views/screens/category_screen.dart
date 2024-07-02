import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_new/controllers/products_controller.dart';

import 'package:shopping_new/models/products_category.dart';
import 'package:shopping_new/views/screens/admin/add_product.dart';
import 'package:shopping_new/views/widgets/product_item.dart';

// ignore: must_be_immutable
class CategoryScreen extends StatelessWidget {
  bool isAdmin;
  CategoryModel category;
  CategoryScreen({
    super.key,
    required this.category,
    this.isAdmin = false,
  });

  @override
  Widget build(BuildContext context) {
    var controller = Provider.of<ProductsController>(context);
    controller.reloadCategory();
    return Scaffold(
      floatingActionButton: isAdmin
          ? FloatingActionButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        AddProductScreen(categoryId: category.id),
                  ),
                );
              },
              child: const Icon(Icons.add),
            )
          : null,
      body: Column(
        children: [
          Container(
            height: 350,
            alignment: const Alignment(0, 0),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(category.image),
                colorFilter: const ColorFilter.srgbToLinearGamma(),
                fit: BoxFit.cover,
              ),
            ),
            child: Stack(
              children: [
                Positioned(
                  child: AppBar(
                    backgroundColor: Colors.transparent,
                    leading: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.arrow_back_rounded,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    category.name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 28,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Have 24 products",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                FilledButton(
                  onPressed: () {},
                  child: const Row(
                    children: [
                      Text(
                        "Sort by",
                      ),
                      Icon(
                        Icons.arrow_drop_down_rounded,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1,
                mainAxisSpacing: 90,
                crossAxisSpacing: 20,
              ),
              itemCount: category.products.length,
              itemBuilder: (context, index) {
                return ProductItem(
                    isAdmin: isAdmin, product: category.products[index]);
              },
            ),
          )
        ],
      ),
    );
  }
}
