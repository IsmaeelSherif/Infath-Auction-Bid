class FeildsData {
  late final String? bidName;
  late final String? bidId;
  late final String? assetName;
  late final String? assetNum;
  late final String? area;
  late final String? pricePerMeter;
  late final String? highestBid;
  late final String? total;


  FeildsData.fromJson(Map<String,dynamic> json){
    bidName = json['bidName'];
    bidId = json['bidId'];
    assetName = json['assetName'];
    assetNum = json['assetNum'];
    area = json['area'];
    pricePerMeter = json['pricePerMeter'];
    highestBid = json['highestBid'];
    total = json['total'];
  }
}