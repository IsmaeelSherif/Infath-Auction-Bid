
import 'package:flutter/material.dart';
import 'package:infath_admin/UI/widgets/InformationFeild.dart';
import 'package:infath_admin/UI/widgets/image_grid.dart';
import 'package:infath_admin/UI/widgets/label_text.dart';
import 'package:infath_admin/constants/constants.dart';
import 'package:infath_admin/provider/admin_provider.dart';

class LeftSide extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final appProvider = AdminProvider.get(context);

    return Column(
      children: [
        const SizedBox(height: 20),

        InformationFeild(
            label: 'عنوان المزاد',
            buttonFunc: appProvider.changeBidName,
            controller: appProvider.bidNameController
        ),

        const SizedBox(height: 40),

        InformationFeild(
            label: 'رابط البث المباشر',
            buttonFunc: appProvider.changeLiveUrl,
            controller: appProvider.liveUrlController
        ),

        const SizedBox(height: 40),

        LabelText(
          text: 'الصور المعروضة',
          fontSize: 20
        ),

        InformationFeild(
            label: 'سرعة العرض',
            buttonFunc: appProvider.changeCarouselSpeed,
            controller: appProvider.carouselSpeedController
        ),

        const SizedBox(height: 20),

        Expanded(
          child: Container(
            decoration: BoxDecoration(
                border: Border.all(
                    color: kBluePrimaryColor
                ),
                borderRadius: BorderRadius.circular(10)
            ),
            padding: const EdgeInsets.all(4),
            child: ImageGridView(),
          ),
        ),

        const SizedBox(height: 10),

        SizedBox(
          height: 50,
          width: 120,
          child: OutlinedButton(
            style: ButtonStyle(
              backgroundColor: WidgetStatePropertyAll(
                kBluePrimaryColor,
              ),
            ),
            onPressed: () {
              AdminProvider.get(context).pickImage();
            },
            child: Text(
              'إضافة صورة',
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'LamaSans',
              ),
            ),
          ),
        ),

        const SizedBox(height: 20)
      ]
    );
  }
}
