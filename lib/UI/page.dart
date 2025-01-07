
import 'package:flutter/material.dart';

import '../constants/constants.dart';
import '../provider/admin_provider.dart';
import 'parts/left_side.dart';
import 'parts/right_side.dart';
import 'widgets/CalculatedValueLabel.dart';
import 'widgets/InformationFeild.dart';
import 'widgets/news_control.dart';

class AdminPage extends StatefulWidget {
  @override
  State<AdminPage> createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {

  @override
  initState(){
    WidgetsBinding.instance.addPostFrameCallback((_){
      AdminProvider.get(context).init();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        child: Column(
          children: [
            Expanded(
              flex: 4,
              child: Row(
                children: [
                  Expanded(
                    child: LeftSide(),
                  ),
                  const SizedBox(width: 10),
                  Container(
                    width: 2,
                    color: kBluePrimaryColor
                  ),
                  const SizedBox(width: 10),

                  Expanded(
                    child: RightSide(),
                  )
                ],
              ),
            ),

            Container(
              color: kBluePrimaryColor,
              height: 2
            ),

            const SizedBox(height: 15),

            NewsControl()
            // SizedBox(
            //   height: 50,
            //   child: EventChanger(
            //     controller1: appProvider.speedController,
            //     controller2: appProvider.eventsController,
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
