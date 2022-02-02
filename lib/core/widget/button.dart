import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyButton{

  static drawDesign({onPressed, widget,text,
    context,onLongPress,color,
    padding=const EdgeInsets.all(5.0),
    width,height}) {
    return ConstrainedBox(
      constraints: BoxConstraints.tightFor(width: width??(Get.width / 1.5), height: height??50),
      child: ElevatedButton(
        style: ButtonStyle(
          padding: MaterialStateProperty.all(padding),
          elevation: MaterialStateProperty
              .resolveWith<double>(
                  (Set<MaterialState>
              states) {
                if (states.contains(
                  MaterialState.pressed,
                )) return 2;
                return 0.25;
              }),
          shadowColor:
          MaterialStateProperty.all(
              Color(0xff4c6A37)),
          alignment:
          AlignmentDirectional.center,
          shape: MaterialStateProperty
              .resolveWith<
              OutlinedBorder>(
                  (Set<MaterialState>
              states) {
                if (states.contains(
                  MaterialState.pressed,
                ))
                  return RoundedRectangleBorder(
                    borderRadius:
                    BorderRadius.circular(
                        5),
                  );
                return RoundedRectangleBorder(
                  borderRadius:
                  BorderRadius.circular(
                      23),
                );
              }),
        ),
          onPressed: onPressed,
          child: widget ??
              Container(
                child: Center(
                    child: Text(
                  text,
                  style: TextStyle(color: color??Colors.white,
                      fontFamily: 'SemiBold'
                      ,fontSize: 16),
                )),
              ),

      ),
    );
  }
}
