import 'package:cloud_firestore/cloud_firestore.dart';

class Product {
  String id;
  String name;
  String title;
  String description;
  num rating;
  num price;
  String? imageUrl;
  String categoryId;

  Product({
    required this.id,
    required this.name,
    required this.title,
    required this.description,
    required this.rating,
    required this.price,
    required this.imageUrl,
    required this.categoryId,
  });

  factory Product.fromJson(QueryDocumentSnapshot query) {
    return Product(
      id: query.id,
      name: query['name'] as String,
      title: query['title'] as String,
      description: query['description'] as String,
      rating: query['rating'] as num, // Directly casting to num
      price: query['price'] as num, // Directly casting to num
      imageUrl: query['imageUrl'] as String?,
      categoryId: query['categoryId'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'title': title,
      'description': description,
      'rating': rating,
      'price': price,
      'imageUrl': imageUrl,
      'categoryId': categoryId,
    };
  }
}
