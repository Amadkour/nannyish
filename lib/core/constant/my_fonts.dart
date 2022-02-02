import 'package:flutter/cupertino.dart';

import 'my_colors.dart';

class MyFonts {
  static final BAHIJ_FONT = "Bahij";

  ///---------------(font size)------------//
  static double smallFontSize = 12;
  static double titleFontSize = 22;
  static double labelFontSize = 14;
  static double buttonTextFontSized = 21;

  ///---------------(font Style)------------//
  static TextStyle percentageTextStyle1 = TextStyle(
      color: MyColors.primaryColor,
      fontSize: MyFonts.smallFontSize,
      fontFamily: MyFonts.BAHIJ_FONT);
  static TextStyle percentageTextStyle2 = TextStyle(
      color: MyColors.secondaryColor,
      fontSize: MyFonts.smallFontSize,
      fontFamily: MyFonts.BAHIJ_FONT);
  static TextStyle buttonTextStyle = TextStyle(
      color: MyColors.buttonTextColor,
      fontSize: MyFonts.buttonTextFontSized,
      fontFamily: MyFonts.BAHIJ_FONT);
  static TextStyle iconTextStyle=TextStyle(color: MyColors.iconColor, fontSize: MyFonts.smallFontSize,fontFamily: 'SemiBold');

}
