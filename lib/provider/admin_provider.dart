import 'dart:io';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:infath_admin/constants/event_names.dart';
import 'package:provider/provider.dart';

import 'network.dart';

part 'on_change_pressed.dart';


  class AdminProvider extends ChangeNotifier {
    static AdminProvider get(BuildContext context){
      return Provider.of<AdminProvider>(context, listen: false);
    }

    static R listen<R>(BuildContext context, R Function(AdminProvider p) selector){
      return context.select<AdminProvider,R>(selector);
    }

    dynamic lastHighestBid = null;
    dynamic lastArea = null;

    String meterPrice = "---";
    String total = "---";
    String totalFraction = "";

    final bidNameController =  TextEditingController();
    final bidIdController =  TextEditingController();
    final assetNameController = TextEditingController();
    final assetNumController = TextEditingController();
    final areaController = TextEditingController();
    final highestBidController = TextEditingController();
    final bidIncrementController = TextEditingController();

    final newsTextController = TextEditingController();
    final newsSpeedController = TextEditingController(text: '100');
    final carouselSpeedController = TextEditingController(text: '100');
    final liveUrlController =  TextEditingController();
    List<String> imageUrls = [];
    int imageNotifier = Random().nextInt(999999);
    int notificationNotifier = Random().nextInt(999999);


    void init() async {
    }

    String string(val){
      if(val == null){
        return "";
      }
      else {
        return val.toString();
      }
    }

    String formatNumber(double number) {
      String numberString = number.toStringAsFixed(2);
      String decimalPart = numberString.split('.')[1];
      String integerPart = numberString.split('.')[0];

      String formattedIntegerPart = '';
      int groupSize = 3;
      for (int i = integerPart.length - 1; i >= 0; i -= groupSize) {
        int endIndex = i + 1;
        int startIndex = i - groupSize + 1;
        if (startIndex < 0) {
          startIndex = 0;
        }
        String group = integerPart.substring(startIndex, endIndex);
        formattedIntegerPart = group + (formattedIntegerPart.isEmpty ? '' : ',') + formattedIntegerPart;
      }

      return formattedIntegerPart + '.' + decimalPart;
    }

    String formatNumber2(input){
      String val = "";
      final coinsString = input.toString();
      int counter = 0;
      for(int i = coinsString.length - 1; i >= 0; i--){
        if(counter == 3){
          val = ',' + val;
          counter = 0;
        }
        final char = coinsString[i];
        val = char + val;

        counter++;
      }

      return val;
    }

    void removeImage(int index) async {
      imageUrls.removeAt(index);
      imageNotifier++;
      notifyListeners();
      sendImages();
    }

    void pickImage() async {
      final ImagePicker picker = ImagePicker();
      final List<XFile> images = await picker.pickMultiImage();
      for(final image in images){
        var imageFile = File(image.path);
        print("imageFile.path ${imageFile.path} image.path ${image.path}");
        imageUrls.add(image.path);
        imageNotifier++;
        notifyListeners();
      }

      sendImages();
    }



    int? parseNumber(dynamic value) {
      try{
        if (value is int) {
          return value;
        } else if (value is String) {
          // Remove commas and parse as an integer
          return int.parse(value.replaceAll(',', ''));
        }
      }
      catch(e){}
      return null;
    }



  }