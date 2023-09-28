import 'package:audioplayers/audioplayers.dart';
import 'package:contest_app/utils/colors.dart';
import 'package:contest_app/utils/icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AudioPlayerItem extends StatefulWidget {
  const AudioPlayerItem({super.key});

  @override
  State<AudioPlayerItem> createState() => _AudioPlayerItemState();
}

class _AudioPlayerItemState extends State<AudioPlayerItem> {

  late AudioPlayer player;

  Duration duration = Duration.zero;
  Duration currentDuration = Duration.zero;
  late String songUrl;
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
                  SvgPicture.asset(AppIcons.remove)
                ],
              ),
              Slider(
                activeColor: AppColors.C_F59C16,
                inactiveColor: Colors.white30,
                value: currentDuration.inSeconds.toDouble(),
                max: duration.inSeconds.toDouble(),
                // max: duration.inSeconds.toDouble(),
                // divisions: 100,
                //label: _currentSliderValue.round().toString(),
                onChanged: (double value) async {
                  // print(value);
                  await player.seek(Duration(seconds: value.toInt()));
                  setState(() {});
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "00:35",
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
                    "1:35",
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
                  SvgPicture.asset(
                    AppIcons.subtract,
                  ),
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
