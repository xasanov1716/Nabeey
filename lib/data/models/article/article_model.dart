import 'package:contest_app/data/models/category/category_model.dart';
import 'package:contest_app/data/models/image/image_model.dart';
import 'package:contest_app/data/models/user/user_model.dart';

class ArticleModel {
  final int id;
  final String text;
  final CategoryModel category;
  final ImageModel image;
  final UserModel user;

  ArticleModel({
    required this.id,
    required this.text,
    required this.category,
    required this.image,
    required this.user,
  });

  factory ArticleModel.fromJson(Map<String, dynamic> json) {
    return ArticleModel(
      id: json['id'] ?? 0,
      text: json['text'] ?? '',
      category: CategoryModel.fromJson(json['category']),
      image: ImageModel.fromJson(json['image']),
      user: UserModel.fromJson(json['user']),
    );
  }
}
