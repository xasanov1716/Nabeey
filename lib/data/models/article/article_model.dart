import 'package:contest_app/data/helper/helper_model.dart';
import 'package:contest_app/data/models/category/category_model.dart';
import 'package:contest_app/data/models/user/user_model.dart';

class ArticleModel {
  final int id;
  final String text;
  final HelperModel image;
  final CategoryModel category;

  ArticleModel({
    required this.id,
    required this.text,
    required this.image,
    required this.category,
  });

  factory ArticleModel.fromJson(Map<String, dynamic> json) {
    return ArticleModel(
      id: json['id'] ?? 0,
      text: json['text'] ?? '',
      category: CategoryModel.fromJson(json['category']),
      image: HelperModel.fromJson(json['image']),
    );
  }
}
