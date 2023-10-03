import 'package:audioplayers/audioplayers.dart';
import 'package:contest_app/blocs/categories_bloc/categories_bloc.dart';
import 'package:contest_app/blocs/categories_bloc/categories_state.dart';
import 'package:contest_app/data/local/storage_repository/storage_repository.dart';
import 'package:contest_app/ui/tab/home/sub_screens/audios/widgets/audio_list.dart';
import 'package:contest_app/ui/tab/home/sub_screens/audios/widgets/audio_player_item.dart';
import 'package:contest_app/utils/icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../widgets/global_app_bar.dart';

class AudioScreen extends StatefulWidget {
  const AudioScreen({super.key});

  @override
  State<AudioScreen> createState() => _AudioScreenState();
}

class _AudioScreenState extends State<AudioScreen> {
  AudioPlayer player =  AudioPlayer();
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: BlocBuilder<CategoriesBloc, CategoriesState>(
        builder: (context, state) {
          return GlobalAppBar(
            title: "Lorem Ipsum",
            subtitle: "Article",
            image: AppIcons.image2,
            onTap: () {},
            body: ListView(
              children: [
                SizedBox(height: 23.h),
                StorageRepository.getBool('check')
                    ? Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 20.w, vertical: 8.h),
                        child: AudioList(
                          title: "Audio",
                          onTap: () {},
                        ),
                      )
                    : Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                        child: AudioPlayerItem(
                          title: "Audio",
                          audioPath: state.categoryModel.audios.first.audio.filePath, player: player, skipButton: () {  },
                        ),
                      ),
                ...List.generate(
                  state.categoryModel.audios.length,
                  (index) => Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
                    child: AudioList(
                        title: "Audio",
                        onTap: () {
                          setState(() {});
                          StorageRepository.putBool('check', false);
                          debugPrint(
                              StorageRepository.getBool('check').toString());
                        }),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
