import 'package:contest_app/data/models/category/category_model.dart';

class Quiz {
  final int id;
  final String name;
  final String description;
  final int questionCount;
  final String startTime;
  final String endTime;
  final dynamic user;
  final CategoryModel contentCategory;

  Quiz(
      {required this.id,
      required this.name,
      required this.description,
      required this.questionCount,
      required this.startTime,
      required this.endTime,
      this.user,
      required this.contentCategory});

  factory Quiz.fromJson(Map<String, dynamic> json) {
    return Quiz(
      id: json['id'] as int? ?? 0,
      name: json['name'] as String? ?? "",
      description: json['description'] as String? ?? "",
      questionCount: json['questionCount'] as int? ?? 0,
      startTime: json['startTime'] as String? ?? "",
      endTime: json['endTime'] as String? ?? "",
      user: json['user'],
      contentCategory: CategoryModel.fromJson(json['contentCategory']),
    );
  }
  Map<String,dynamic>toJson()=>{
    'id':id,
    'name':name,
    'description':description,
    'questionCount':questionCount,
    'startTime':startTime,
    'endTime':endTime,
    'user':user,
    'contentCategory':contentCategory
  };
  @override
  String toString(){
    return """
     'id':$id,
    'name':$name,
    'description':$description,
    'questionCount':$questionCount,
    'startTime':$startTime,
    'endTime':$endTime,
    'user':$user,
    'contentCategory':$contentCategory
    """;
  }
}
