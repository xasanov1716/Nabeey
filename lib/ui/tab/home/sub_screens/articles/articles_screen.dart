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
  int selectedContainer = 0;

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
                    ZoomTapAnimation(
                      onTap: () {
                        setState(() {
                          selectedContainer = 1;
                        });
                      },
                      child: GlobalContainer(
                          iconColor: selectedContainer == 1
                              ? AppColors.white
                              : AppColors.black,
                          imageBackground: AppIcons.articleBackground,
                          image: AppIcons.article,
                          text: "Article",
                          color: selectedContainer == 1
                              ? AppColors.C_F59C16
                              : AppColors.white,
                          textColor: selectedContainer == 1
                              ? AppColors.white
                              : AppColors.black),
                    ),
                    SizedBox(width: width * (16 / 375)),
                    ZoomTapAnimation(
                      onTap: () {
                        setState(() {
                          selectedContainer = 2;
                        });
                        Navigator.pushNamed(context, RouteNames.videoScreen);
                      },
                      child: GlobalContainer(
                          iconColor: selectedContainer == 2
                              ? AppColors.white
                              : AppColors.black,
                          imageBackground: AppIcons.youtubeBackground,
                          image: AppIcons.youtube,
                          text: "Video",
                          color: selectedContainer == 2
                              ? AppColors.C_F59C16
                              : AppColors.white,
                          textColor: selectedContainer == 2
                              ? AppColors.white
                              : AppColors.black),
                    ),
                  ],
                ),
                SizedBox(height: height * (16 / 812)),
                Row(
                  children: [
                    ZoomTapAnimation(
                      onTap: () {
                        setState(() {
                          selectedContainer = 3;
                        });
                        Navigator.pushNamed(context, RouteNames.audioScreen);
                      },
                      child: GlobalContainer(
                          iconColor: selectedContainer == 3
                              ? AppColors.white
                              : AppColors.black,
                          imageBackground: AppIcons.audioBackground,
                          image: AppIcons.audio,
                          text: "Audio",
                          color: selectedContainer == 3
                              ? AppColors.C_F59C16
                              : AppColors.white,
                          textColor: selectedContainer == 3
                              ? AppColors.white
                              : AppColors.black),
                    ),
                    SizedBox(width: width * (16 / 375)),
                    ZoomTapAnimation(
                      onTap: () {
                        setState(() {
                          selectedContainer = 4;
                        });
                      },
                      child: GlobalContainer(
                          iconColor: selectedContainer == 4
                              ? AppColors.white
                              : AppColors.black,
                          imageBackground: AppIcons.bookBackground,
                          image: AppIcons.book,
                          text: "Book",
                          color: selectedContainer == 4
                              ? AppColors.C_F59C16
                              : AppColors.white,
                          textColor: selectedContainer == 4
                              ? AppColors.white
                              : AppColors.black),
                    ),
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
