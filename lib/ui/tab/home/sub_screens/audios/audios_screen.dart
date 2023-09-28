import 'package:contest_app/blocs/audio_bloc/audio_bloc.dart';
import 'package:contest_app/local/storage_repository/storage_repository.dart';
import 'package:contest_app/ui/tab/home/sub_screens/audios/widgets/audio_list.dart';
import 'package:contest_app/ui/tab/home/sub_screens/audios/widgets/audio_player_item.dart';
import 'package:contest_app/utils/colors.dart';
import 'package:contest_app/utils/icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class AudioScreen extends StatefulWidget {
  const AudioScreen({super.key});

  @override
  State<AudioScreen> createState() => _AudioScreenState();
}

class _AudioScreenState extends State<AudioScreen> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: ListView(
        children: [
          Stack(
            children: [
              Image.asset(AppIcons.image2, width: double.infinity),
              Padding(
                padding: EdgeInsets.only(
                    left: height * (20 / 812),
                    top: height * (171 / 812),
                    right: width * (16 / 375)),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Lorem Ipsum",
                            style: TextStyle(
                                fontFamily: "Urbanist",
                                fontSize: 24.sp,
                                fontWeight: FontWeight.w700,
                                color: AppColors.white),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis),
                        Text("It is a long established fact",
                            style: TextStyle(
                                fontFamily: "Urbanist",
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400,
                                color: AppColors.white),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis),
                      ],
                    ),
                    SizedBox(width: width * (31 / 375)),
                    ZoomTapAnimation(
                      onTap: () {
                      },
                      child: Container(
                        width: width * (132 / 375),
                        height: height * (56 / 812),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(66.r),
                            color: AppColors.C_F59C16),
                        child: Center(
                          child: Text(
                            "Take the quiz",
                            style: TextStyle(
                                fontFamily: "Urbanist",
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w500,
                                color: AppColors.white),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 23.h),
         StorageRepository.getBool('check')?Padding(
            padding:  EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
            child: AudioList(index: 1, onTap: (){}),
          ):Padding(
           padding: EdgeInsets.symmetric(horizontal: 20.w),
           child: const AudioPlayerItem(),
         ),
          ...List.generate(
            4,
            (index) => Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
              child: AudioList(index: index, onTap: () {
                setState(() {

                });
                StorageRepository.putBool('check', false);
                debugPrint(StorageRepository.getBool('check').toString());
              }),
            ),
          )
        ],
      ),
    );
  }
}
