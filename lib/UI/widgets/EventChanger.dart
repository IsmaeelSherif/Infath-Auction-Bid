

import 'package:flutter/material.dart';

import 'ConfirmationButton.dart';
import 'InputTextFeild.dart';

class EventChanger extends StatelessWidget {
  final TextEditingController controller1 ;
  final TextEditingController controller2 ;
  EventChanger({required this.controller1,required this.controller2});
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ConfirmationButton(
          changeVarValue: (){},
        ),
        Expanded(
          flex: 1,
            child: InputTextfeild(
              controller:controller1 ,
              hintText: "السرعة",
            )
        ),
        SizedBox(
          width: 50,
        ),
        Expanded(
          flex: 3,
            child: Center(
              child: InputTextfeild(
                controller: controller2,
                hintText: "شريط الأحداث",
              ),
            )
        )
      ],
    );
  }
}
