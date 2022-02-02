import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ForgotController extends GetxController {
  TextEditingController phoneNumberController = TextEditingController();
  RxString phoneNumberError = ''.obs;
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  Future<void> onTapButton() async {
    Get.focusScope!.unfocus();
  }
}
