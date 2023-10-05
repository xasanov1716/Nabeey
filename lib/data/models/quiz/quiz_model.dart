import 'package:contest_app/data/models/category/category_model.dart';
import 'package:contest_app/data/models/user/user_model.dart';

class QuizModel {
  final int id;
  final String name;
  final String description;
  final int questionCount;
  final String startTime;
  final String endTime;
  final UserModel user;
  final CategoryModel contentCategory;

  QuizModel({
    required this.id,
    required this.name,
    required this.description,
    required this.questionCount,
    required this.startTime,
    required this.endTime,
    required this.user,
    required this.contentCategory,
  });

  QuizModel copyWith({
    int? id,
    String? name,
    String? description,
    int? questionCount,
    String? startTime,
    String? endTime,
    UserModel? user,
    CategoryModel? contentCategory,

  }) =>
      QuizModel(
        id: id ?? this.id,
        name: name ?? this.name,
        description: description ?? this.description,
        questionCount: questionCount ?? this.questionCount,
        startTime: startTime ?? this.startTime,
        endTime: endTime ?? this.endTime,
        user: user ?? this.user,
        contentCategory: contentCategory ?? this.contentCategory,
      );

  factory QuizModel.fromJson(Map<String, dynamic> json) => QuizModel(
    id: json["id"] as int? ?? 0,
    name: json["name"] as String? ?? "",
    description: json["description"] as String? ?? "",
    questionCount: json["questionCount"] as int? ?? 0,
    startTime: json["startTime"] as String? ?? '',
    endTime: json["endTime"] as String? ?? '',
    user: UserModel.fromJson(json["user"]),
    contentCategory: CategoryModel.fromJson(json["contentCategory"]),
  );
}
