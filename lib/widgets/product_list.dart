import 'package:flutter/material.dart';
import '../controllers/cashier_controller.dart';
import 'package:get/get.dart';

class ProductList extends StatelessWidget {
  final CashierController controller;

  ProductList({required this.controller});

  @override
  Widget build(BuildContext context) {
    return Obx(() => ListView.builder(
      itemCount: controller.productList.length,
      itemBuilder: (context, index) {
        final product = controller.productList[index];
        return ListTile(
          title: Text(product.name),
          subtitle: Text('\$${product.price}'),
        );
      },
    ));
  }
}
