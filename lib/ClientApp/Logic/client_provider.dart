
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:infath_admin/ClientApp/UI/sides/electronic_bid_notification.dart';
import 'package:infath_admin/constants/event_names.dart';
import 'package:infath_admin/firebase_map.dart';
import 'package:provider/provider.dart';
import 'package:window_manager_plus/window_manager_plus.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';



class ClientProvider extends ChangeNotifier with WindowListener {
  static ClientProvider get(BuildContext context){
    return Provider.of<ClientProvider>(context, listen: false);
  }

  static R listen<R>(BuildContext context, R Function(ClientProvider p) selector){
    return context.select<ClientProvider,R>(selector);
  }

  final BuildContext pageContext;
  final audioPlayer = AudioPlayer()..setReleaseMode(ReleaseMode.stop);

  ClientProvider(this.pageContext);

  List<String> imageUrls = [];

  YoutubePlayerController? videoController;

  String news = "";
  int newsSpeed = 100;
  int carouselSpeed = 100;

  String bidName = "";
  String bidId = "";
  String assetName = "";
  String assetNum = "";
  String area = "";
  String pricePerMeter = "";
  String highestBid = "";
  String total = "";
  String totalFraction = "";


  @override
  Future<dynamic> onEventFromWindow(String eventName, int fromWindowId, dynamic args) async {
    print('[Receiver] Event $eventName with arguments $args');
    final event = EventNames.values.byName(eventName);

    print('event $event');

    switch(event){
      case EventNames.changeLiveUrl:
        print('changeLiveUrl');
        _changeLiveUrl(args);
        break;
      case EventNames.changeCarouselSpeed:
        print('changeCarouselSpeed');
        _changeCarouselSpeed(args);
        break;
      case EventNames.changeNewsSpeed:
        print('changeNewsSpeed');
        _changeNewsSpeed(args);
        break;
      case EventNames.changeNewsText:
        print('changeNewsText');
        _changeNewsText(args);
        break;
      case EventNames.changeBidName:
        print('changeBidName');
        _changeBidName(args);
        break;
      case EventNames.changeAssetName:
        print('changeAssetName');
        _changeAssetName(args);
        break;
      case EventNames.changeAssetNum:
        print('changeAssetNum');
        _changeAssetNum(args);
        break;
      case EventNames.changeArea:
        print('changeArea');
        _changeArea(toMap(args)!);
        break;
      case EventNames.changeHighestBidAndBidName:
        print('changeHighestBidAndBidName');
        _changeHighestBidAndBidId(toMap(args)!);
        break;
      case EventNames.changeImages:
        imageUrls = List<String>.from(args);
        break;
    }

    notifyListeners();
    print('hop');
    return 'Hello $eventName from ${WindowManagerPlus.current}';
  }

  void _changeLiveUrl(String? liveVideoId){
    if(liveVideoId != null && liveVideoId != 'none'){
      bool reload = true;
      if(videoController != null){
        final lastLiveId = videoController!.initialVideoId;
        if(lastLiveId == liveVideoId){
          reload = false;
        }
      }

      if(reload){
        videoController?.reset();
        videoController = null;
        Future.delayed(const Duration(seconds: 2), (){
          videoController?.reset();
          videoController = YoutubePlayerController(
            initialVideoId: liveVideoId,
            flags: const YoutubePlayerFlags(
              autoPlay: true,
              mute: true,
              // isLive: true,
              enableCaption: false,
              showLiveFullscreenButton: false,
            ),
          );
          notifyListeners();
        });
      }

    }
    else {
      videoController?.reset();
      videoController = null;
    }
  }

  void _changeCarouselSpeed(speed){
    try{
      int newSpeed;
      if(speed is int){
        newSpeed = speed;
      }
      else {
        newSpeed = int.parse(speed);
      }

      if(newSpeed != carouselSpeed){
        carouselSpeed = -1;
        notifyListeners();

        WidgetsBinding.instance.addPostFrameCallback((_){
          carouselSpeed = newSpeed;
          notifyListeners();
        });
      }
    }
    catch(e){}
  }

  void _changeNewsSpeed(speed){
    try{
      int newSpeed;
      if(speed is int){
        newSpeed = speed;
      }
      else {
        newSpeed = int.parse(speed);
      }

      if(newSpeed != newsSpeed){
        final tempNews = news;
        news = "";

        WidgetsBinding.instance.addPostFrameCallback((_){
          news = tempNews;
          newsSpeed = newSpeed;
          notifyListeners();
        });
      }
    }
    catch(e){}
  }

  void _changeNewsText(text){
    news = string(text);
  }

  void _changeBidName(text){
    bidName = string(text);
  }

  void _changeAssetName(text){
    assetName = string(text);
  }

  void _changeAssetNum(text){
    assetNum = string(text);
  }

  void _changeArea(Map<String,dynamic> bidInfo){
    area = string(bidInfo['area']);
    pricePerMeter = string(bidInfo['pricePerMeter']);
  }

  void _changeHighestBidAndBidId(Map<String,dynamic> bidInfo){
    print('_changeHighestBidAndBidId ${bidInfo.runtimeType}');
    bidId = string(bidInfo['bidId']);
    print('bidId $bidId');
    pricePerMeter = string(bidInfo['pricePerMeter']);
    print('pricePerMeter $pricePerMeter');
    highestBid = string(bidInfo['highestBid']);
    print('highestBid $highestBid');
    total = string(bidInfo['total']);
    totalFraction = string(bidInfo['totalFraction']);
    print('total $total totalFraction $totalFraction');

    if(bidInfo['electronicBid']){
      _playNotification();
    }
  }

  void init(){
    WindowManagerPlus.current.addListener(this);
  }

  String string(val){
    if(val == null){
      return "";
    }
    else {
      return val.toString();
    }
  }


  void _playNotification() async {
    try {
      await audioPlayer.release();
      audioPlayer.play(AssetSource('audio/notify.wav'));
    }
    catch(e){}

    showDialog(
        context: pageContext,
        builder: (_) => ElectronicBidDialog(highestBid)
    );
  }

}