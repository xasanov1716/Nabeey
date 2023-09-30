import 'package:contest_app/data/models/video_model/video_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';


class VideoItem extends StatefulWidget {
  const VideoItem({super.key, required this.videoModel});
  final VideoModel videoModel;
  @override
  State<VideoItem> createState() => _VideoItemState();
}

class _VideoItemState extends State<VideoItem> {
  late YoutubePlayerController youtubePlayerController;

  @override
  void initState() {
    final videoId = YoutubePlayer.convertUrlToId(widget.videoModel.videoLink);
    youtubePlayerController = YoutubePlayerController(
      initialVideoId: videoId!,
      flags: const YoutubePlayerFlags(
        autoPlay: false
      )
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 215.h,
          margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20.r),
            child: YoutubePlayer(
              controller: youtubePlayerController,
              showVideoProgressIndicator: true,
              bottomActions: [
                CurrentPosition(),
                ProgressBar(
                  isExpanded: true,
                  colors: ProgressBarColors(
                    playedColor: const Color(0xFFF59C16),
                    handleColor: const Color(0xFFF59C16),
                    backgroundColor: const Color(0xFFFFFFFF).withOpacity(0.5),
                  ),
                ),
                RemainingDuration(),
                FullScreenButton()
              ],
            )
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: const Row(children: [
            Text("12th, July 2022", style: TextStyle(color: Color(0xFF232323), fontWeight: FontWeight.w400, fontSize: 12),),
            SizedBox(width: 24,),
            Text("10.658 views", style: TextStyle(color: Color(0xFF232323), fontWeight: FontWeight.w400, fontSize: 12),),
          ],),
        ),
        SizedBox(height: 8.h,),
        Padding(padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Text(widget.videoModel.title,
            style: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.w600,
          ),),
        )
      ],
    );
  }

  @override
  void dispose() {
    super.dispose();
    youtubePlayerController.dispose();
  }
}
