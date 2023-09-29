import 'package:contest_app/blocs/article_bloc/article_bloc.dart';
import 'package:contest_app/blocs/article_bloc/article_event.dart';
import 'package:contest_app/blocs/article_bloc/article_state.dart';
import 'package:contest_app/data/models/article/article_model.dart';
import 'package:contest_app/data/models/status.dart';
import 'package:contest_app/ui/tab/app_routes.dart';
import 'package:contest_app/ui/tab/home/sub_screens/articles/sub_screen/widgets/article_items_widget.dart';
import 'package:contest_app/ui/tab/home/sub_screens/videos/sub_screens/all_videos/widgets/main_bar_widget.dart';
import 'package:contest_app/utils/icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class ArticlesScreen extends StatelessWidget {
  const ArticlesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<ArticleBloc, ArticleState>(
        builder: (context, state) {
          if (state.status == FormStatus.failure) {
            return Center(
              child: Text(state.statusText),
            );
          }
          if (state.status == FormStatus.loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return Column(
            children: [
              MainBarWidget(
                image: AppIcons.image2,
                title: "Lorem Ipsum",
                subtitle: "Article",
                buttonText: "Take the quiz",
                onTab: () {},
              ),
              Expanded(
                child: ListView(
                  physics: const BouncingScrollPhysics(),
                  children: [
                    ...List.generate(state.articles.length, (index) {
                      ArticleModel article = state.articles[index];
                      return ZoomTapAnimation(
                        onTap: () {
                          context.read<ArticleBloc>().add(GetArticleByIdEvent(id: article.id));
                          Navigator.pushNamed(context, RouteNames.articleDetail);
                        },
                        child: ArticleItemsWidget(
                          title: article.category.name,
                          dateTime:
                          "${(DateTime.now()).toString().substring(8, 10)}.${(DateTime.now()).toString().substring(5, 7)}.${(DateTime.now()).toString().substring(0, 4)}",
                          views: "2696",
                          image: AppIcons.articleDetail,
                        ),
                      );
                    })
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
