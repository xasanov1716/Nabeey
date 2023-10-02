import 'package:contest_app/blocs/article_bloc/article_bloc.dart';
import 'package:contest_app/blocs/article_bloc/article_state.dart';
import 'package:contest_app/data/models/status/form_status.dart';
import 'package:contest_app/utils/icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../../../utils/colors.dart';
import '../../../../../../utils/shimmers/article_detail_shimmer.dart';

class ArticleDetailScreen extends StatelessWidget {
  const ArticleDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(),
      body: BlocBuilder<ArticleBloc, ArticleState>(
        builder: (context, state) {
          if (state.status == FormStatus.loading) {
            return const Center(child: ArticleDetailShimmer());
          }
          if (state.status == FormStatus.failure) {
            return Center(child: Text(state.statusText));
          }
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: width / 18),
            child: ListView(
              physics: const BouncingScrollPhysics(),
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: width / 18),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(width / 18),
                    child: Image.asset(AppIcons.articleDetail, width: double.infinity,fit: BoxFit.cover),
                  ),
                ),
                Text(
                  state.articleModel.category.name,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: AppColors.black,
                    fontSize: width / 18,
                    fontWeight: FontWeight.w700,
                    fontFamily: "Urbanist",
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: height / 58),
                  child: Row(
                    children: [
                      SvgPicture.asset(AppIcons.calendar,
                          colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.5), BlendMode.srcIn)),
                      SizedBox(width: width / 72),
                      Text(
                        "${(DateTime.now()).toString().substring(8, 10)}.${(DateTime.now()).toString().substring(5, 7)}.${(DateTime.now()).toString().substring(0, 4)}",
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
                        "2679",
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
                Text(
                  state.articleModel.text,
                  style: TextStyle(
                    color: AppColors.black,
                    fontSize: width / 20,
                    fontWeight: FontWeight.w400,
                    // fontFamily: "Urbanist",
                  ),
                ),
                SizedBox(height: height / 58),
              ],
            ),
          );
        },
      ),
    );
  }
}
