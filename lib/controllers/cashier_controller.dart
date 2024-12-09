import 'package:get/get.dart';
import '../models/product.dart';
import '../controllers/dashboard_controller.dart';

class CashierController extends GetxController {
  var productList = <Product>[].obs; // Daftar produk
  var totalPrice = 0.0.obs; // Total harga

  final DashboardController dashboardController = Get.find(); // Referensi ke DashboardController

  void addProduct(String name, double price) {
    // Menambahkan produk ke daftar
    productList.add(Product(name: name, price: price));
    calculateTotalPrice(); // Hitung ulang total harga
  }

  void calculateTotalPrice() {
    // Menghitung total harga
    totalPrice.value =
        productList.fold(0, (sum, item) => sum + item.price);
  }

  void completeTransaction() {
    if (productList.isNotEmpty) {
      // Kirim total harga ke DashboardController
      dashboardController.addTransaction(totalPrice.value);

      // Bersihkan transaksi
      productList.clear();
      totalPrice.value = 0.0;
    }
  }
}
