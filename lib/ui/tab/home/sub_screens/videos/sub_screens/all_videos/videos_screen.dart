import 'package:contest_app/blocs/categories_bloc/categories_bloc.dart';
import 'package:contest_app/blocs/categories_bloc/categories_state.dart';
import 'package:contest_app/ui/tab/app_routes.dart';
import 'package:contest_app/ui/tab/home/sub_screens/videos/sub_screens/all_videos/widgets/videos_list_widget.dart';
import 'package:contest_app/ui/widgets/global_app_bar.dart';
import 'package:contest_app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../../utils/icons.dart';

class VideosScreen extends StatefulWidget {
  const VideosScreen({super.key});

  @override
  State<VideosScreen> createState() => _VideosScreenState();
}

class _VideosScreenState extends State<VideosScreen> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.white,
      body: GlobalAppBar(
        title: "Lorem Ipsum",
        subtitle: "Video",
        image: AppIcons.image2,
        onTap: () {},
        body: BlocBuilder<CategoriesBloc, CategoriesState>(
          builder: (context, state){
            return ListView.separated(
              physics: const BouncingScrollPhysics(),
              itemCount: 1,
              separatorBuilder: (context, index) {
                return Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: width / 18),
                      child: Divider(color: AppColors.black.withOpacity(0.2)),
                    ),
                  ],
                );
              },
              itemBuilder: (BuildContext context, int index) {
                return VideosListWidget(
                  videos: state.categories[0].videos,
                  videosName: "Ustoz#${index + 1} videolari",
                  onTap: () {
                    Navigator.pushNamed(context, RouteNames.videoDetailScreen);
                  },
                );
              },
            );
          },
        ),
      ),
    );
  }
}
