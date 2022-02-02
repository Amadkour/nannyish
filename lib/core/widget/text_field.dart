import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:noura_app/core/constant/my_colors.dart';


class MyTextField extends StatelessWidget {
  var onchange;
  var controller;
  var context;
  var name;
  var error;
  bool canArabic = false;
  Color labelColor=MyColors.iconColor;
  bool onlyNumber = false;
  int multiLine = 1;
  var title;
  var suffix;
  var preffix;
  bool fromEditProfile = false;
  bool fromAddCard = false;
  double borderWidth = 1.0;
  var border = 6.0;
  double height = 50;
  var validator;
   bool readOnly=false;

  var focusNode;

  bool isPassword;
var max;


  var keyboardType;
  MyTextField(
    this.onchange,
    this.controller,
    this.context,
    this.name, {
      this.multiLine=1 ,
    this.canArabic = false,
        this.labelColor=Colors.grey,
    this.onlyNumber = false,

    this.title,
    this.suffix,
    this.preffix,
    this.error,
    this.fromEditProfile = false,
    this.fromAddCard = false,
    this.borderWidth = 1.0,
    this.border = 6.0,
    this.height = 50,
        this.readOnly=false,
    this.validator, 
        this.focusNode,
      this.isPassword=false,
this.max,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (title != null)
          Text(
            title,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
                color: labelColor ,
                fontFamily: 'SemiBold',
                fontSize: 14),
          ),
        if (title != null && fromEditProfile==false && fromAddCard==false)
          SizedBox(
            height: 7,
          ),
        TextFormField(
          minLines: multiLine,

          maxLines: max,
          focusNode: focusNode,
          readOnly: readOnly,
          controller: controller,
          validator: validator,
          obscureText: isPassword,
         textInputAction: multiLine > 1 ? TextInputAction.newline : TextInputAction.next,
          keyboardType: onlyNumber ? TextInputType.number : TextInputType.name,
          keyboardAppearance: Get.theme.brightness,
          style: TextStyle(
            fontSize: 16,
            fontFamily: 'Light',
          ),
          textAlignVertical: TextAlignVertical.center,
          inputFormatters: <TextInputFormatter>[
            FilteringTextInputFormatter.deny(RegExp('[]'))

            // canArabic
            //     ? FilteringTextInputFormatter.deny(RegExp('[]'))
            //     : FilteringTextInputFormatter.allow(RegExp('[@.a-zA-Z0-9-() ]')),
          ],
          autovalidateMode: AutovalidateMode.onUserInteraction,
          enableSuggestions: true,
          textAlign: TextAlign.left,
          onChanged: onchange ?? (value) {},
          decoration: InputDecoration(
            errorText: error == '' ? null : error,
            errorStyle: const TextStyle(
              fontSize: 16,
            ),
            isDense: false,
            // contentPadding:
            //     EdgeInsets.symmetric(horizontal: 18),
            hintText: name,
            errorMaxLines: 2,
            hintMaxLines: 1,
            prefixIconConstraints: const BoxConstraints(maxWidth: 110, minHeight: 50),
            prefixIcon: preffix,
            suffixIcon: suffix,
            // alignLabelWithHint: true,
            hintStyle: TextStyle(
              color: MyColors.border,
              fontFamily: 'Light',
              fontSize: 16,
            ),
            border: fromEditProfile ||fromAddCard
                ? null
                : OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(border)),
                  ),
          ),
        ),
      ],
    );
  }
}
