import 'package:get/get.dart';

class LoginController extends GetxController {
  var username = ''.obs;
  var password = ''.obs;
  var errorMessage = ''.obs;

  void login() {
    if (username.value.isEmpty || password.value.isEmpty) {
      errorMessage.value = 'Username dan password tidak boleh kosong';
    } else if (username.value == 'admin' && password.value == 'admin') {
      Get.offAllNamed('/dashboard');
    } else {
      errorMessage.value = 'Login gagal, coba lagi!';
    }
  }
}