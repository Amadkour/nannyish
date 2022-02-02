import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:noura_app/core/constant/my_colors.dart';
import 'package:noura_app/core/widget/button.dart';
import 'package:noura_app/core/widget/text_field.dart';
import 'package:noura_app/routes/app_pages.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: ()=>Get.focusScope!.unfocus(),
        child: SizedBox(
          height: Get.height,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: ListView(
                children: [
                  SizedBox(
                    height: Get.height,
                    child: Column(
                      children: [
                        ///------------logo
                        SizedBox(
                          height:Get.height/3,
                          child: Align(
                            alignment: Alignment.center,
                            child: Image.asset('assets/images/logo.jpeg'),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Sign Up".tr,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  color: MyColors.iconColor,
                                  fontSize: 22,
                                  fontFamily: 'Bold'),
                            ),
                            const SizedBox(height: 19),
                            Obx(() => MyTextField(
                                  (val) {
                                    controller.phoneNumberError.value = '';
                                  },
                                  controller.phoneNumberController,
                                  context,
                                  "XXXXXXXXXXXXX",
                                  title: "Email".tr,
                                  labelColor: Color(0xff011E06),
                              focusNode: controller.phoneNode,
                                  // validator: (String value) {
                                  //   if (value.isEmpty) {
                                  //     return 'Please enter your Email'.tr;
                                  //   } else if (value.length < 8) {
                                  //     return 'Your Email should  be greater than 8 digits'
                                  //         .tr;
                                  //   } else {
                                  //     return null;
                                  //   }
                                  // },
                                  onlyNumber: true,
                                  canArabic: false,
                                  error:controller.phoneNumberError.value,
                                )),
                            const SizedBox(height: 22),
                            Obx(() => MyTextField(
                                  (val) {
                                    controller.passwordError.value = '';
                                  },
                                  controller.passwordController,
                                  context,

                                  "Type password".tr,
                                  title: "Password".tr,
                                  labelColor: Color(0xff011E06),
                              focusNode: controller.passNode,
                                  canArabic: true,
                              max:1,
                              preffix: IconButton(
                                icon: Icon(controller.secureText.value ? Icons.visibility_off : Icons.visibility),

                              onPressed: (){
                                  print('xxxxxxxxxxxxx');
                                controller.secureText.value = !controller.secureText.value;
                                controller.update();
                              },
                              ),


                          isPassword: controller.secureText.value,

                                  validator: (value) {
                                    if (value.isEmpty || value == null) {
                                      return 'Please enter your password'.tr;
                                    }
                                    return null;
                                  },
                                  error: controller.passwordError.value,
                                )
                            ),

                            SizedBox(height: 10),
                            InkWell(
                              onTap: () => Get.toNamed(Routes.forget),
                              child: Text(
                                "Forgot Pass".tr,
                                style: const TextStyle(
                                    color: Color(0xff011E06),
                                    fontFamily: 'Light',
                                    fontSize: 13),
                              ),
                            ),
                            SizedBox(height: 60),
                            Align(
                              alignment: Alignment.center,
                              child: Obx(
                                () =>
                                    MyButton.drawDesign(
                                  color: MyColors.buttonTextColor,
                                  onPressed: controller.onTapButton,
                                  widget: Container(
                                    child: Center(
                                        child: controller.isLoading.value
                                            ? const CircularProgressIndicator(
                                                color: Colors.white,
                                              ):Text(
                                          "Sign In".tr,
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontFamily: 'SemiBold',
                                              fontSize: 16),
                                        )),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 30),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Don't Have Account".tr,
                                  style: TextStyle(
                                      color: MyColors.iconColor,
                                      fontSize: 13,
                                      fontFamily: 'Light'),
                                ),
                                const SizedBox(width: 3),
                                Container(
                                  decoration: BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(
                                              color: MyColors.primaryColor))),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      InkWell(
                                        onTap: () => Get.toNamed(Routes.registration,arguments: [true]),
                                        child: Text(
                                          "Create Parent Account".tr,
                                          style: TextStyle(
                                              color: MyColors.primaryColor,
                                              fontFamily: 'Light',
                                              fontSize: 13),
                                        ),
                                      ),
                                      const SizedBox(width: 10,),
                                      InkWell(
                                        onTap: () => Get.toNamed(Routes.registration,arguments: [false]),
                                        child: Text(
                                          "Create Nani Account".tr,
                                          style: TextStyle(
                                              color: MyColors.primaryColor,
                                              fontFamily: 'Light',
                                              fontSize: 13),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
          ),
        ),
      ),
    );
  }
}
