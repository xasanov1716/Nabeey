import 'package:audioplayers/audioplayers.dart';
import 'package:contest_app/data/local/storage_repository/storage_repository.dart';
import 'package:contest_app/utils/colors.dart';
import 'package:contest_app/utils/icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

import '../../../../../../data/local/storage_repository/storage_repository.dart';

class AudioPlayerItem extends StatefulWidget {
  const AudioPlayerItem({super.key});

  @override
  State<AudioPlayerItem> createState() => _AudioPlayerItemState();
}

class _AudioPlayerItemState extends State<AudioPlayerItem> {

  final AudioPlayer player = AudioPlayer();

  Duration duration = Duration.zero;
  Duration currentDuration = Duration.zero;
  bool isPlaying = false;

  bool isCheck = false;


  _init() async {
    player.onDurationChanged.listen((Duration d) {
      setState(() {
        duration = d;
      });
    });

    player.onPlayerComplete.listen((event) {
      setState(() {
        isPlaying = false;
        duration = Duration.zero;
        currentDuration = Duration.zero;
      });
    });

    player.onPositionChanged.listen((Duration d) {
      currentDuration = d;
      setState(() {});
    });
  }

  @override
  void initState() {
  _init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.r),
          border: Border.all(color: AppColors.black.withOpacity(0.1)),
        ),
        child: Padding(
          padding:
              EdgeInsets.only(top: 6.h, left: 20.w, right: 20.w, bottom: 20.h),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Audio 1",
                    style: TextStyle(
                      fontFamily: "SF Pro Display",
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: AppColors.C_111111,
                    ),
                    textAlign: TextAlign.left,
                  ),
                  ZoomTapAnimation(onTap: (){
                    isCheck = true;
                    setState(() {

                    });
                    StorageRepository.putBool('check', isCheck);
                    debugPrint(StorageRepository.getBool('check').toString());
                  },child: SvgPicture.asset(AppIcons.remove))
                ],
              ),
              Slider(
                inactiveColor: Colors.black,
                value: currentDuration.inSeconds.toDouble(),
                max: duration.inSeconds.toDouble(),
                activeColor: AppColors.C_F59C16,
                onChanged: (double value) async {
                  await player.seek(Duration(seconds: value.toInt()));
                  setState(() {});
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '${currentDuration.inSeconds ~/ 60}: ${currentDuration.inSeconds % 60}',
                    style: TextStyle(
                      fontFamily: "SF Pro Display",
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xff111111).withOpacity(0.5),
                      height: 20 / 12,
                    ),
                    textAlign: TextAlign.left,
                  ),
                  Text(
                    '${duration.inSeconds ~/ 60}: ${duration.inSeconds % 60}',
                    style: TextStyle(
                      fontFamily: "SF Pro Display",
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xff111111).withOpacity(0.5),
                      height: 20 / 12,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ],
              ),
              SizedBox(height: 2.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    AppIcons.skipForward,
                    colorFilter: ColorFilter.mode(
                        AppColors.black.withOpacity(0.5), BlendMode.srcIn),
                  ),
                  SizedBox(width: 13.w),
                  ZoomTapAnimation(child: Icon(
                    isPlaying ? Icons.pause : Icons.play_arrow,
                    size: 50,
                  ),onTap: (){
                    setState(() {
                      if (!isPlaying) {
                        // context.read<AudioBloc>().add(StartedAudio(audioUrl: 'musics/susana.m4a'));
                        player.play(AssetSource('musics/susana.m4a'));
                        isPlaying = true;
                      } else {
                        // context.read<AudioBloc>().add(PauseAudio());
                        player.pause();
                        isPlaying = false;
                      }
                    });
                  },),
                  SizedBox(width: 13.w),
                  SvgPicture.asset(
                    AppIcons.skipForward1,
                  ),
                ],
              )
            ],
          ),
        ));
  }
}
