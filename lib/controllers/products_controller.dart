import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shopping_new/models/product.dart';
import 'package:shopping_new/models/products_category.dart';
import 'package:shopping_new/services/products_firebase_services.dart';

class ProductsController with ChangeNotifier {
  final _carsFirebaseService = ProductsFirebaseServices();

  final List<Product> _products = [];

  List<Product> get products {
    return [..._products];
  }

  Stream<QuerySnapshot> get list async* {
    yield* _carsFirebaseService.getProducts();
  }

  Future<void> addProduct(Map<String, dynamic> productJson, File? imageFile) async {
    await _carsFirebaseService.addProduct(productJson, imageFile);
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
    // Fetch products from Firestore
    _carsFirebaseService.getProducts().listen((snapshot) {
      _products.clear();
      print(snapshot.docs.length);
      for (var doc in snapshot.docs) {
        _products.add(Product.fromJson(doc));
      }
      // Update categories with products
      for (var category in _categories) {
        category.products.clear();
        for (var product in _products) {
          if (category.id == product.categoryId) {
            category.products.add(product);
          }
        }
      }
      notifyListeners();
    });
  }
}


// class ProductController extends ChangeNotifier {
//   final List<Product> _products = [
//     Product(
//       id: '1',
//       name: 'Modern Sofa',
//       title: 'Elegant Modern Sofa',
//       description:
//           'A comfortable and stylish modern sofa that fits perfectly in any living room.',
//       rating: 4.5,
//       price: 299.99,
//       categoryId: '1',
//       imageUrl: '',
//     ),
//     Product(
//       id: '2',
//       name: 'Coffee Table',
//       title: 'Wooden Coffee Table',
//       description: 'A classic wooden coffee table with a modern twist.',
//       rating: 4.0,
//       price: 149.99,
//       categoryId: '1',
//       imageUrl: '',
//     ),
//     Product(
//       id: '3',
//       name: 'King Size Bed',
//       title: 'Luxury King Size Bed',
//       description:
//           'A luxurious and comfortable king size bed for a good night\'s sleep.',
//       rating: 4.8,
//       price: 499.99,
//       categoryId: '2',
//       imageUrl: '',
//     ),
//     Product(
//       id: '4',
//       name: 'Nightstand',
//       title: 'Modern Nightstand',
//       description: 'A sleek and modern nightstand with ample storage.',
//       rating: 4.3,
//       price: 79.99,
//       categoryId: '2',
//       imageUrl: '',
//     ),
//   ];

//   List<Product> get products {
//     return [..._products];
//   }
// }


