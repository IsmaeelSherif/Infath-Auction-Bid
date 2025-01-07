
import 'package:flutter/material.dart';
import 'package:infath_admin/ClientApp/Logic/client_provider.dart';

import 'sides/left_side.dart';
import 'sides/middle_side.dart';
import 'sides/right_side.dart';
import 'widgets/sliding_news.dart';
import 'widgets/timer.dart';

class ClientWindow extends StatefulWidget {
  @override
  State<ClientWindow> createState() => _ClientWindowState();
}

class _ClientWindowState extends State<ClientWindow> {

  @override
  initState(){
    WidgetsBinding.instance.addPostFrameCallback((_){
      ClientProvider.get(context).init();
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    print("Screen Dimens: $screenWidth/$screenHeight");

    const double contentWidth = 1070;
    final scale = screenWidth/contentWidth;


    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/background.jpeg"),
              fit: BoxFit.fill,
            )
          // gradient: LinearGradient(
          //     colors: [
          //       Color(0xff0288d1),
          //       kCyanPrimaryColor,
          //       kBluePrimaryColor
          //     ],
          //     begin: Alignment.topCenter,
          //     end: Alignment.bottomCenter,
          //     stops: [0.05, 0.7,1]
          // ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Stack(
            children: [
              TimerWidget(),
              Center(
                child: Transform.scale(
                  scale: scale,
                  child: SizedBox(
                    width: contentWidth,
                    child: Card(
                      shape: const RoundedRectangleBorder(),
                      elevation: 11,
                      surfaceTintColor: const Color(0xffD9D9E2),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: LeftSide(),
                                ),
                                const SizedBox(width: 20),
                                SizedBox(
                                  width: 300,
                                  child: MiddleSide(),
                                ),
                                const SizedBox(width: 20),
                                SizedBox(
                                  width: 350,
                                  child: RightSide(),
                                ),
                              ],
                            ),
                            const SizedBox(height: 30),

                            SizedBox(
                              height: 40,
                              child: SlidingNews(),
                            )
                          ]
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      )
    );
  }
}
