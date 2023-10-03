import 'package:flutter/material.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';
import '../../../../../../utils/colors.dart';
import '../../../../../../utils/icons.dart';

class MainAppBar extends StatelessWidget {
  const MainAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Image.asset(AppIcons.image2, width: double.infinity),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20 * width / 375, vertical: 15 * width / 375),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              SizedBox(
                width: 200 * width / 375,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Lorem Ipsum",
                      style: TextStyle(
                        fontFamily: "Urbanist",
                        fontSize: 24 * width / 375,
                        fontWeight: FontWeight.w700,
                        color: AppColors.white,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      "It is a long established fact It is a long established fact",
                      style: TextStyle(
                          fontFamily: "Urbanist",
                          fontSize: 14 * width / 375,
                          fontWeight: FontWeight.w400,
                          color: AppColors.white),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              const Spacer(),
              ZoomTapAnimation(
                onTap: () {},
                child: Container(
                  height: 65 * height / 812,
                  width: 135 * width / 375,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(width / 5.5), color: AppColors.C_F59C16),
                  child: Center(
                    child: Text(
                      "Take the quiz",
                      style: TextStyle(
                        fontFamily: "Urbanist",
                        fontSize: 18 * width / 375,
                        fontWeight: FontWeight.w500,
                        color: AppColors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
