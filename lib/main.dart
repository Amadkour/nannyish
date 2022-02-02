import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:noura_app/routes/app_pages.dart';

import 'core/constant/my_colors.dart';
import 'core/constant/my_fonts.dart';

Future<void> main() async {


    runApp(GetMaterialApp(
      key: GlobalKey(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          primaryColor: MyColors.primaryColor,
          buttonColor: MyColors.primaryColor,
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ButtonStyle(
                textStyle: MaterialStateProperty.all(MyFonts.buttonTextStyle),
                backgroundColor:
                MaterialStateProperty.all(MyColors.primaryColor)),
          ),
          textTheme: const TextTheme(
              bodyText1: TextStyle(fontSize: 12, color: Color(0xff575756)))),
      title: "NouraApp",

      initialRoute:AppPages.INITIAL,
      getPages: AppPages.routes,
    ) );

}