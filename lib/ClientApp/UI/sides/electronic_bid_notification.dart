
import 'package:flutter/material.dart';
import 'package:infath_admin/UI/widgets/label_text.dart';
import 'package:infath_admin/UI/widgets/value_text.dart';

class ElectronicBidDialog extends StatefulWidget {

  final String bid;

  ElectronicBidDialog(this.bid);

  @override
  State<ElectronicBidDialog> createState() => _ElectronicBidDialogState();
}

class _ElectronicBidDialogState extends State<ElectronicBidDialog> {

  @override
  initState(){
    Future.delayed(const Duration(seconds: 5), (){
      if(mounted){
        Navigator.pop(context);
      }
    });
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      elevation: 14,
      // backgroundColor: const Color(0x99000000),
      child: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Align(
          alignment: const Alignment(0, -0.5),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: 150,
                child: Image.asset('assets/images/tap_icon.png'),
              ),
              LabelText(
                text: 'مزايدة إلكترونية',
                fontSize: 68
              ),
              const SizedBox(height: 100),
              ValueText(
                  text: widget.bid,
                  fontSize: 68
              ),
            ],
          ),
        ),
      ),
    );
  }
}
