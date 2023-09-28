import 'package:contest_app/ui/tab/app_routes.dart';
import 'package:contest_app/ui/tab/home/sub_screens/articles/widgets/global_container.dart';
import 'package:contest_app/utils/colors.dart';
import 'package:contest_app/utils/icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class ArticlesScreen extends StatefulWidget {
  const ArticlesScreen({super.key});

  @override
  State<ArticlesScreen> createState() => _ArticlesScreenState();
}

class _ArticlesScreenState extends State<ArticlesScreen> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Column(
        children: [
          Stack(
            children: [
              Image.asset(AppIcons.image2, width: double.infinity),
              Padding(
                padding: EdgeInsets.only(
                    left: height * (20 / 812),
                    top: height * (171 / 812),
                    right: width * (16 / 375)),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Lorem Ipsum",
                            style: TextStyle(
                                fontFamily: "Urbanist",
                                fontSize: 24.sp,
                                fontWeight: FontWeight.w700,
                                color: AppColors.white),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis),
                        Text("It is a long established fact",
                            style: TextStyle(
                                fontFamily: "Urbanist",
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400,
                                color: AppColors.white),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis),
                      ],
                    ),
                    SizedBox(width: width * (31 / 375)),
                    ZoomTapAnimation(
                      onTap: () {},
                      child: Container(
                        width: width * (132 / 375),
                        height: height * (56 / 812),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(66.r),
                            color: AppColors.C_F59C16),
                        child: Center(
                          child: Text(
                            "Take the quiz",
                            style: TextStyle(
                                fontFamily: "Urbanist",
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w500,
                                color: AppColors.white),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: height * (32 / 812)),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Column(
              children: [
                Row(
                  children: [
                    const GlobalContainer(
                        image: AppIcons.articleBackground,
                        imageEdit: AppIcons.article,
                        text: "Article",
                        color: AppColors.C_F59C16,
                        textColor: AppColors.white),
                    SizedBox(width: width * (16 / 375)),
                    const GlobalContainer(
                        image: AppIcons.youtubeBackground,
                        imageEdit: AppIcons.youtube,
                        text: "Video",
                        color: AppColors.white,
                        textColor: AppColors.black),
                  ],
                ),
                SizedBox(height: height * (16 / 812)),
                Row(
                  children: [
                    GlobalContainer(
                        onTap: () {
                          Navigator.pushNamed(context, RouteNames.audioScreen);
                        },
                        image: AppIcons.audioBackground,
                        imageEdit: AppIcons.audio,
                        text: "Audio",
                        color: AppColors.white,
                        textColor: AppColors.black),
                    SizedBox(width: width * (16 / 375)),
                    const GlobalContainer(
                        image: AppIcons.bookBackground,
                        imageEdit: AppIcons.book,
                        text: "Book",
                        color: AppColors.white,
                        textColor: AppColors.black),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
