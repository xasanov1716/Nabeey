import 'package:contest_app/data/models/questions/questions.dart';
import 'package:contest_app/data/models/questions/quiz.dart';

class QuizItem {
  final int id;
  final Quiz quiz;
  final Question question;

  QuizItem({required this.id, required this.quiz, required this.question});

  factory QuizItem.fromJson(Map<String, dynamic> json) {
    print('ok1');
    return QuizItem(
      id: json['id'] as int? ?? 0,
      quiz: Quiz.fromJson(json['quiz']),
      question: Question.fromJson(json['question']),
    );
  }
  Map<String,dynamic>toJson()=>{
    'id':id,
    'quiz':quiz.toJson(),
    'question':question.toJson()
  };
  @override
  String toString(){
    return """
    id:$id,
    quiz:$quiz.
    question:$question
    """;
  }
}







