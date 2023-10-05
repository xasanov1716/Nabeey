part of 'quiz_bloc.dart';

@immutable
abstract class QuizEvent {}

class GetQuizzesEvent extends QuizEvent{}
class GetQuizQuestionsEvent extends QuizEvent{}
