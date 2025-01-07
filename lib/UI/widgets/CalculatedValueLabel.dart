import 'package:flutter/cupertino.dart';
import 'TextLabel.dart';

class CalculatedValueLabel extends StatelessWidget {
  
  final String label;
  final String value;
  CalculatedValueLabel({required this.label,required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        TextLabel(value),
        TextLabel(label),
      ],
    );
  }
}
