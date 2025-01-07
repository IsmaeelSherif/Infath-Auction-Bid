

import 'package:flutter/material.dart';
import 'package:infath_admin/ClientApp/Logic/client_provider.dart';
import 'package:infath_admin/constants/constants.dart';
import 'package:marquee/marquee.dart';

class SlidingNews extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final news = ClientProvider.listen(context, (p) => p.news);
    final speed = ClientProvider.listen(context, (p) => p.newsSpeed);

    final child = news.isEmpty ? Container() : Marquee(
      text: news + ' ',
      textDirection: TextDirection.rtl,
      style: const TextStyle(
          // fontWeight: FontWeight.bold,
          fontSize: 14,
          fontFamily: 'RuaqArabic',
          color: Colors.white
      ),
      scrollAxis: Axis.horizontal,
      crossAxisAlignment: CrossAxisAlignment.center,
      blankSpace: 500.0,
      velocity: speed.toDouble(),
    );

    return Container(
      decoration: BoxDecoration(
        color: kBluePrimaryColor,
        border: Border.all(
          color: kCyanPrimaryColor,
          width: 3
        ),
        borderRadius: BorderRadius.circular(4)
      ),
      child: child,
    );
  }
}
