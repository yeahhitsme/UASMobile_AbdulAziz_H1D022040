import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/cashier_controller.dart';

class CashierPage extends StatelessWidget {
  final CashierController controller = Get.put(CashierController());

  final nameController = TextEditingController();
  final priceController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Kasir')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Input nama produk
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'Nama Produk'),
            ),
            // Input harga produk
            TextField(
              controller: priceController,
              decoration: InputDecoration(labelText: 'Harga Produk'),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 16),
            // Tombol Tambah
            ElevatedButton(
              onPressed: () {
                final name = nameController.text;
                final price = double.tryParse(priceController.text) ?? 0;

                if (name.isNotEmpty && price > 0) {
                  controller.addProduct(name, price);
                  nameController.clear();
                  priceController.clear();
                } else {
                  Get.snackbar(
                    'Kesalahan',
                    'Nama produk dan harga harus valid!',
                    snackPosition: SnackPosition.BOTTOM,
                  );
                }
              },
              child: Text('Tambah'),
            ),
            SizedBox(height: 16),
            // Total harga
            Obx(() => Text('Total Harga: Rp ${controller.totalPrice.value}')),
            Expanded(
              // Daftar produk
              child: Obx(() {
                return ListView.builder(
                  itemCount: controller.productList.length,
                  itemBuilder: (context, index) {
                    final product = controller.productList[index];
                    return ListTile(
                      title: Text(product.name),
                      subtitle: Text('Rp ${product.price}'),
                    );
                  },
                );
              }),
            ),
            // Tombol Selesaikan Transaksi
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                if (controller.productList.isEmpty) {
                  Get.snackbar(
                    'Kesalahan',
                    'Tidak ada produk dalam transaksi!',
                    snackPosition: SnackPosition.BOTTOM,
                  );
                } else {
                  controller.completeTransaction();
                  Get.snackbar(
                    'Berhasil',
                    'Transaksi berhasil diselesaikan!',
                    snackPosition: SnackPosition.BOTTOM,
                  );
                }
              },
              child: Text('Selesaikan Transaksi'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
