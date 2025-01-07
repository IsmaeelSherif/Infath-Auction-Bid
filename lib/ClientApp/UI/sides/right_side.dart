
import 'package:flutter/material.dart';
import 'package:infath_admin/ClientApp/Logic/client_provider.dart';
import 'package:infath_admin/ClientApp/UI/widgets/blue_container.dart';
import 'package:infath_admin/ClientApp/UI/widgets/youtube_player.dart';
import 'package:infath_admin/UI/widgets/label_text.dart';

class RightSide extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bidName = ClientProvider.listen(context, (p) => p.bidName);

    return Column(
      children: [
        Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                LabelText(
                  text: 'مزاد',
                  fontSize: 14,
                  fontWeight: FontWeight.w600
                ),
                LabelText(
                    text: bidName,
                    fontSize: 14
                ),
              ],
            ),
            const SizedBox(width: 4),
            SizedBox(
              height: 30,
              child: Image.asset('assets/images/bid_logo.png'),
            ),
            const SizedBox(width: 10),
            SizedBox(
              height: 30,
              child: Image.asset('assets/images/safwat.png'),
            ),

            Expanded(
              child: Align(
                alignment: Alignment.centerRight,
                child: SizedBox(
                  height: 50,
                  child: Image.asset(
                      'assets/images/logo.jpeg'
                  ),
                ),
              ),
            ),
          ],
        ),

        const SizedBox(height: 20),

        YTPlayer(),

        const SizedBox(height: 20),

        Row(
          children: [
            Expanded(
              child: BlueContainer(
                text: 'المجموع (أعلى مزايدة + قيمة السعي 2.5%)',
                height: 40,
                fontSize: 12,
              ),
            ),
          ],
        )
      ],
    );
  }
}
