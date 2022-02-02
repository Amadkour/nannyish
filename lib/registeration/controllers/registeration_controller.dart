import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class registrationController extends GetxController {
  RxBool secureText = true.obs;
  final count = 0.obs;
  final agreeTerms = false.obs;
  TextEditingController nameController = TextEditingController();
  TextEditingController idController = TextEditingController();
  TextEditingController birthDateController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController conPassController = TextEditingController();

  final FocusNode nameNode = FocusNode();
  final FocusNode idNode = FocusNode();
  final FocusNode birthDateNode = FocusNode();
  final FocusNode phoneNode = FocusNode();
  final FocusNode emailNode = FocusNode();
  final FocusNode passNode = FocusNode();
  RxString reportType = 'Father'.obs;
  Future<void> onChangeDoc() async {
     await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['jpg', 'png', 'pdf'],
      );
  }
  RxString phoneNumberError = ''.obs;
  RxString passwordError = ''.obs;
  RxString emailError = ''.obs;
  RxString dataError = ''.obs;
  RxString idError = ''.obs;
  RxString nameError = ''.obs;

  final RxBool visable = false.obs;

  void showMore() {
    visable.value = !visable.value;
  }

  RxBool isLoading = false.obs;

  Future<void> onTapButton() async {
  Get.snackbar('Registration', 'Create Acount');
  }


}
