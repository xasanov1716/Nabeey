import 'package:audioplayers/audioplayers.dart';
import 'package:contest_app/blocs/categories_bloc/categories_bloc.dart';
import 'package:contest_app/blocs/categories_bloc/categories_state.dart';
import 'package:contest_app/ui/tab/home/sub_screens/audios/widgets/audio_list.dart';
import 'package:contest_app/ui/tab/home/sub_screens/audios/widgets/audio_player_item.dart';
import 'package:contest_app/utils/constants.dart';
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
  AudioPlayer player = AudioPlayer();
  bool isPlaying = false;
  int indexPlay = 0;
  bool visible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<CategoriesBloc, CategoriesState>(
        builder: (context, state) {
          state.categoryModel.audios.length;
          return GlobalAppBar(
            title: "Lorem Ipsum",
            subtitle: "Article",
            image: AppIcons.image2,
            onTap: () {},
            body: ListView(
              children: [
                SizedBox(height: 23.h),
                Visibility(
                  visible: visible,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: AudioPlayerItem(
                      isPlaying: isPlaying,
                      removeButton: () {
                        setState(() {
                          visible = false;
                          player.pause();

                        });
                      },
                      playButton: () {
                        if(mounted){
                          setState(() {
                            if (!isPlaying) {
                              isPlaying = true;
                              player.play(AssetSource(audiosData[indexPlay]));
                            } else {
                              isPlaying = false;
                              player.pause();
                            }
                          });
                        }
                      },
                      title: state.categoryModel.audios[indexPlay].title,
                      audioPath:
                          state.categoryModel.audios.first.audio.filePath,
                      player: player,
                      skipButton: () {
                        if(mounted){
                          setState(() {
                            player.stop();
                            isPlaying = false;
                            player.play(AssetSource(audiosData[
                            state.categoryModel.audios.length - 1 > indexPlay
                                ? ++indexPlay
                                : indexPlay]));
                            isPlaying = true;

                          });
                        }
                      },
                    ),
                  ),
                ),
                ...List.generate(state.categoryModel.audios.length, (index) {
                  return Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 20.w, vertical: 8.h),
                        child: AudioList(
                            title: state.categoryModel.audios[index].title,
                            onTap: () {
                              if(mounted){
                                setState(() {
                                  indexPlay = index;
                                  if(visible){
                                    player.pause();
                                  }
                                  visible = true;
                                  isPlaying = true;
                                  player.play(AssetSource(audiosData[index]));
                                });
                              }
                            }),
                      ),
                    ],
                  );
                })
              ],
            ),
          );
        },
      ),
    );
  }
}
