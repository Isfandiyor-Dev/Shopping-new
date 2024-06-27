import 'package:flutter/material.dart';
import 'package:shopping_new/models/product.dart';
import 'package:shopping_new/models/products_category.dart';

class ProductsController extends ChangeNotifier {
  final List<Product> _products = [
    Product(
      id: '1',
      name: 'Modern Sofa',
      title: 'Elegant Modern Sofa',
      description:
          'A comfortable and stylish modern sofa that fits perfectly in any living room.',
      rating: 4.5,
      price: 299.99,
      firstColorImage: 'assets/images/sofa_red.png',
      secondColorImage: 'assets/images/sofa_blue.png',
      thirdColorImage: 'assets/images/sofa_gray.png',
      categoryId: '1',
    ),
    Product(
      id: '2',
      name: 'Coffee Table',
      title: 'Wooden Coffee Table',
      description: 'A classic wooden coffee table with a modern twist.',
      rating: 4.0,
      price: 149.99,
      firstColorImage: 'assets/images/coffee_table_oak.png',
      secondColorImage: 'assets/images/coffee_table_walnut.png',
      thirdColorImage: 'assets/images/coffee_table_maple.png',
      categoryId: '1',
    ),
    Product(
      id: '3',
      name: 'King Size Bed',
      title: 'Luxury King Size Bed',
      description:
          'A luxurious and comfortable king size bed for a good night\'s sleep.',
      rating: 4.8,
      price: 499.99,
      firstColorImage: 'assets/images/bed_white.png',
      secondColorImage: 'assets/images/bed_black.png',
      thirdColorImage: 'assets/images/bed_gray.png',
      categoryId: '2',
    ),
    Product(
      id: '4',
      name: 'Nightstand',
      title: 'Modern Nightstand',
      description: 'A sleek and modern nightstand with ample storage.',
      rating: 4.3,
      price: 79.99,
      firstColorImage: 'assets/images/nightstand_white.png',
      secondColorImage: 'assets/images/nightstand_black.png',
      thirdColorImage: 'assets/images/nightstand_brown.png',
      categoryId: '2',
    ),
  ];

  List<Product> get products {
    return [..._products];
  }

  final List<CategoryModel> _categories = [
    CategoryModel(
      id: '1',
      name: 'Living Room',
      image: "assets/categories/living_room.png",
      description: 'Furniture and decor items for the living room.',
      products: [],
    ),
    CategoryModel(
      id: '2',
      name: 'Bedroom',
      image: "assets/categories/bedroom.png",
      description: 'Furniture and decor items for the bedroom.',
      products: [],
    ),
  ];

  List<CategoryModel> get categories {
    return [..._categories];
  }

  void reloadCategory() {
    for (var category in _categories) {
      category.products.clear();
      for (var product in _products) {
        if (category.id == product.categoryId) {
          category.products.add(product);
        }
      }
    }
  }
}
