import 'package:contest_app/utils/icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../../../../../utils/colors.dart';

class VideosListWidget extends StatelessWidget {
  const VideosListWidget({
    super.key,
    required this.images,
    required this.titles,
    required this.subtitles,
    required this.videosName,
    required this.onTap,
  });

  final List<String> images;
  final List<String> titles;
  final List<String> subtitles;
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
          height: height / 4,
          child: ListView(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            children: [
              SizedBox(width: width / 24),
              ...List.generate(images.length, (index) {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: width / 90),
                  child: Column(
                    children: [
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          Image.asset(images[index],
                              width: width / 3.5, height: height / 6),
                          SvgPicture.asset(AppIcons.play, width: width / 13)
                        ],
                      ),
                      SizedBox(
                        width: width / 3.5,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              titles[index],
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
                              subtitles[index],
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
