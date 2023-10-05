//"id": 1,
// "text": "Rosululloh Sollallohu alayhi vasallam qachon tug'ilganlar?",
// "image": null,
// "answers": []

import 'package:contest_app/data/models/quiz/quetion_answer_model.dart';

class QuestionModel{
  int id;
  String text;
  String image;
  List<QuestionAnswerModel> answers;

  QuestionModel({
    required this.id,
    required this.text,
    required this.image,
    required this.answers,
});

  QuestionModel copyWith({
    int? id,
    String? text,
    String? image,
    List<QuestionAnswerModel>? answers,

  }) =>
      QuestionModel(
        id: id ?? this.id,
        text: text ?? this.text,
        image: image ?? this.image,
        answers: answers ?? this.answers,
      );

  factory QuestionModel.fromJson(Map<String, dynamic> json) => QuestionModel(
    id: json["id"] as int? ?? 0,
    text: json["text"] as String? ?? "",
    image: json["image"] as String? ?? "",
    answers: (json["answers"] as List).map((e) => QuestionAnswerModel.fromJson(e)).toList(),
  );
}