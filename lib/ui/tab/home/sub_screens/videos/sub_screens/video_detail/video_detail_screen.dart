import 'package:contest_app/ui/tab/home/sub_screens/videos/sub_screens/video_detail/widgets/chewie.dart';
import 'package:contest_app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoDetailScreen extends StatefulWidget {
  const VideoDetailScreen({super.key});

  @override
  State<VideoDetailScreen> createState() => _VideoDetailScreenState();
}

class _VideoDetailScreenState extends State<VideoDetailScreen> {
  final List<String> videoUrls = [
    "https://files.nevomusic.net/video/Klip/Jaloliddin%20Ahmadaliyev%20%20Ozim%20Mood%20video.mp4",
    "https://www.sample-videos.com/video123/mp4/720/big_buck_bunny_720p_10mb.mp4",
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: (){
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back),
          ),
        ),
        body: ListView(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              child: Text("Ikrom Sharif videolari", style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 24,
                  color: AppColors.C_111111
              ),),
            ),
            ...List.generate(videoUrls.length, (index) => VideoItem(
              videoPlayerController: VideoPlayerController.networkUrl(
                Uri.parse(videoUrls[index]),
              ),
            ))
          ],
        )
    );
  }
}
