import 'package:contest_app/ui/tab/home/home_screen.dart';
import 'package:contest_app/ui/tab/profile/not_registered.dart';
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
      // const ProfileScreen(),
      const NotRegistered(),
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
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
              topRight: Radius.circular(20), topLeft: Radius.circular(20)),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.shade300, spreadRadius: 0, blurRadius: 10),
          ],
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            selectedLabelStyle: const TextStyle(
              fontFamily: "SF Pro Display",
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Color(0xfff59c16),
              height: 17 / 14,
            ),
            unselectedLabelStyle: const TextStyle(
              fontFamily: "SF Pro Display",
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Color(0xff111111),
              height: 17 / 14,
            ),
            unselectedItemColor: Colors.black,
            selectedItemColor: AppColors.C_F59C16,
            unselectedIconTheme: const IconThemeData(color: AppColors.black),
            selectedIconTheme: const IconThemeData(color: AppColors.C_F59C16),
            items: [
              BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    AppIcons.home,
                    colorFilter: ColorFilter.mode(
                        currentIndex == 0 ? AppColors.C_F59C16 : Color(0xff111111),
                        BlendMode.srcIn),
                  ),
                  label: "Home"),
              BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    AppIcons.quiz,
                    colorFilter: ColorFilter.mode(
                        currentIndex == 1 ? AppColors.C_F59C16 : Color(0xff111111),
                        BlendMode.srcIn),
                  ),
                  label: "Quiz"),
              BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    AppIcons.rating,
                    colorFilter: ColorFilter.mode(
                        currentIndex == 2 ? AppColors.C_F59C16 : Color(0xff111111),
                        BlendMode.srcIn),
                  ),
                  label: "Rating"),
              BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    AppIcons.profile,
                    colorFilter: ColorFilter.mode(
                        currentIndex == 3 ? AppColors.C_F59C16 :Color(0xff111111),
                        BlendMode.srcIn),
                  ),
                  label: "Profile"),
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
