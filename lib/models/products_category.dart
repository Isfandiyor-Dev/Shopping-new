import 'package:shopping_new/models/product.dart';

class CategoryModel {
  final String id;
  final String name;
  final String? description;
  final String image;
  final List<Product> products;

  CategoryModel({
    required this.id,
    required this.name,
    required this.image,
    required this.products,
    this.description,
  });
}
