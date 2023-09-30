import 'package:contest_app/utils/colors.dart';
import 'package:contest_app/utils/icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ArticleItemsWidget extends StatelessWidget {
  const ArticleItemsWidget({
    super.key,
    required this.title,
    required this.dateTime,
    required this.views,
    required this.image,
  });

  final String title;
  final String dateTime;
  final String views;
  final String image;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.only(bottom: 20 * height / 812),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20 * width / 375),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20 * width / 375), color: AppColors.C_E0E0E0),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(width / 18)),
              child: Image.asset(
                image,
                fit: BoxFit.cover,
                height: 154 * height / 812,
                width: double.infinity,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20 * width / 375, vertical: 12 * height / 812),
              child: Text(
                title,
                style: TextStyle(
                  color: AppColors.black,
                  fontSize: width / 20,
                  fontWeight: FontWeight.w700,
                  fontFamily: "Urbanist",
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20 * width / 375),
              child: Row(
                children: [
                  SvgPicture.asset(AppIcons.calendar,
                      colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.5), BlendMode.srcIn)),
                  SizedBox(width: width / 72),
                  Text(
                    dateTime,
                    style: TextStyle(
                      color: AppColors.black.withOpacity(0.5),
                      fontSize: width / 24,
                      fontWeight: FontWeight.w400,
                      fontFamily: "Urbanist",
                    ),
                  ),
                  SizedBox(width: width / 12),
                  SvgPicture.asset(AppIcons.eye,
                      colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.5), BlendMode.srcIn)),
                  SizedBox(width: width / 72),
                  Text(
                    views,
                    style: TextStyle(
                      color: AppColors.black.withOpacity(0.5),
                      fontSize: width / 24,
                      fontWeight: FontWeight.w400,
                      fontFamily: "Urbanist",
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20 * width / 375),
          ],
        ),
      ),
    );
  }
}
