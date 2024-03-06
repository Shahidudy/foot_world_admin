import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:new_foot_admin/model/order/';
import 'package:new_foot_admin/controller/order_controller.dart';

class OrdersPage extends StatelessWidget {
  const OrdersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrderController>(builder: (ctrl) {
      return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('All orders'),
        ),
        body: ListView.builder(
            itemCount: ctrl.ordersArray.length,
            itemBuilder: (context, index) {
              return Material(
                elevation: 20,
                color: Color.fromARGB(255, 249, 253, 250),
                child: ListTile(
                  title: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(ctrl.ordersArray[index].name ?? ''),
                      Text(ctrl.ordersArray[index].address ?? ''),
                      Text(ctrl.ordersArray[index].phone ?? ''),
                    ],
                  ),
                  subtitle:
                      Text((ctrl.ordersArray[index].price ?? 0).toString()),
                  // leading: CircleAvatar(
                  //   backgroundImage:
                  //       NetworkImage(ctrl.ordersArray[index]. ?? ''),
                  // ),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () {
                      ctrl.deleteProduct(ctrl.ordersArray[index].id ?? '');
                      // ctrl.deleteProduct(ctrl.products[index].id ?? '');
                    },
                  ),
                ),
              );
            }),
      );
    });
  }
}
