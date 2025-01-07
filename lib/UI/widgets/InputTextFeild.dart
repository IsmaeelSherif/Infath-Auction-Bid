import 'package:flutter/material.dart';
import 'package:infath_admin/constants/constants.dart';

class InputTextfeild extends StatelessWidget {

  final TextEditingController controller;
  final String? hintText;
  InputTextfeild({this.hintText,required this.controller});


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: TextField(
        controller: controller,
        onChanged: (newValue){

        },
        textAlign: TextAlign.center,
        textAlignVertical: TextAlignVertical.center,
        style: TextStyle(
          color: kBluePrimaryColor,
        ),
        textDirection: TextDirection.rtl,
        decoration: InputDecoration(
          isDense: true,
          hintTextDirection: TextDirection.rtl,
          hintText: hintText,
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: kBluePrimaryColor
            ),
            borderRadius: BorderRadius.zero,
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: kBluePrimaryColor
            ),
            borderRadius: BorderRadius.zero,
          )
        ),
      ),
    );
  }
}
