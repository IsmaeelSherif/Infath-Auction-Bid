
import 'package:flutter/material.dart';
import 'package:infath_admin/ClientApp/Logic/client_provider.dart';
import 'package:infath_admin/ClientApp/UI/widgets/clipped_container.dart';
import 'package:infath_admin/ClientApp/UI/widgets/clipped_outlined_container.dart';
import 'package:infath_admin/ClientApp/UI/widgets/cyan_container.dart';
import 'package:infath_admin/ClientApp/UI/widgets/list_item.dart';
import 'package:infath_admin/UI/widgets/value_text.dart';
import 'package:infath_admin/constants/constants.dart';
import 'package:provider/provider.dart';

class MiddleSide extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Consumer<ClientProvider>(
      builder: (context, provider, child) {
        return  Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ClippedOutlineContainer(
                  width: 160,
                  color: const Color(0xff00a6a0),
                  child: ValueText(
                    text: provider.bidId,
                    fontSize: 26,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                CyanContainer(
                  width: 120,
                  height: 40,
                  fontSize: 14,
                  text: 'رقم المضرب',
                ),
              ],
            ),

            const SizedBox(height: 15),

            Column(
              children: [
                AppListItem(
                  label: 'مسمى العقار',
                  value: provider.assetName,
                ),

                const SizedBox(height: 15),

                AppListItem(
                  label: 'رقم العقار',
                  value: provider.assetNum,
                ),

                const SizedBox(height: 15),

                AppListItem(
                  label: 'المساحة',
                  value: provider.area,
                ),

                const SizedBox(height: 15),

                AppListItem(
                  label: 'سعر المتر',
                  value: provider.pricePerMeter,
                ),

                const SizedBox(height: 15),

                AppListItem(
                  label: 'أعلى مزايدة',
                  value: provider.highestBid,
                ),
              ],
            ),

            const SizedBox(height: 25),

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
                              provider.total,
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
                                ". " + provider.totalFraction,
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
          ],
        );
      },
    );
  }
}
