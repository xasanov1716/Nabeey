import 'package:contest_app/blocs/article_bloc/article_bloc.dart';
import 'package:contest_app/blocs/article_bloc/article_event.dart';
import 'package:contest_app/blocs/categories_bloc/categories_bloc.dart';
import 'package:contest_app/blocs/categories_bloc/categories_state.dart';
import 'package:contest_app/data/models/article/top_article_model.dart';
import 'package:contest_app/ui/tab/app_routes.dart';
import 'package:contest_app/ui/tab/home/sub_screens/articles/sub_screen/widgets/article_items_widget.dart';
import 'package:contest_app/utils/icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';
import '../../../../widgets/global_app_bar.dart';

class ArticlesScreen extends StatefulWidget {
  const ArticlesScreen({super.key});

  @override
  State<ArticlesScreen> createState() => _ArticlesScreenState();
}

class _ArticlesScreenState extends State<ArticlesScreen> {
  bool isPin = false;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: BlocBuilder<CategoriesBloc, CategoriesState>(
        builder: (context, state) {
          return GlobalAppBar(
            title: "Lorem Ipsum",
            subtitle: "Article",
            image: AppIcons.image2,
            onTap: (){
              Navigator.pushNamed(context, RouteNames.quizQuestionsScreen);
            },
            body: CustomScrollView(
              slivers: <Widget>[
                SliverToBoxAdapter(child: SizedBox(height: 20 * height / 812)),
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    childCount: state.categoryModel.articles.length,
                        (BuildContext context, int index) {
                      TopArticleModel article = state.categoryModel.articles[index];
                      return ZoomTapAnimation(
                        onTap: () {
                          context.read<ArticleBloc>().add(GetArticleByIdEvent(id: article.id));
                          Navigator.pushNamed(context, RouteNames.articleDetail);
                        },
                        child: ArticleItemsWidget(
                          title: "Maqola",
                          dateTime:
                          "${(DateTime.now()).toString().substring(8, 10)}.${(DateTime.now()).toString().substring(5, 7)}.${(DateTime.now()).toString().substring(0, 4)}",
                          views: "2696",
                          image: article.image.filePath,
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
