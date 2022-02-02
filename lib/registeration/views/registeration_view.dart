import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:noura_app/core/constant/my_colors.dart';
import 'package:noura_app/core/widget/button.dart';
import 'package:noura_app/core/widget/text_field.dart';
import 'package:noura_app/routes/app_pages.dart';

import '../controllers/registeration_controller.dart';

class registrationView extends GetView<registrationController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: GestureDetector(
        onTap: ()=>Get.focusScope!.unfocus(),
        child: SizedBox(
          height: Get.height,
          child: Container(
              height: Get.height,
              padding: EdgeInsets.fromLTRB(25, 50, 25, 25),
              child: Column(
                children: [
                  Flexible(
                    child: ListView(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              "Create New Account".tr,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  color: MyColors.iconColor,
                                  fontSize: 22,
                                  fontFamily: 'Bold'),
                            ),
                            Image.asset('assets/images/logo.jpeg',height: 100,width: 100,),
                          ],
                        ),

                        ///---------------name
                        const SizedBox(
                          height: 22,
                        ),
                        Obx(
                              () => MyTextField(
                                (val) {
                              controller.nameError.value = '';
                              Get.forceAppUpdate();
                            },
                            controller.nameController,
                            context,
                            "Type Full Name".tr,
                            title: "Full Name".tr,
                            error: controller.nameError.value,
                            canArabic: true,
                             focusNode: controller.nameNode,
                            validator: (value) {
                              if (value.isEmpty ||
                                  !RegExp(r'^[a-z A-Z]+$').hasMatch(value)) {
                                return 'Enter your correct name please'.tr;
                              } else {
                                return null;
                              }
                            },

                          ),
                        ),
                        const SizedBox(
                          height: 22,
                        ),
                        Obx(
                              () => MyTextField(
                                (val) {
                              controller.idError.value = '';
                            },
                            controller.idController,
                            context,

                            "Id Type".tr,
                            title: "Id".tr,
                            canArabic: false,
                            onlyNumber: true,
                                focusNode: controller.idNode,
                                validator: (value) {
                              if (value.isEmpty ||
                                  !RegExp(r'^[0-9]+$').hasMatch(value)) {
                                return 'Enter your correct Id please'.tr;
                              } else {
                                return null;
                              }
                            },
                            error: controller.idError.value,
                          ),
                        ),
                        const SizedBox(
                          height: 22,
                        ),

                        const SizedBox(
                          height: 22,
                        ),
                        Obx(() => MyTextField(
                              (val) {
                            controller.emailError.value = '';
                          },
                          controller.emailController,
                          context,
                          "Type Email".tr,
                          title: "E-mail".tr,
                          canArabic: true,
                          onlyNumber: false,
                          focusNode: controller.emailNode,
                          validator: (value) {
                            if (value.isEmpty ||
                                !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                    .hasMatch(value)) {
                              return 'Enter your correct Email please'.tr;
                            } else {
                              return null;
                            }
                          },
                          error: controller.emailError.value,
                        )),
                        const SizedBox(
                          height: 22,
                        ),
                        Obx(
                              () => MyTextField(
                                (val) {
                              controller.passwordError.value = '';
                            },
                            controller.passController,
                            context,
                            "Type password".tr,
                            title: "Password".tr,
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
                          ),
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        Obx(
                              () => MyTextField(
                                (val) {
                              controller.passwordError.value = '';
                            },
                            controller.conPassController,
                            context,
                            "Type Confirm password".tr,
                            title: "Confirm Password".tr,
                            focusNode: controller.passNode,
                            canArabic: true,
                            max:1,
                            preffix: IconButton(
                              icon: Icon(controller.secureText.value ? Icons.visibility_off : Icons.visibility),

                              onPressed: (){
                                controller.secureText.value = !controller.secureText.value;
                                controller.update();
                              },
                            ),


                            isPassword: controller.secureText.value,
                            validator: (value) {
                              if (value.isEmpty || value == null) {
                                return 'Please enter your confirm password'.tr;
                              }
                              return null;
                            },
                            error: controller.passwordError.value,
                          ),
                        ),

                        const SizedBox(
                          height: 20.0,
                        ),
                        Get.arguments[0]?
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                          Obx(()=>  DropdownButton<String>(
                              value: controller.reportType.value,
                              icon: const Icon(Icons.keyboard_arrow_down,
                                  color: Color(0xff20926B)),
                              focusColor: MyColors.primaryColor,
                              iconSize: 24,
                              elevation: 16,
                              style: TextStyle(color: MyColors.primaryColor),
                              underline: Container(),
                              onChanged: (newValue) {
                                controller.reportType.value = newValue!;
                              },
                              items: ['Father','Mother']
                                  .map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value.tr),
                                );
                              }).toList(),
                            )),
                          ],
                        ):
                        MyTextField(
                              (val) {
                            controller.idError.value = '';
                          },
                          controller.idController,
                          context,
                          "Type Experience Years".tr,
                          title: "Experience Years".tr,
                          canArabic: false,
                          onlyNumber: true,
                          focusNode: controller.idNode,
                          validator: (value) {
                            if (value.isEmpty ||
                                !RegExp(r'^[0-9]+$').hasMatch(value)) {
                              return 'Enter your Experience Years please'.tr;
                            } else {
                              return null;
                            }
                          },
                          error: controller.idError.value,
                        ),
                        if( Get.arguments[0]==false)
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                InkWell(
                                  child: Container(
                                    width: Get.width / 3.25,
                                    height: Get.width / 3.25,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                        BorderRadius.all(Radius.circular(16)),
                                        border: Border.all(
                                            color: MyColors.grayColor, width: 1)),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Image.asset('assets/images/logo.jpeg',
                                            height: 35, width: 35),
                                        const SizedBox(
                                          height: 8,
                                        ),
                                        Text(
                                         'Add Your CV'.tr,
                                          textAlign: TextAlign.center,
                                          maxLines: 2,
                                          style: TextStyle(
                                              fontFamily: 'Light',
                                              fontSize: 13,
                                              color: MyColors.primaryColor),
                                        )],
                                    ),
                                  ),
                                  onTap: () {
                                    controller.onChangeDoc();
                                  },
                                ),
                              ],
                            ),
                          ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Obx(() => MyButton.drawDesign(
                                    width: Get.width/2,
                                color: MyColors.buttonTextColor,
                                onPressed: controller.onTapButton,
                                widget: Container(
                                  child: Center(
                                      child: controller.isLoading.value
                                          ? const CircularProgressIndicator(
                                        color: Colors.white,
                                      )
                                          : Text(
                                        "Create Account".tr,
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontFamily: 'SemiBold',
                                            fontSize: 16),
                                      )),
                                ),
                              ),
                            ),
                          ],
                        ),
                      const SizedBox(height: 23),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Have Account".tr,
                                style: TextStyle(
                                    color: MyColors.iconColor,
                                    fontFamily: 'Light',
                                    fontSize: 13)),
                            const SizedBox(
                              width: 5,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(color: MyColors.createAccount))),
                              child: InkWell(
                                onTap: () => Get.toNamed(Routes.login),
                                child: Text(
                                  "Login".tr,
                                  style: TextStyle(
                                      color: MyColors.createAccount,
                                      fontFamily: 'Light',
                                      fontSize: 13),
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),

                  //SizedBox(height: 23),

                ],
              ),
            ),
        ),
      ),
    );
  }

}