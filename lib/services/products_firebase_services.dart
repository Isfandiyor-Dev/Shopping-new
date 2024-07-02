import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

class ProductsFirebaseServices {
  final _productsCollection = FirebaseFirestore.instance.collection("products");
  final _productsImageStorage = FirebaseStorage.instance;

  Stream<QuerySnapshot> getProducts() async* {
    yield* _productsCollection.snapshots();
  }

  Future<void> addProduct(Map<String, dynamic> productJson, File? image) async {
    final imageReference = _productsImageStorage
        .ref()
        .child("product")
        .child("images")
        .child("${productJson["id"]}.jpg");
    print(image);
    final uploadTask = imageReference.putFile(
      image!,
    );

    uploadTask.snapshotEvents.listen((status) {
      //? faylni yuklash holati
      // running - yuklanmoqda; success - yuklandi; error - xatolik
      print(status.state);

      //? faylni yuklash foizi
      double percentage = (status.bytesTransferred / image.lengthSync()) * 100;

      print("$percentage%");
    });

    await uploadTask.whenComplete(() async {
      final imageUrl = await imageReference.getDownloadURL();
      productJson["imageUrl"] = imageUrl;
      await _productsCollection.add(productJson);
    });

    // final ref = _productsImageStorage.refFromURL("asd"); //? rasm url'dan reference tayyorlash
    // ref.delete(); //? rasmni o'chirish
  }
}
