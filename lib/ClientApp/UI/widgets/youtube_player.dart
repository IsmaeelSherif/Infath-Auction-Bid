
import 'package:flutter/material.dart';
import 'package:infath_admin/ClientApp/Logic/client_provider.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class _YTPlayer extends StatelessWidget {

  final YoutubePlayerController controller;

  _YTPlayer(this.controller);

  @override
  Widget build(BuildContext context) {
    return YoutubePlayer(
      controller: controller,
      showVideoProgressIndicator: true,
      bottomActions: [
        ProgressBar(
          isExpanded: true,
          controller: controller,
        ),

        const SizedBox(width: 8),
        Container(
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(10)
          ),
          padding: const EdgeInsets.symmetric(horizontal: 4),
          child: const Text(
            'Live',
            style: TextStyle(
              color: Colors.white
            )
          )
        )
      ],
      onReady: () {
        print('Video ready');
        controller.play();
      },
    );
  }
}


class YTPlayer extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final videoController = ClientProvider.listen(context, (p) => p.videoController);

    if(videoController != null){
      return _YTPlayer(videoController);
    }

    return AspectRatio(
      aspectRatio: 16/9,
      child: Container(
        color: const Color(0xff020525),
        child: const Center(
          child: Icon(
            Icons.videocam,
            color: Colors.white70,
            size: 70,
          ),
        ),
      ),
    );
  }
}
