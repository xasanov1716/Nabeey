import 'package:contest_app/blocs/video_bloc/video_bloc.dart';
import 'package:contest_app/ui/tab/home/sub_screens/videos/sub_screens/video_detail/widgets/video_item.dart';
import 'package:contest_app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VideoDetailScreen extends StatefulWidget {
  const VideoDetailScreen({super.key});

  @override
  State<VideoDetailScreen> createState() => _VideoDetailScreenState();
}

class _VideoDetailScreenState extends State<VideoDetailScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Videolar", style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 24,
              color: AppColors.C_111111
          ),),
          leading: IconButton(
            onPressed: (){
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back),
          ),
        ),
        body: BlocBuilder<VideoBloc, VideoStates>(
          builder: (context, state){
            return ListView(
              children: [
                ...List.generate(state.videos.length, (index) => VideoItem(
                    videoModel: state.videos[index]
                ))
              ],
            );
          },
        )
    );
  }
}
