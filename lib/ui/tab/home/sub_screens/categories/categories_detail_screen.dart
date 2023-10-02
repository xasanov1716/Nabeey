import 'package:contest_app/blocs/article_bloc/article_bloc.dart';
import 'package:contest_app/blocs/article_bloc/article_event.dart';
import 'package:contest_app/ui/tab/home/sub_screens/categories/widgets/global_container.dart';
import 'package:contest_app/ui/tab/home/sub_screens/categories/widgets/main_app_bar.dart';
import 'package:contest_app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';
import '../../../../../utils/constants.dart';

class CategoriesDetailScreen extends StatefulWidget {
  const CategoriesDetailScreen({super.key});

  @override
  State<CategoriesDetailScreen> createState() => _CategoriesDetailScreenState();
}

class _CategoriesDetailScreenState extends State<CategoriesDetailScreen> {
  int selectedContainer = 0;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Column(
        children: [
          const MainAppBar(),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16 * width / 375),
              child: GridView(
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1.6,
                  crossAxisSpacing: 15 * width / 375,
                  mainAxisSpacing: 15 * width / 375,
                ),
                children: [
                  ...List.generate(
                    titles.length,
                    (index) => ZoomTapAnimation(
                      onTap: () {
                        Navigator.pushNamed(context, navigators[index]);
                        BlocProvider.of<ArticleBloc>(context).add(GetArticlesEvent());
                        setState(() {
                          selectedContainer = index + 1;
                        });
                      },
                      child: GlobalContainer(
                          iconColor: selectedContainer == index + 1 ? AppColors.white : AppColors.black,
                          imageBackground: backgrounds[index],
                          image: icons[index],
                          text: titles[index],
                          color: selectedContainer == index + 1 ? AppColors.C_F59C16 : AppColors.white,
                          textColor: selectedContainer == index + 1 ? AppColors.white : AppColors.black),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
