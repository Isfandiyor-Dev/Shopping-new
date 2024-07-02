import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shopping_new/controllers/products_controller.dart';
import 'package:shopping_new/models/product.dart';
import 'dart:io';

import 'package:shopping_new/views/widgets/mu_text_field.dart';

class AddProductScreen extends StatefulWidget {
  const AddProductScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _AddProductScreenState createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  final _formKey = GlobalKey<FormState>();
  final ImagePicker _picker = ImagePicker();
  File? _firstColorImage;
  File? _secondColorImage;
  File? _thirdColorImage;

  final categoryIdController = TextEditingController();
  final descriptionController = TextEditingController();
  final nameController = TextEditingController();
  final priceController = TextEditingController();
  final ratingController = TextEditingController();
  final titleController = TextEditingController();

  Future<void> _pickImage(ImageSource source, int imageIndex) async {
    final pickedFile = await _picker.pickImage(source: source);
    setState(() {
      if (pickedFile != null) {
        switch (imageIndex) {
          case 1:
            _firstColorImage = File(pickedFile.path);
            break;
          case 2:
            _secondColorImage = File(pickedFile.path);
            break;
          case 3:
            _thirdColorImage = File(pickedFile.path);
            break;
        }
      }
    });
  }

  var productsController = ProductsController();

  void AddProductBtn() {
    if (_formKey.currentState!.validate()) {
      productsController.addProduct({
        'id': UniqueKey().toString(),
        'name': nameController.text,
        'title': titleController.text,
        'description': descriptionController.text,
        'rating': ratingController.text,
        'price': priceController.text,
        'categoryId': categoryIdController.text,
      }, _firstColorImage);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Product'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              const SizedBox(height: 20),
              MyTextField(
                labelText: "Category ID",
                validation: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Please enter a category ID';
                  }
                  return null;
                },
                textEditingController: categoryIdController,
              ),
              const SizedBox(height: 20),
              MyTextField(
                labelText: "Description",
                validation: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Please enter a description';
                  }
                  return null;
                },
                textEditingController: descriptionController,
              ),
              const SizedBox(height: 20),
              const Text(
                "First Image",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  height: 2,
                ),
              ),
              _buildImagePicker(1, _firstColorImage),
              const Divider(),
              const Text(
                "Second Image",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  height: 2,
                ),
              ),
              _buildImagePicker(2, _secondColorImage),
              const Divider(),
              const Text(
                "Third Image",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  height: 2,
                ),
              ),
              _buildImagePicker(3, _thirdColorImage),
              const SizedBox(height: 20),
              MyTextField(
                labelText: "Name",
                validation: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Please enter a name';
                  }
                  return null;
                },
                textEditingController: nameController,
              ),
              const SizedBox(height: 20),
              MyTextField(
                labelText: "Title",
                validation: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Please enter a title';
                  }
                  return null;
                },
                textEditingController: titleController,
              ),
              const SizedBox(height: 20),
              MyTextField(
                labelText: "Price",
                validation: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Please enter a price';
                  }
                  return null;
                },
                textEditingController: priceController,
              ),
              const SizedBox(height: 20),
              MyTextField(
                labelText: "Rating",
                validation: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Please enter a rating';
                  }
                  return null;
                },
                textEditingController: ratingController,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: AddProductBtn,
                child: const Text('Add Product'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildImagePicker(int index, File? imageFile) {
    return Row(
      children: [
        Container(
          margin: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.tertiary,
            borderRadius: BorderRadius.circular(10),
          ),
          clipBehavior: Clip.hardEdge,
          child: imageFile != null
              ? Image.file(
                  imageFile,
                  fit: BoxFit.cover,
                  height: 120,
                  width: 120,
                )
              : null,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            TextButton.icon(
              style: ButtonStyle(
                foregroundColor: WidgetStatePropertyAll(
                  Theme.of(context).colorScheme.tertiary,
                ),
              ),
              onPressed: () => _pickImage(ImageSource.camera, index),
              icon: const Icon(Icons.camera_alt),
              label: const Text("Camera"),
            ),
            TextButton.icon(
              style: ButtonStyle(
                foregroundColor: WidgetStatePropertyAll(
                  Theme.of(context).colorScheme.tertiary,
                ),
              ),
              onPressed: () => _pickImage(ImageSource.gallery, index),
              icon: const Icon(Icons.photo),
              label: const Text("Camera"),
            ),
          ],
        ),
      ],
    );
  }
}
