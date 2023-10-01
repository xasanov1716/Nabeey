import 'package:contest_app/blocs/audios_bloc/audios_bloc.dart';
import 'package:contest_app/blocs/audios_bloc/audios_state.dart';
import 'package:contest_app/data/local/storage_repository/storage_repository.dart';
import 'package:contest_app/data/models/status.dart';
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
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: BlocBuilder<AudiosBloc, AudiosStates>(
        builder: (context, state) {
          print(state.audio.length);
          if(state.status == FormStatus.loading){
            return const Center(child: CircularProgressIndicator(),);
          }
          if(state.status == FormStatus.failure){
            return Center(child: Text(state.errorText),);
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
                        child: AudioList(title: state.audio.first.title, onTap: () {}),
                      )
                    : Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                        child: const AudioPlayerItem(),
                      ),
                ...List.generate(
                  state.audio.length,
                  (index) => Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
                    child: AudioList(
                      title: state.audio[index].title,
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
