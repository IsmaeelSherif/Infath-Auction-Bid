
part of 'admin_provider.dart';

extension OnPressed on AdminProvider {

  Future<void> sendImages(){
    return NetworkHelper.send(EventNames.changeImages, imageUrls);
  }


  String getVideoId(String url) {
    final parts = url.split('=');
    if (parts.length > 1) {
      return parts[1];
    } else {
      return "none"; // Handle cases where URL is not in expected format
    }
  }

  Future<void> changeLiveUrl() async {
    final val = liveUrlController.text;
    final id = getVideoId(val);
    if(id.isNotEmpty){
      return NetworkHelper.send(EventNames.changeLiveUrl, id);
    }
  }


  Future<void> changeCarouselSpeed() async {
    final val = carouselSpeedController.text;
    final carouselSpeed = int.parse(val);
    return NetworkHelper.send(EventNames.changeCarouselSpeed, carouselSpeed);
  }

  Future<void> changeNewsSpeed(){
    final val = newsSpeedController.text;
    final intVal = int.parse(val);
    return NetworkHelper.send(EventNames.changeNewsSpeed, intVal);
  }

  Future<void> changeNewsText(){
    final val = newsTextController.text;
    return NetworkHelper.send(EventNames.changeNewsText, val);
  }

  Future<void> changeBidName(){
    final val = bidNameController.text;
    return NetworkHelper.send(EventNames.changeBidName, val);
  }


  Future<void> changeAssetName() async {
    final val = assetNameController.text;
    return NetworkHelper.send(EventNames.changeAssetName, val);
  }

  Future<void> changeAssetNum() async {
    final val = assetNumController.text;
    return NetworkHelper.send(EventNames.changeAssetNum, val);
  }


  Future<void> changeArea() async {
    final val = areaController.text;
    final body = <String,dynamic>{
      'area': val,
    };

    final areaInt = parseNumber(val);

    final highestBidInt = parseNumber(lastHighestBid);

    if(areaInt != null && highestBidInt != null){
      double pricePerMeter = highestBidInt / areaInt;
      pricePerMeter = double.parse(pricePerMeter.toStringAsFixed(2));
      print("Calculated price per meter: $pricePerMeter");
      meterPrice = pricePerMeter.toString();

      notifyListeners();

      body['pricePerMeter'] = pricePerMeter;
    }

    if(areaInt != null){
      lastArea = val;
    }


    return NetworkHelper.send(EventNames.changeArea, body);
  }

  Future<void> incrementBid() async {
    final val = bidIncrementController.text;
    final bidIncrement = parseNumber(val);
    final highestBidInt = parseNumber(lastHighestBid);

    if(bidIncrement != null && highestBidInt != null){
      final sum = (highestBidInt + bidIncrement).toString();
      highestBidController.text = sum;
      return _applyHighestBid(sum);
    }
  }

  Future<void> notifyElectronicBid(){
    final val = highestBidController.text;
    return _applyHighestBid(val, notify: true);
  }

  Future<void> changeHighestBid() async {
    final val = highestBidController.text;
    return _applyHighestBid(val);
  }


  String extractDecimalPart(String numberString) {
    int decimalIndex = numberString.indexOf('.');
    return numberString.substring(decimalIndex + 1);
  }

  Future<void> _applyHighestBid(String val, {bool notify = false}) async {
    final body = <String,dynamic>{
      'bidId': bidIdController.text,
      'highestBid': val,
      'electronicBid': notify
    };

    lastHighestBid = val;

    final highestBidInt = parseNumber(val);
    print("Parsed highest bid: $highestBidInt");

    if(highestBidInt != null){
      final _total = double.parse((highestBidInt * 1.025).toStringAsFixed(2));
      print("Calculated total: $_total");

      final _totalInt = _total.floor();

      final precision = (_total - _totalInt).toStringAsFixed(2);
      totalFraction = extractDecimalPart(precision);
      body['totalFraction'] = totalFraction;

      total = formatNumber2(_totalInt);
      body['total'] = total;
      notifyListeners();
    }

    if(lastArea != -1 && highestBidInt != null){
      final area = parseNumber(lastArea);
      print("Parsed area: $area");

      if(area != null){
        double pricePerMeter = highestBidInt / area;
        pricePerMeter = double.parse(pricePerMeter.toStringAsFixed(2));
        print("Calculated price per meter: $pricePerMeter");
        meterPrice = pricePerMeter.toString();

        notifyListeners();

        body['pricePerMeter'] = pricePerMeter;
      }
    }

    return NetworkHelper.send(EventNames.changeHighestBidAndBidName, body);
  }


}