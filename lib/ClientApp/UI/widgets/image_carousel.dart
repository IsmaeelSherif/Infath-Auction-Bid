
import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:infath_admin/ClientApp/Logic/client_provider.dart';
import 'package:infath_admin/constants/constants.dart';

class AppCarousel extends StatefulWidget {
  @override
  State<AppCarousel> createState() => _AppCarouselState();
}

class _AppCarouselState extends State<AppCarousel> {
  int _current = 0;

  @override
  Widget build(BuildContext context) {
    final urls = ClientProvider.listen(context, (p) => p.imageUrls);
    final carouselSpeed = ClientProvider.listen(context, (p) => p.carouselSpeed);
    final items = List.generate(urls.length, (index) {
      return Image.file(File(urls[index]), fit: BoxFit.contain);
    });

    Widget child;
    if(carouselSpeed < 0 || urls.isEmpty){
      child = const SizedBox(
          height: 200,
          child: Center(
            child: Icon(
              Icons.image,
              size: 40
            )
          )
      );
    }
    else {
      child = CarouselSlider(
        options: CarouselOptions(
          autoPlay: true,
          aspectRatio: 16/9,
          enlargeCenterPage: true,
          viewportFraction: 0.9,
          autoPlayInterval: Duration(milliseconds: 50 * carouselSpeed),
          onPageChanged: (index, reason) {
            setState(() {
              _current = index;
            });
          },
        ),
        items: items,
      );
    }

    return IgnorePointer(
      ignoring: true,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: kBluePrimaryColor
              ),
              borderRadius: BorderRadius.circular(10)
            ),
            padding: const EdgeInsets.all(4),
            child: child,
          ),

          const SizedBox(height: 10),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(items.length, (index) {
              final double opacity = _current == index ? 1 : 0.4;
              return Opacity(
                opacity: opacity,
                child: Container(
                  width: 10.0,
                  height: 10.0,
                  margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: kBluePrimaryColor
                  ),
                ),
              );
            })
          ),
        ],
      ),
    );
  }
}
