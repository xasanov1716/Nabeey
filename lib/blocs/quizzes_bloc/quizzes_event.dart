part of 'quizzes_bloc.dart';

@immutable
abstract class QuizzesEvent {}
class GetAllQuizzes extends QuizzesEvent{}
class StartQuizEvent extends QuizzesEvent {}
class AnswerQuestionEvent extends QuizzesEvent {
  final int selectedIndex;

  AnswerQuestionEvent({required this.selectedIndex});
}

class MoveToNextQuestionEvent extends QuizzesEvent {}
