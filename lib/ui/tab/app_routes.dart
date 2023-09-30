import 'package:contest_app/ui/tab/home/home_screen.dart';
import 'package:contest_app/ui/tab/home/sub_screens/articles/sub_screen/article_detail_screen.dart';
import 'package:contest_app/ui/tab/home/sub_screens/articles/articles_screen.dart';
import 'package:contest_app/ui/tab/home/sub_screens/categories/categories_detail_screen.dart';
import 'package:contest_app/ui/tab/home/sub_screens/audios/audios_screen.dart';
import 'package:contest_app/ui/tab/home/sub_screens/books/books_screen.dart';
import 'package:contest_app/ui/tab/home/sub_screens/videos/sub_screens/all_videos/videos_screen.dart';
import 'package:contest_app/ui/tab/home/sub_screens/videos/sub_screens/video_detail/video_detail_screen.dart';
import 'package:contest_app/ui/tab/profile/auth/auth_screen.dart';
import 'package:contest_app/ui/tab/tab_box.dart';
import 'package:flutter/material.dart';

class RouteNames {
  static const String tabBox = "/";
  static const String categoryDetail = "/category_detail";
  static const String homeScreen = "/home_screen";
  static const String audioScreen = "/audio_screen";
  static const String booksScreen = "/books_screen";
  static const String videoScreen = "/video_screen";
  static const String videoDetailScreen = "/video_detail_screen";
  static const String articleDetail = "/article_detail";
  static const String articles = "/articles";
  static const String auth = "/auth_screen";
}

class AppRoutes {
  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.tabBox:
        return MaterialPageRoute(
          builder: (context) =>  TabBox(),
        );
      case RouteNames.categoryDetail:
        return MaterialPageRoute(builder: (context) =>  CategoriesDetailScreen());
      case RouteNames.homeScreen:
        return MaterialPageRoute(builder: (context) => const HomeScreen());
      case RouteNames.audioScreen:
        return MaterialPageRoute(builder: (context) => const AudioScreen());
      case RouteNames.booksScreen:
        return MaterialPageRoute(builder: (context) => const BooksScreen());
      case RouteNames.videoScreen:
        return MaterialPageRoute(builder: (context) => const VideosScreen());
      case RouteNames.videoDetailScreen:
        return MaterialPageRoute(builder: (context) => const VideoDetailScreen());
      case RouteNames.articleDetail:
        return MaterialPageRoute(builder: (context) => const ArticleDetailScreen());
      case RouteNames.articles:
        return MaterialPageRoute(builder: (context) => const ArticlesScreen());
      case RouteNames.auth:
        return MaterialPageRoute(builder: (context) => const AuthScreen());
      default:
        return MaterialPageRoute(
          builder: (context) => const Scaffold(
            body: Center(
              child: Text("Route not available!"),
            ),
          ),
        );
    }
  }
}
