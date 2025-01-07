import 'package:flutter/material.dart';
import 'package:infath_admin/constants/constants.dart';

class ConfirmationButton extends StatelessWidget {
  final String label;

  final VoidCallback changeVarValue;
  ConfirmationButton({required this.changeVarValue, this.label = "تغيير"});
  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: const ButtonStyle(
        backgroundColor: WidgetStatePropertyAll(
            kBluePrimaryColor,
        ),
      ),
      onPressed: () {
        changeVarValue();
        },
      child: Text(
        label,
        style: const TextStyle(
          color: Colors.white,
          fontFamily: 'LamaSans',
        ),
      )  ,
    );
  }
}
