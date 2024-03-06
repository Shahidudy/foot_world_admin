import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_foot_admin/controller/home_controller.dart';
// import 'package:new_foot_admin/model/order/product_order.dart';
import 'package:new_foot_admin/pages/add_product_page.dart';
// import 'package:new_foot_admin/pages/my_order_page.dart';
import 'package:new_foot_admin/pages/order_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (ctrl) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 56, 87, 7),
          title: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Admin Home',
                    style: TextStyle(color: Colors.white),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const OrdersPage()),
                      );
                    },
                    child: Text(
                      'Orders',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'All Products',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
        body: ListView.builder(
            itemCount: ctrl.products.length,
            itemBuilder: (context, index) {
              return Material(
                elevation: 20,
                color: Color.fromARGB(255, 249, 253, 250),
                child: ListTile(
                  title: Text(ctrl.products[index].name ?? ''),
                  subtitle: Text((ctrl.products[index].price ?? 0).toString()),
                  leading: CircleAvatar(
                    backgroundImage:
                        NetworkImage(ctrl.products[index].image ?? ''),
                  ),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () {
                      ctrl.deleteProduct(ctrl.products[index].id ?? '');
                    },
                  ),
                ),
              );
            }),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.to(AddProductPage());
          },
          child: const Text('Add'),
        ),
      );
    });
  }
}
