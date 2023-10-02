import 'package:audioplayers/audioplayers.dart';
import 'package:contest_app/blocs/audios_bloc/audios_bloc.dart';
import 'package:contest_app/blocs/audios_bloc/audios_state.dart';
import 'package:contest_app/data/local/storage_repository/storage_repository.dart';
import 'package:contest_app/data/models/status/form_status.dart';
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
  final AudioPlayer player = AudioPlayer();

  int audioIndex = 0;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: BlocBuilder<AudiosBloc, AudiosStates>(
        builder: (context, state) {
          if (state.status == FormStatus.loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state.status == FormStatus.failure) {
            return Center(
              child: Text(state.statusText),
            );
          }

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
                            title: state.audio[audioIndex].title, onTap: () {}),
                      )
                    : Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                        child: AudioPlayerItem(
                          player: player,
                          title: state.audio[audioIndex].title,
                          audioPath: state.audio.first.audio.filePath,
                          index: audioIndex,
                          skipButton: (){
                            player.pause();
                            if(assetsAudios.length-1>=audioIndex){
                              audioIndex++;
                            }
                            player.play(AssetSource(assetsAudios[audioIndex]));
                          },
                        ),
                      ),
                ...List.generate(
                  state.audio.length,
                  (index) => Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
                    child: AudioList(
                        title: state.audio[index].title,
                        onTap: () {
                          setState(() {
                            player.pause();
                            audioIndex = index;
                            player.play(AssetSource(assetsAudios[index]));
                          });
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
