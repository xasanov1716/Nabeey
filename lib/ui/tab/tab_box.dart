import 'package:contest_app/ui/tab/home/home_screen.dart';
import 'package:contest_app/ui/tab/profile/profile_screen.dart';
import 'package:contest_app/ui/tab/quiz/quiz_screen.dart';
import 'package:contest_app/ui/tab/rating/rating_screen.dart';
import 'package:contest_app/utils/colors.dart';
import 'package:contest_app/utils/icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TabBox extends StatefulWidget {
  const TabBox({super.key});

  @override
  State<TabBox> createState() => _TabBoxState();
}

class _TabBoxState extends State<TabBox> {
  List<Widget> screens = [];

  int currentIndex = 0;

  @override
  void initState() {
    screens = [
      const HomeScreen(),
      const QuizScreen(),
      const RatingScreen(),
      const ProfileScreen(),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: Container(
        height: height*(70/812),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(20), topLeft: Radius.circular(20)),
          boxShadow: [
            BoxShadow(color: Colors.grey, spreadRadius: 0, blurRadius: 10),
          ],
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            unselectedItemColor: Colors.black,
            selectedItemColor: AppColors.C_F59C16,
            unselectedIconTheme: IconThemeData(color: AppColors.black),
            selectedIconTheme: IconThemeData(color: AppColors.C_F59C16),

            items: [
              BottomNavigationBarItem(
                  icon: SvgPicture.asset(AppIcons.home), label: "Home"),
              BottomNavigationBarItem(
                  icon: SvgPicture.asset(AppIcons.quiz), label: "Quiz"),
              BottomNavigationBarItem(
                  icon: SvgPicture.asset(AppIcons.rating), label: "Rating"),
              BottomNavigationBarItem(
                  icon: SvgPicture.asset(AppIcons.profile), label: "Profile"),
            ],
            currentIndex: currentIndex,
            onTap: (index) {
              setState(() {
                currentIndex = index;
              });
            },
          ),
        ),
      ),
    );
  }
}