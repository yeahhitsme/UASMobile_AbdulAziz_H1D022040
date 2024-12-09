import 'package:get/get.dart';

class DashboardController extends GetxController {
  var totalSales = 0.0.obs; // Total penjualan
  var totalTransactions = 0.obs; // Total transaksi

  void addTransaction(double transactionAmount) {
    totalSales.value += transactionAmount; // Tambahkan jumlah transaksi ke total penjualan
    totalTransactions.value++; // Tambahkan jumlah transaksi
  }
}
