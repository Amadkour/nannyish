import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  RxBool secureText = true.obs;
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  RxString phoneNumberError = ''.obs;
  RxString passwordError = ''.obs;
  RxBool isLoading = false.obs;

  final FocusNode phoneNode = FocusNode();
  final FocusNode passNode = FocusNode();


  Future<void> onTapButton() async {
    Get.focusScope!.unfocus();
}

}
