part of 'quiz_bloc.dart';

@immutable
class QuizState extends Equatable {
  final List<QuizModel> quizModel;
  final FormStatus status;

  const QuizState({
    required this.quizModel,
    required this.status,
  });

  @override
  List<Object?> get props => [
        quizModel,
        status,
      ];

  QuizState copyWith({
    List<QuizModel>? quizModel,
    FormStatus? status,
  }) {
    return QuizState(quizModel: quizModel ?? this.quizModel, status: status ?? this.status);
  }
}
