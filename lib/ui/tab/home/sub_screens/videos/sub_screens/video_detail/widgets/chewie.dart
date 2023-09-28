import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';


class VideoItem extends StatefulWidget {
  const VideoItem({super.key, required this.videoPlayerController});
  final VideoPlayerController videoPlayerController;

  @override
  State<VideoItem> createState() => _VideoItemState();
}

class _VideoItemState extends State<VideoItem> {
  late ChewieController _chewieController;

  @override
  void initState() {
    super.initState();
    _chewieController = ChewieController(
      videoPlayerController: widget.videoPlayerController,
      aspectRatio: 320 / 215,
      cupertinoProgressColors: ChewieProgressColors(
        backgroundColor: Color(0xFFF59C16)
      ),
      errorBuilder: (context, errorMessage) {
        return Center(
          child: Text(errorMessage),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 250,
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Chewie(
              controller: _chewieController,
            ),
          ),
        ),
        const Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(children: [
            Text("12th, July 2022", style: TextStyle(color: Color(0xFF232323), fontWeight: FontWeight.w400, fontSize: 12),),
            SizedBox(width: 24,),
            Text("10.658 views", style: TextStyle(color: Color(0xFF232323), fontWeight: FontWeight.w400, fontSize: 12),),
          ],),
        ),
        const SizedBox(height: 8,),
        const Padding(padding: EdgeInsets.symmetric(horizontal: 20),
          child: Text("Ikrom Sharif va Abdukarim Mirzayev bilan suhbat", style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),),
        )
      ],
    );
  }

  @override
  void dispose() {
    super.dispose();
    widget.videoPlayerController.dispose();
    _chewieController.dispose();
  }
}
