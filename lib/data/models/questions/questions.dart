
import 'package:contest_app/data/models/questions/answer.dart';

class Question {
  final int id;
  final String text;
  final String image; // null in provided JSON
  final List<Answer> answers;

  Question({required this.id, required this.text,required this.image, required this.answers});

  factory Question.fromJson(Map<String, dynamic> json) {
    return Question(
      id: json['id']as int? ?? 0 ,
      text: json['text'] as String? ?? "",
      image: json['image'] as String? ?? "",
      answers: (json['answers'] as List).map((e) => Answer.fromJson(e)).toList(),
    );
  }
  Map<String,dynamic>toJson()=>{
    'id':id,
    'text':text,
    'image':image,
    'answers': answers.map((e) => e.toJson()).toList(),
  };
  @override
  String toString(){
    return """
    id:$id,
    text:$text,
    image:$image,
    answers: $answers
    """;
  }
}