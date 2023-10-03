import 'package:contest_app/data/models/video_model/video_model.dart';
import 'package:contest_app/ui/tab/home/sub_screens/videos/sub_screens/all_videos/widgets/video_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../../../utils/colors.dart';

class VideosListWidget extends StatelessWidget {
  const VideosListWidget({
    super.key,
    required this.videos,
    required this.videosName,
    required this.onTap,
  });

  final List<VideoModel> videos;
  final String videosName;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width / 18),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                videosName,
                style: TextStyle(
                  color: AppColors.black,
                  fontSize: width / 18,
                  fontWeight: FontWeight.w700,
                  fontFamily: "Urbanist",
                ),
              ),
              TextButton(
                style: TextButton.styleFrom(
                  shape: const RoundedRectangleBorder(),
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                ),
                onPressed: onTap,
                child: Text(
                  "Barchasi",
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                    color: AppColors.C_F59C16,
                    fontSize: width / 24,
                    fontWeight: FontWeight.w700,
                    fontFamily: "Urbanist",
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: height / 4.2,
          child: ListView(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            children: [
              SizedBox(width: width / 24),
              ...List.generate(videos.length, (index) {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: width / 90),
                  child: Column(
                    children: [
                      //width: width / 3.5, height: height / 6
                      Container(
                          width: width / 3.6, height: height / 6,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.r)
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15.r),
                            child: VideoWidget(videoLink: videos[index].videoLink)),
                      ),
                      SizedBox(
                        width: width / 3.6,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              videos[index].title,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color: AppColors.black,
                                fontSize: width / 30,
                                fontWeight: FontWeight.w400,
                                fontFamily: "Urbanist",
                              ),
                            ),
                            Text(
                              videos[index].description,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color: AppColors.black.withOpacity(0.5),
                                fontSize: width / 36,
                                fontWeight: FontWeight.w400,
                                fontFamily: "Urbanist",
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              }),
            ],
          ),
        ),
      ],
    );
  }
}
