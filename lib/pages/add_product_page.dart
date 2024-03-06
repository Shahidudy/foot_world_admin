import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:new_foot_admin/controller/home_controller.dart';
import 'package:new_foot_admin/custom_widgets/my_drop_down_btn.dart';

class AddProductPage extends StatelessWidget {
  const AddProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (ctrl) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Add Product'),
        ),
        body: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.all(10),
            width: double.maxFinite,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  "Add New Product",
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.indigoAccent),
                ),
                const SizedBox(
                  height: 10,
                ),
                textFieldMethod(
                    controllerValue: ctrl.productNameCtrl,
                    labelName: 'Product Name',
                    hintName: 'Enter Your Product Name',
                    maxiLines: 1),
                const SizedBox(
                  height: 10,
                ),
                textFieldMethod(
                    controllerValue: ctrl.productDescriptionCtrl,
                    labelName: 'Product Description',
                    hintName: 'Enter Your Product Description',
                    maxiLines: 4),
                const SizedBox(
                  height: 10,
                ),
                textFieldMethod(
                    controllerValue: ctrl.productImageCtrl,
                    labelName: 'Product Image URL',
                    hintName: 'Enter Image URL',
                    maxiLines: 1),
                const SizedBox(
                  height: 10,
                ),
                textFieldMethod(
                    controllerValue: ctrl.productPriceCtrl,
                    labelName: 'Product Price',
                    hintName: 'Enter Your Product Price',
                    maxiLines: 1),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Flexible(
                        child: MyDropDownBtn(
                      label: ctrl.category,
                      items: const ['Boots', 'Shoe', 'Heels', 'Beech Shoe'],
                      onSelected: (selectedValue) {
                        ctrl.category = selectedValue ?? 'General';
                        ctrl.update();
                      },
                    )),
                    Flexible(
                        child: MyDropDownBtn(
                      label: ctrl.brand,
                      items: const ['Adidas', 'Nike', 'BMW'],
                      onSelected: (selectedValue) {
                        ctrl.brand = selectedValue ?? 'Unbrand';
                        ctrl.update();
                      },
                    )),
                  ],
                ),
                const SizedBox(height: 10),
                // const Text("Is Offer ?"),
                // MyDropDownBtn(
                //   label: ctrl.offer.toString(),
                //   items: ['True', 'False'],
                //   onSelected: (selectedValue) {
                //     ctrl.offer =
                //         bool.tryParse(selectedValue ?? 'false') ?? false;
                //     ctrl.update();
                //     print(selectedValue);
                //   },
                // ),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.indigo,
                      foregroundColor: Colors.white),
                  onPressed: () {
                    ctrl.addProduct();
                  },
                  child: const Text('Add Product'),
                )
              ],
            ),
          ),
        ),
      );
    });
  }

  TextField textFieldMethod(
      {required TextEditingController controllerValue,
      required String labelName,
      required String hintName,
      required int maxiLines}) {
    return TextField(
      controller: controllerValue,
      maxLines: maxiLines,
      decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          label: Text(labelName),
          hintText: hintName),
    );
  }
}
