part of 'quiz_bloc.dart';

@immutable
abstract class QuizEvent {}

class GetQuizzesEvent extends QuizEvent{}
class GetQuizQuestionsEvent extends QuizEvent{}
class GetQuizQuestionsByIdEvent extends QuizEvent{
  final int id;
  GetQuizQuestionsByIdEvent({required this.id});
}
