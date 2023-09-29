import 'package:contest_app/data/helper/helper_model.dart';
import 'package:contest_app/data/models/article/top_article_model.dart';
import 'package:contest_app/data/models/audio/audio_model.dart';
import 'package:contest_app/data/models/book/book_model.dart';
import 'package:contest_app/data/models/video_model/video_model.dart';

class CategoryModel {
  final int id;
  final String name;
  final String description;
  final HelperModel image;
  final List<BookModel> books;
  final List<AudioModel> audios;
  final List<VideoModel> videos;
  final List<TopArticleModel> articles;

  CategoryModel({
    required this.id,
    required this.name,
    required this.description,
    required this.image,
    required this.books,
    required this.audios,
    required this.videos,
    required this.articles,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['id'] as int? ?? 0,
      name: json['name'] as String? ?? '',
      description: json['description'] as String? ?? '',
      image: json['image'] != null
          ? HelperModel.fromJson(json['image'])
          : HelperModel(
              id: 0,
              fileName: "",
              filePath: "",
            ),
      books: (json["books"] as List?)
              ?.map((e) => BookModel.fromJson(e))
              .toList() ??
          [],
      audios: (json["audios"] as List?)
              ?.map((e) => AudioModel.fromJson(e))
              .toList() ??
          [],
      videos: (json["videos"] as List?)
              ?.map((e) => VideoModel.fromJson(e))
              .toList() ??
          [],
      articles: (json["articles"] as List?)
              ?.map((e) => TopArticleModel.fromJson(e))
              .toList() ??
          [],
    );
  }
}
