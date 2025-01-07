import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'ConfirmationButton.dart';
import 'InputTextFeild.dart';
import 'label_text.dart';


class InformationFeild extends StatelessWidget {

  final String label;
  final VoidCallback buttonFunc;
  final TextEditingController controller;
  InformationFeild({required this.label, required this.buttonFunc, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: 100,
          child: ConfirmationButton(
            changeVarValue: buttonFunc,
          ),
        ),
        const SizedBox(width: 30),
        Expanded(
          child: InputTextfeild(controller: controller)
        ),
        SizedBox(
          width: 150,
          child: Center(
            child: LabelText(
              text: label
            ),
          ),
        )
      ],
    );
  }
}
