part of 'quiz_bloc.dart';

@immutable
class QuizState extends Equatable {
  final List<QuizModel> quizModel;
  final List<QuestionModel> questionModel;
  final FormStatus status;

  const QuizState({
    required this.quizModel,
    required this.questionModel,
    required this.status,
  });

  @override
  List<Object?> get props => [
        questionModel,
        quizModel,
        status,
      ];

  QuizState copyWith({
    List<QuizModel>? quizModel,
    List<QuestionModel>? questionModel,
    FormStatus? status,
  }) {
    return QuizState(
        questionModel: questionModel ?? this.questionModel,
        quizModel: quizModel ?? this.quizModel,
        status: status ?? this.status);
  }
}
