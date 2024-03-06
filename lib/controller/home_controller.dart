import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_foot_admin/model/product/product.dart';
import 'package:new_foot_admin/pages/home_page.dart';

class HomeController extends GetxController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  late CollectionReference productCollection;

  TextEditingController productNameCtrl = TextEditingController();
  TextEditingController productPriceCtrl = TextEditingController();
  TextEditingController productDescriptionCtrl = TextEditingController();
  TextEditingController productImageCtrl = TextEditingController();

  String category = 'Category';
  String brand = 'Brand';
  bool offer = false;

  List<Product> products = [];

  @override
  void onInit() async {
    productCollection = firestore.collection('products');
    await fetchProducts();

    super.onInit();
  }

  addProduct() {
    try {
      DocumentReference doc = productCollection.doc();
      Product product = Product(
        id: doc.id,
        name: productNameCtrl.text,
        category: category,
        description: productDescriptionCtrl.text,
        price: double.tryParse(productPriceCtrl.text),
        brand: brand,
        image: productImageCtrl.text,
        // offer: offer,
      );

      final productJson = product.toJson();
      doc.set(productJson);
      Get.snackbar('Success', "Added New Product ", colorText: Colors.green);
      setAsDefault();
      Get.to(HomePage());
    } on Exception catch (e) {
      Get.snackbar('Error', e.toString(), colorText: Colors.red);

      // TODO
    }
  }

  fetchProducts() async {
    try {
      QuerySnapshot productSnapshot = await productCollection.get();
      final List<Product> retrievedProducts = productSnapshot.docs
          .map((doc) => Product.fromJson(doc.data() as Map<String, dynamic>))
          .toList();
      products.clear();
      products.assignAll(retrievedProducts);
      Get.snackbar('Sucess', 'Product fetched successfully',
          colorText: Colors.green);
    } on Exception catch (e) {
      Get.snackbar('Error', e.toString(), colorText: Colors.red);
      // TODO
    } finally {
      update();
    }
  }

  deleteProduct(String id) async {
    try {
      await productCollection.doc(id).delete();
      fetchProducts();
    } on Exception catch (e) {
      Get.snackbar('Error', e.toString());
      // TODO
    }
  }

  setAsDefault() {
    productNameCtrl.clear();
    productImageCtrl.clear();
    productPriceCtrl.clear();
    productDescriptionCtrl.clear();

    category = 'Category';
    brand = 'Brand';
    offer = false;
    update();
  }
}
