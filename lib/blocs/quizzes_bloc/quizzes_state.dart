part of 'quizzes_bloc.dart';

class QuizzesState extends Equatable {
  final FormStatus status;
  final String statusText;
  final List<QuizItem> quiz;
  QuizzesState(
      {required this.status, required this.statusText, required this.quiz});
  QuizzesState copyWith(
      {FormStatus? status, String? statusText, List<QuizItem>? quiz}) {
    return QuizzesState(
        status: status ?? this.status,
        statusText: statusText ?? this.statusText,
        quiz: quiz ?? this.quiz);
  }

  @override
  List<Object?> get props => [status, statusText, quiz];
}
