import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_new/controllers/cart_controller.dart';
import 'package:shopping_new/models/product.dart';

// ignore: must_be_immutable
class CartBottomSheet extends StatelessWidget {
  Product? product;
  CartBottomSheet({super.key, this.product});

  @override
  Widget build(BuildContext context) {
    var cartController = Provider.of<CartController>(context);
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Center(
            child: Container(
              width: 40,
              height: 5,
              decoration: BoxDecoration(
                color: Colors.blueGrey,
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
          Row(
            children: [
              const Text(
                "My Cart",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              Container(
                width: 70,
                height: 30,
                margin: const EdgeInsets.all(20),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Colors.lightGreen,
                    borderRadius: BorderRadius.circular(10)),
                child: Text(
                  "Items ${cartController.getAllProdcutsAmount()}",
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            height: 350,
            child: ListView.builder(
              itemCount: cartController.cart.products.length,
              itemBuilder: (context, index) {
                final Product productItem = cartController.cart.products.values
                    .toList()[index]['product'];
                return Container(
                  height: 120,
                  padding: const EdgeInsets.all(15),
                  margin: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 120,
                        height: 120,
                        child: Image.asset("assets/images_products/lamp.png"),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(productItem.title),
                          Row(
                            children: [
                              IconButton(
                                onPressed: () {
                                  cartController.removeFromCart(productItem.id);
                                },
                                icon: const Icon(
                                  Icons.remove,
                                  size: 20,
                                ),
                              ),
                              Text(
                                  "${cartController.getProductAmount(productItem.id)}"),
                              IconButton(
                                onPressed: () {
                                  cartController.addToCart(productItem);
                                },
                                icon: const Icon(
                                  Icons.add,
                                  size: 20,
                                ),
                              ),
                              Container(
                                height: 20,
                                width: 2,
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                color: Colors.grey,
                              ),
                              Text(
                                "\$${productItem.price}",
                                style: const TextStyle(
                                  color: Colors.lightGreen,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17,
                                ),
                              ),
                            ],
                          ),
                          const Text("BLACK"),
                        ],
                      )
                    ],
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  "Total:  \$ ${cartController.cart.totalPrice}",
                  style: const TextStyle(
                    color: Colors.lightGreen,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: InkWell(
              borderRadius: BorderRadius.circular(20),
              onTap: () {},
              child: Ink(
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.lightGreen,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Center(
                  child: Text(
                    "CHECKOUT CART",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
