import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopping_new/models/product.dart';

// ignore: must_be_immutable
class DetailsScreen extends StatefulWidget {
  Product product;
  DetailsScreen({super.key, required this.product});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  List<Color> colors = [
    Colors.orange,
    Colors.blueGrey,
    Colors.black,
  ];

  int currentColor = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.share),
            color: Colors.lightGreen,
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                    width: 200,
                    height: 300,
                    child: Image.asset(
                      "assets/images_products/lamp.png",
                      fit: BoxFit.cover,
                    )),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const Text("Lamp"),
                    const SizedBox(
                      width: 160,
                      child: Text(
                        "Table Desk Lamp Light",
                        textAlign: TextAlign.end,
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                    const Text("Price"),
                    const Text(
                      "\$140.00",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Colors.lightGreen,
                      ),
                    ),
                    const SizedBox(height: 30),
                    const Text("Choose Colors"),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                          width: colors.length * 50,
                          height: 50,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: colors.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.all(5),
                                child: InkWell(
                                  borderRadius: BorderRadius.circular(10),
                                  onTap: () {
                                    setState(() {
                                      currentColor = index;
                                    });
                                  },
                                  child: Ink(
                                    width: 40,
                                    height: 40,
                                    decoration: BoxDecoration(
                                      color: colors[index],
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Center(
                                      child: currentColor == index
                                          ? const Icon(
                                              CupertinoIcons.checkmark_alt,
                                              color: Colors.white,
                                            )
                                          : null,
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    ...List.generate(
                      5,
                      (index) {
                        return Icon(
                          Icons.star_rate_rounded,
                          color: index <= widget.product.rating - 1
                              ? Colors.amber
                              : Colors.grey[600],
                        );
                      },
                    ),
                    const SizedBox(width: 10),
                    Text(
                      "${widget.product.rating}",
                      style: const TextStyle(
                        color: Colors.amber,
                        fontSize: 18,
                      ),
                    )
                  ],
                ),
                TextButton(
                  onPressed: () {},
                  child: const Row(
                    children: [
                      Text("124 reviews"),
                      Icon(Icons.navigate_next_rounded),
                    ],
                  ),
                )
              ],
            ),
            const Text("About Products"),
            Text(widget.product.description),
          ],
        ),
      ),
    );
  }
}
