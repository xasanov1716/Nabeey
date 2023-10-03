import '../ui/tab/app_routes.dart';
import 'icons.dart';

const String adminEmail = "admin@gmail.com";

const defaultImageConstant = "Select Image";

const baseUrl = "https://thejama.uz";

// const baseUrl = "https://api.restful-api.dev/objects";
// const baseUrlForImage = "http://159.89.98.34:5545";

class TimeOutConstants {
  static int connectTimeout = 30;
  static int receiveTimeout = 25;
  static int sendTimeout = 60;
}

const String token = "";

List<String> backgrounds = [
  AppIcons.articleBackground,
  AppIcons.youtubeBackground,
  AppIcons.audioBackground,
  AppIcons.bookBackground,
];
List<String> icons = [
  AppIcons.article,
  AppIcons.youtube,
  AppIcons.audio,
  AppIcons.book,
];
List<String> titles = [
  "Article",
  "Video",
  "Audio",
  "Book",
];
List<dynamic> navigators = [
  RouteNames.articles,
  RouteNames.videoScreen,
  RouteNames.audioScreen,
  RouteNames.booksScreen,
];

List<String> audiosData = [
  "musics/student.mp3",
  "musics/mix.mp3",
  "musics/susana.m4a",
  "musics/yoshlik.mp3",
];
