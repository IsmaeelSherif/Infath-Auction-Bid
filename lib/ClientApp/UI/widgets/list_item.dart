
import 'package:flutter/widgets.dart';

import 'blue_container.dart';
import 'cyan_container.dart';

class AppListItem extends StatelessWidget {
  final String label;
  final String value;

  AppListItem({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CyanContainer(
          width: 160,
          text: value,
        ),
        BlueContainer(
          width: 120,
          text: label,
        ),
      ],
    );
  }
}
