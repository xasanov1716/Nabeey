import 'package:contest_app/blocs/categories_bloc/categories_bloc.dart';
import 'package:contest_app/blocs/categories_bloc/categories_event.dart';
import 'package:contest_app/blocs/categories_bloc/categories_state.dart';
import 'package:contest_app/data/models/category/category_model.dart';
import 'package:contest_app/ui/tab/app_routes.dart';
import 'package:contest_app/utils/colors.dart';
import 'package:contest_app/utils/icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          scrolledUnderElevation: 0,
          title: Text(
            "Lorem Ipsum",
            style: TextStyle(
                fontFamily: "Urbanist",
                fontSize: 24.sp,
                fontWeight: FontWeight.w700,
                color: AppColors.C_111111),
          ),
        ),
        body: BlocBuilder<CategoriesBloc, CategoriesState>(
          builder: (context, state) {
            return ListView(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Column(
                    children: [
                      ...List.generate(
                        state.categories.length,
                        (index) => ZoomTapAnimation(
                          onTap: () {
                            context.read<CategoriesBloc>().add(
                                SetCurrentCategory(
                                    categoryModel: state.categories[index]));
                            Navigator.pushNamed(context, RouteNames.categoryDetail);
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 10.h),
                            child: Stack(
                              children: [
                                Image.asset(AppIcons.image1),
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: height * (16 / 812),
                                      top: height * (118 / 812),
                                      right: width * (16 / 375)),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(state.categories[index].name,
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
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ));
  }
}
