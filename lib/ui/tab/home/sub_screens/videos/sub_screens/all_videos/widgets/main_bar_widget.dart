import 'package:flutter/material.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';
import '../../../../../../../../utils/colors.dart';
import '../../../../../../../../utils/icons.dart';

class MainBarWidget extends StatefulWidget {
  const MainBarWidget({
    super.key,
    required this.image,
    required this.title,
    required this.subtitle,
    required this.buttonText,
    required this.onTab,
  });

  final String image;
  final String title;
  final String subtitle;
  final String buttonText;
  final VoidCallback onTab;

  @override
  State<MainBarWidget> createState() => _MainBarWidgetState();
}

class _MainBarWidgetState extends State<MainBarWidget> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        Image.asset(widget.image, width: double.infinity, fit: BoxFit.cover),
        Padding(
          padding: EdgeInsets.only(left: width / 18, top: height / 4.6, right: width / 18),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.title,
                    style: TextStyle(
                      fontFamily: "Urbanist",
                      fontSize: width / 15,
                      fontWeight: FontWeight.w700,
                      color: AppColors.white,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    widget.subtitle,
                    style: TextStyle(
                      fontFamily: "Urbanist",
                      fontSize: width / 25,
                      fontWeight: FontWeight.w400,
                      color: AppColors.white,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
              const Spacer(),
              ZoomTapAnimation(
                onTap: widget.onTab,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: width / 26, vertical: width / 20),
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(width / 5.5), color: AppColors.C_F59C16),
                  child: Center(
                    child: Text(
                      widget.buttonText,
                      style: TextStyle(
                        fontFamily: "Urbanist",
                        fontSize: width / 22,
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
