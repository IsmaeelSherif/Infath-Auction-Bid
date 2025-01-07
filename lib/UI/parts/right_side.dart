
import 'package:flutter/material.dart';
import 'package:infath_admin/ClientApp/UI/widgets/clipped_container.dart';
import 'package:infath_admin/UI/widgets/ConfirmationButton.dart';
import 'package:infath_admin/UI/widgets/InformationFeild.dart';
import 'package:infath_admin/UI/widgets/InputTextFeild.dart';
import 'package:infath_admin/UI/widgets/cyan_container.dart';
import 'package:infath_admin/UI/widgets/label_text.dart';
import 'package:infath_admin/UI/widgets/value_text.dart';
import 'package:infath_admin/constants/constants.dart';
import 'package:infath_admin/provider/admin_provider.dart';
import 'package:provider/provider.dart';

class RightSide extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<AdminProvider>(
        builder: (context, appProvider, child) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                children: [
                  SizedBox(
                    width: 100,
                    child: Column(
                      children: [
                        Container(
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: kBluePrimaryColor
                            ),
                            child: IconButton(
                              onPressed: appProvider.notifyElectronicBid,
                              icon: const Icon(
                                Icons.notifications_active,
                                color: Colors.white,
                              ),
                            )
                        ),
                        const SizedBox(height: 10),
                        SizedBox(
                          width: 100,
                          child: ConfirmationButton(
                            changeVarValue: appProvider.changeHighestBid,
                          ),
                        ),
                        const SizedBox(width: 30),
                      ]
                    )
                  ),
                  const SizedBox(width: 30),
                  Expanded(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                                child: InputTextfeild(controller: appProvider.bidIdController)
                            ),
                            SizedBox(
                              width: 150,
                              child: Center(
                                child: LabelText(
                                  text: 'رقم المضرب',
                                ),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(height: 30),
                        Row(
                          children: [
                            Expanded(
                                child: InputTextfeild(controller: appProvider.highestBidController)
                            ),
                            SizedBox(
                              width: 150,
                              child: Center(
                                child: LabelText(
                                  text: 'أعلي مزايدة',
                                ),
                              ),
                            )
                          ],
                        ),
                      ]
                    ),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 100,
                    child: ConfirmationButton(
                      label: "زيادة",
                      changeVarValue: appProvider.incrementBid,
                    ),
                  ),
                  const SizedBox(width: 30),
                  Expanded(
                      child: InputTextfeild(controller: appProvider.bidIncrementController)
                  ),
                  SizedBox(
                    width: 150,
                    child: Center(
                      child: LabelText(
                          text: 'المزايدة الثابتة'
                      ),
                    ),
                  )
                ],
              ),
              InformationFeild(
                  label: 'مسمي العقار',
                  buttonFunc: appProvider.changeAssetName,
                  controller: appProvider.assetNameController
              ),
              InformationFeild(
                  label: 'رقم العقار',
                  buttonFunc: appProvider.changeAssetNum,
                  controller: appProvider.assetNumController
              ),
              InformationFeild(
                  label: 'المساحة   (m2)',
                  buttonFunc: appProvider.changeArea,
                  controller: appProvider.areaController
              ),
              Row(
                  children: [
                    Expanded(
                        child: Center(
                          child: ValueText(
                              text: appProvider.meterPrice,
                              fontSize: 18,
                              fontWeight: FontWeight.w600
                          ),
                        )
                    ),
                    SizedBox(
                      width: 150,
                      child: Center(
                        child: LabelText(
                            text: 'سعر المتر'
                        ),
                      ),
                    )
                  ]
              ),
              Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Transform.translate(
                          offset: const Offset(0, 4),
                          child: LabelText(
                              text: '(أعلى مزايدة + قيمة السعي 2.5%)',
                              fontSize: 13
                          ),
                        ),
                        const SizedBox(width: 10),
                        LabelText(
                            text: 'المجموع',
                            fontSize: 20
                        ),
                      ],
                    ),
                    const SizedBox(height: 6),

                    Row(
                      children: [
                        Expanded(
                          child: SizedBox(
                            height: 60,
                            child: Stack(
                              fit: StackFit.expand,
                              children: [
                                CustomPaint(
                                  painter: ClippedContainr(
                                      color: kCyanPrimaryColor
                                  ),
                                ),

                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      appProvider.total,
                                      textAlign: TextAlign.end,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 28,
                                          fontFamily: 'LamaSans',
                                          fontWeight: FontWeight.w600
                                      ),
                                    ),
                                    const SizedBox(width: 2),
                                    Align(
                                      alignment: Alignment(0,0.25),
                                      child: Text(
                                        ". " + appProvider.totalFraction,
                                        textAlign: TextAlign.end,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 12,
                                            fontFamily: 'LamaSans',
                                            fontWeight: FontWeight.w600
                                        ),
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    )

                  ]
              )
            ],
          );
        }
    );

  }
}
