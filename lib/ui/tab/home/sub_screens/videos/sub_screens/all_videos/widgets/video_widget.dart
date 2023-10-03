import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoWidget extends StatefulWidget {
  const VideoWidget({super.key, required this.videoLink});
  final String videoLink;

  @override
  State<VideoWidget> createState() => _VideoWidgetState();
}

class _VideoWidgetState extends State<VideoWidget> {
  late YoutubePlayerController youtubePlayerController;

  @override
  void initState() {
    final videoId = YoutubePlayer.convertUrlToId(widget.videoLink);
    youtubePlayerController = YoutubePlayerController(
        initialVideoId: videoId!,
        flags: const YoutubePlayerFlags(
          autoPlay: false,
          showLiveFullscreenButton: false,
          mute: false,
          controlsVisibleAtStart: false,
          disableDragSeek: false,
          forceHD: false,
        ));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return YoutubePlayer(
      controller: youtubePlayerController,
      showVideoProgressIndicator: true,
      bottomActions: const [],
    );
  }
}
