import 'package:contest_app/data/models/quiz/quiz_model.dart';
import 'package:contest_app/data/models/quiz/quiz_questions_model.dart';
import 'package:contest_app/data/models/status/form_status.dart';
import 'package:contest_app/data/models/universal_data.dart';
import 'package:contest_app/data/repository/quiz_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'quiz_event.dart';
part 'quiz_state.dart';

class QuizBloc extends Bloc<QuizEvent, QuizState> {
  QuizBloc({required this.quizRepository})
      : super(const QuizState(quizModel: [], status: FormStatus.pure,questionModel: [])) {
    on<GetQuizzesEvent>(_getQuizzes);
    on<GetQuizQuestionsEvent>(_getQuizQuestions);
    on<GetQuizQuestionsByIdEvent>(_getQuizQuestionsById);
  }

  final QuizRepository quizRepository;

  Future<void> _getQuizzes(
      GetQuizzesEvent event, Emitter<QuizState> emit) async {
    emit(state.copyWith(status: FormStatus.loading));

    UniversalData data = await quizRepository.quizzesGetAll();


    if (data.error.isEmpty) {
      emit(state.copyWith(
        quizModel: data.data,
        status: FormStatus.success,
      ));
    }
    emit(state.copyWith(
      status: FormStatus.failure,
    ));
  }

  Future<void> _getQuizQuestions(
      GetQuizQuestionsEvent event, Emitter<QuizState> emit) async {
    emit(state.copyWith(status: FormStatus.loading));

    UniversalData data = await quizRepository.getQuizQuestions();


    if (data.error.isEmpty) {
      emit(state.copyWith(
        questionModel: data.data,
        status: FormStatus.success,
      ));
    }
    emit(state.copyWith(
      status: FormStatus.failure,
    ));
  }

  Future<void> _getQuizQuestionsById(
      GetQuizQuestionsByIdEvent event, Emitter<QuizState> emit) async {
    emit(state.copyWith(status: FormStatus.loading));

    UniversalData data = await quizRepository.getQuizQuestionsById(event.id);


    if (data.error.isEmpty) {
      emit(state.copyWith(
        questionModel: data.data,
        status: FormStatus.success,
      ));
    }
    emit(state.copyWith(
      status: FormStatus.failure,
    ));
  }
}
