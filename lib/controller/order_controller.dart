import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:new_foot_admin/pages/orders.dart';
import 'package:new_foot_admin/model/order/product_order.dart';

class OrderController extends GetxController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  late CollectionReference orderCollection;
  List<ProductOrder> ordersArray = [];

//   double orderPrice = 0;
//   String itemName = '';
//   String orderAddress = '';

  @override
  void onInit() async {
    orderCollection = firestore.collection('orders');
    await fetchOrders();
    super.onInit();
  }

  fetchOrders() async {
    try {
      QuerySnapshot orderSnapshot = await orderCollection.get();
      final List<ProductOrder> retrievedOrders = orderSnapshot.docs
          .map(
            (doc) => ProductOrder.fromJson(doc.data() as Map<String, dynamic>),
          )
          .toList();
      ordersArray.clear();
      ordersArray.assignAll(retrievedOrders);
      Get.snackbar('Sucess', 'Order fetched successfully',
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
      await orderCollection.doc(id).delete();
      fetchOrders();
    } on Exception catch (e) {
      Get.snackbar('Error', e.toString());
      // TODO
    }
  }
}
