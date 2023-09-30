import 'package:contest_app/data/local/storage_repository/storage_repository.dart';
import 'package:contest_app/ui/tab/home/sub_screens/audios/widgets/audio_list.dart';
import 'package:contest_app/ui/tab/home/sub_screens/audios/widgets/audio_player_item.dart';
import 'package:contest_app/utils/colors.dart';
import 'package:contest_app/utils/icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

import '../../../../../data/local/storage_repository/storage_repository.dart';
import '../../../../widgets/global_app_bar.dart';

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
      body: GlobalAppBar(
        title: "Lorem Ipsum",
        subtitle: "Article",
        image: AppIcons.image2,
        onTap: () {},
        body: ListView(
          children: [
            SizedBox(height: 23.h),
            StorageRepository.getBool('check')
                ? Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
                    child: AudioList(index: 1, onTap: () {}),
                  )
                : Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: const AudioPlayerItem(),
                  ),
            ...List.generate(
              4,
              (index) => Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
                child: AudioList(
                    index: index,
                    onTap: () {
                      setState(() {});
                      StorageRepository.putBool('check', false);
                      debugPrint(StorageRepository.getBool('check').toString());
                    }),
              ),
            )
          ],
        ),
      ),
    );
  }
}
