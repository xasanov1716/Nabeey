import 'package:contest_app/ui/tab/app_routes.dart';
import 'package:contest_app/ui/tab/home/sub_screens/videos/sub_screens/all_videos/widgets/main_bar_widget.dart';
import 'package:contest_app/ui/tab/home/sub_screens/videos/sub_screens/all_videos/widgets/videos_list_widget.dart';
import 'package:contest_app/utils/colors.dart';
import 'package:flutter/material.dart';
import '../../../../../../../utils/icons.dart';

class VideosScreen extends StatefulWidget {
  const VideosScreen({super.key});

  @override
  State<VideosScreen> createState() => _VideosScreenState();
}

List<String> images = [AppIcons.videoImg, AppIcons.videoImg, AppIcons.videoImg, AppIcons.videoImg, AppIcons.videoImg];
List<String> titles = [
  "It is a long establi...",
  "It is a long establi...",
  "It is a long establi...",
  "It is a long establi...",
  "It is a long establi..."
];
List<String> subtitles = ["Lorem ipsum", "Lorem ipsum", "Lorem ipsum", "Lorem ipsum", "Lorem ipsum"];

class _VideosScreenState extends State<VideosScreen> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Column(
        children: [
          MainBarWidget(
            image: AppIcons.image2,
            title: "Lorem Ipsum",
            subtitle: "Video",
            buttonText: "Take the quiz",
            onTab: () {},
          ),
          Expanded(
            child: ListView.separated(
              physics: const BouncingScrollPhysics(),
              itemCount: 4,
              separatorBuilder: (context, index) {
                return Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: width / 18),
                      child: Divider(color: AppColors.black.withOpacity(0.2)),
                    ),
                    SizedBox(height: height / 35),
                  ],
                );
              },
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  children: [
                    VideosListWidget(
                      images: images,
                      titles: titles,
                      subtitles: subtitles,
                      videosName: "Ustoz#${index+1} videolari",
                      onTap: () {
                        Navigator.pushNamed(context, RouteNames.videoDetailScreen);
                      },
                    ),
                    SizedBox(height: height / 28),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
