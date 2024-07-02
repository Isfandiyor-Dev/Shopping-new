import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_new/controllers/products_controller.dart';
import 'package:shopping_new/models/product.dart';
import 'package:shopping_new/views/screens/category_screen.dart';
import 'package:shopping_new/views/widgets/cart_bottom_sheet.dart';
import 'package:shopping_new/views/widgets/my_drawer.dart';
import 'package:shopping_new/views/widgets/product_item.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int navigatorIndex = 0;

  List discovery = [
    "Popular",
    "New",
    "Best Selling",
    "Trending",
    "Recommended",
    "Editors' Picks",
    "On Sale",
    "Top Rated",
    "Seasonal Favorites",
    "Customer Favorites",
  ];
  @override
  Widget build(BuildContext context) {
    var controller = Provider.of<ProductsController>(context);
    return Scaffold(
      drawer: const MyDrawer(),
      floatingActionButton: IconButton.filled(
        style: IconButton.styleFrom(
          fixedSize: const Size(50, 50),
          backgroundColor: Colors.lightGreen,
        ),
        onPressed: () {
          showModalBottomSheet(
            isScrollControlled: true,
            context: context,
            builder: (context) => CartBottomSheet(),
          );
        },
        icon: const Icon(
          Icons.shopping_bag,
        ),
      ),
      appBar: AppBar(
        toolbarHeight: 90,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              icon: Icon(
                Icons.menu,
                color: Colors.lightGreen.shade500,
              ),
            );
          },
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.notifications_outlined,
              color: Colors.lightGreen.shade500,
              size: 30,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.search,
              color: Colors.lightGreen.shade500,
              size: 30,
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(right: 20, left: 10),
            child: CircleAvatar(
              backgroundImage: AssetImage("assets/myphoto.png"),
              radius: 25,
            ),
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 170,
            child: ListView.builder(
              padding: const EdgeInsets.all(20),
              scrollDirection: Axis.horizontal,
              itemCount: controller.categories.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 12),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (ctx) => CategoryScreen(
                            category: controller.categories[index],
                          ),
                        ),
                      );
                    },
                    borderRadius: BorderRadius.circular(20),
                    child: Ink(
                      width: 200,
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
                            fontSize: 20,
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
          SizedBox(
            height: 100,
            child: ListView.builder(
              padding: const EdgeInsets.all(20),
              scrollDirection: Axis.horizontal,
              itemCount: discovery.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 12),
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        navigatorIndex = index;
                      });
                    },
                    borderRadius: BorderRadius.circular(10),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 400),
                      width: 140,
                      decoration: BoxDecoration(
                        color: navigatorIndex == index
                            ? Colors.lightGreen.shade400
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Text(
                          discovery[index],
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: navigatorIndex == index
                                ? Colors.white
                                : Colors.grey[700],
                            fontWeight: FontWeight.w600,
                            fontSize: 17,
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
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
            child: StreamBuilder(
                stream: controller.list,
                builder: (context, snapshot) {
                  var products = snapshot.data!.docs;
                  return GridView.builder(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 50),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 1,
                      mainAxisSpacing: 90,
                      crossAxisSpacing: 20,
                    ),
                    itemCount: products.length,
                    itemBuilder: (context, index) {
                      Product product = Product.fromJson(products[index]);
                      return ProductItem(
                        product: product,
                      );
                    },
                  );
                }),
          )
        ],
      ),
    );
  }
}
