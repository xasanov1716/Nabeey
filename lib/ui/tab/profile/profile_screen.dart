// ignore_for_file: unnecessary_null_comparison

import 'dart:io';
import 'package:contest_app/ui/tab/profile/profile_buttons.dart';
import 'package:contest_app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

import '../../../utils/icons.dart';
import '../../widgets/open_camera_gallery_dialog.dart';
import '../app_routes.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String? selectedImagePath;

  @override
  void initState() {
    super.initState();
    selectedImagePath != null;
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              selectedImagePath != null
                  ? Container(
                      height: 240.h,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(20),
                          bottomLeft: Radius.circular(20),
                        ),
                      ),
                      child: ClipRRect(
                        borderRadius: const BorderRadius.only(
                          bottomRight: Radius.circular(20),
                          bottomLeft: Radius.circular(20),
                        ),
                        child: Image.file(
                          File(selectedImagePath!),
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                    )
                  : Image.asset(
                      AppIcons.profileMan,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
              Padding(
                padding: EdgeInsets.only(
                  left: height * (20 / 812),
                  top: height * (171 / 812),
                  right: width * (16 / 375),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Profile",
                          style: TextStyle(
                            fontFamily: "Urbanist",
                            fontSize: 24,
                            fontWeight: FontWeight.w700,
                            color: AppColors.white,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          "Lorem ipsum",
                          style: TextStyle(
                            fontFamily: "Urbanist",
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: AppColors.white,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                    SizedBox(width: width * (31 / 375)),
                    ZoomTapAnimation(
                      onTap: () {
                        showCameraAndGalleryDialog(context, (imagePath) {
                          if (imagePath != null) {
                            setState(() {
                              selectedImagePath = imagePath;
                            });
                          }
                        });
                      },
                      child: SvgPicture.asset(AppIcons.camera),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0.w, vertical: 72.h),
            child: Column(
              children: [
                ProfileButton(
                  onTap: () {
                    Navigator.pushNamed(context, RouteNames.auth);
                  },
                  suffixIcon: AppIcons.nextArrow,
                  prefixIcon: AppIcons.edit,
                  text: 'Profilni tahrirlash',
                ),
                ProfileButton(
                  onTap: () {},
                  suffixIcon: AppIcons.nextArrow,
                  prefixIcon: AppIcons.send,
                  text: 'Maqola jo’natish',
                ),
                ProfileButton(
                  onTap: () {},
                  suffixIcon: AppIcons.nextArrow,
                  prefixIcon: AppIcons.cornerDownLeft,
                  text: 'Chiqish',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
