import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:noura_app/core/constant/my_colors.dart';
import 'package:noura_app/core/widget/button.dart';
import 'package:noura_app/core/widget/text_field.dart';
import '../controllers/forgot_controller.dart';

class ForgotView extends GetView<ForgotController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: ()=>Get.focusScope!.unfocus(),
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: Get.width * 0.05),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.center,
                child: Image.asset('assets/images/logo.jpeg'),
              ),
              SizedBox(height: Get.height * 0.09),

              SizedBox(height: 24),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: Get.width * 0.1),
                child: Text(
                  'forget'.tr,
                  style: TextStyle(fontSize: 20,
                      color: MyColors.iconColor.withOpacity(0.8),
                      fontFamily: 'SemiBold'
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Obx(() => MyTextField(
                    (val) {
                  controller.phoneNumberError.value = '';
                },
                controller.phoneNumberController,
                context,
                "XXXXXXXXXXXXX",
                title: "Email".tr,
                labelColor: const Color(0xff011E06),
                validator: (value) {
                  if (value!.isEmpty || value! == null) {
                    return 'Please enter your Email number'.tr;
                  } else if (value.length < 8) {
                    return 'Your Email should  be greater than 8 digits'
                        .tr;
                  } else {
                    return null;
                  }
                },
                onlyNumber: true,
                canArabic: false,
                error:controller.phoneNumberError.value,
              )),
              SizedBox(height:100),
              Obx(
                    () => MyButton.drawDesign(
                  color: MyColors.buttonTextColor,
                  onPressed: controller.onTapButton,
                  widget: Center(
                      child: controller.isLoading.value
                          ? const CircularProgressIndicator(
                        color: Colors.white,
                      ):Text(
                        "ConfirmButton".tr,
                        style: const TextStyle(
                            color: Colors.white,
                            fontFamily: 'SemiBold',
                            fontSize: 16),
                      )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
