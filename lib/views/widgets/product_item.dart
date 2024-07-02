import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopping_new/models/product.dart';
import 'package:shopping_new/views/screens/detail_screen.dart';

class ProductItem extends StatelessWidget {
  bool isAdmin;
  final Product product;
  ProductItem({super.key, this.isAdmin = false, required this.product,});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(5),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (ctx) => DetailsScreen(
              isAdmin: isAdmin,
              product: product,
            ),
          ),
        );
      },
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.grey.shade200,
            ),
            height: 220,
          ),
          Positioned(
            top: -40,
            left: 20,
            child: SizedBox(
              height: 130,
              width: 90,
              child: Image.asset(
                "assets/images_products/lamp.png",
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            right: 15,
            top: 5,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Icon(
                  Icons.star_rate_rounded,
                  color: Colors.amber,
                ),
                Text(
                  "${product.rating}",
                  style: const TextStyle(color: Colors.amber),
                ),
              ],
            ),
          ),
          Positioned(
            top: 100,
            left: 15,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 160,
                  child: Text(
                    product.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Text(product.name),
                const SizedBox(height: 5),
                Text(
                  "\$${product.price}",
                  style: const TextStyle(
                    fontSize: 20,
                    color: Colors.lightGreen,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
          ),
          Positioned(
            right: 15,
            bottom: 10,
            child: IconButton(
              onPressed: () {},
              icon: Icon(
                CupertinoIcons.heart_circle_fill,
                size: 35,
                color: Colors.grey[500],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
