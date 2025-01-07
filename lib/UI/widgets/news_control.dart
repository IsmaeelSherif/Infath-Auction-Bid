import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:infath_admin/constants/constants.dart';
import 'package:infath_admin/provider/admin_provider.dart';
import 'ConfirmationButton.dart';
import 'InputTextFeild.dart';
import 'label_text.dart';


class NewsControl extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final appProvider = AdminProvider.get(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: 100,
          child: ConfirmationButton(
            changeVarValue: appProvider.changeNewsSpeed,
          ),
        ),
        const SizedBox(width: 30),
        SizedBox(
          width: 100,
            child: InputTextfeild(controller: appProvider.newsSpeedController)
        ),
        const SizedBox(width: 10),
        LabelText(
            text: 'السرعة'
        ),

        const SizedBox(
            width: 60,
        ),

        SizedBox(
          width: 100,
          child: ConfirmationButton(
            changeVarValue: appProvider.changeNewsText,
          ),
        ),
        const SizedBox(width: 30),
        Expanded(
          child: InputTextfeild(controller: appProvider.newsTextController)
        ),
        SizedBox(
          width: 150,
          child: Center(
            child: LabelText(
              text: 'شريط الأخبار'
            ),
          ),
        )
      ],
    );
  }
}
