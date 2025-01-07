import 'package:flutter/cupertino.dart';
import 'package:infath_admin/constants/constants.dart';

class TextLabel extends StatelessWidget {

  final String label;

  TextLabel(this.label);

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      textAlign: TextAlign.center,
      style: TextStyle(
          fontSize: 18,
          color: kBluePrimaryColor,
      ),
    );
  }
}
