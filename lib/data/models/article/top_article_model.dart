import 'package:contest_app/data/helper/helper_model.dart';
import 'package:contest_app/data/models/category/category_model.dart';
import 'package:contest_app/data/models/user/user_model.dart';

class TopArticleModel {
  final int id;
  final String text;
  final HelperModel image;

  TopArticleModel({
    required this.id,
    required this.text,
    required this.image,
  });

  factory TopArticleModel.fromJson(Map<String, dynamic> json) {
    return TopArticleModel(
      id: json['id'] ?? 0,
      text: json['text'] ?? '',
      image: HelperModel.fromJson(json['image']),
      // user: UserModel.fromJson(json['user']),
    );
  }
}
