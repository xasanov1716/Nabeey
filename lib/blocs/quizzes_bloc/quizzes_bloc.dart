import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:contest_app/data/models/questions/questions_model.dart';
import 'package:contest_app/data/models/status/form_status.dart';
import 'package:contest_app/data/models/universal_data.dart';
import 'package:contest_app/data/repository/quiz_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'quizzes_event.dart';

part 'quizzes_state.dart';

class QuizzesBloc extends Bloc<QuizzesEvent, QuizzesState> {
  final QuizRepository quizRepository;
  int currentQuestionIndex = 0;

  QuizzesBloc({required this.quizRepository})
      : super(QuizzesState(status: FormStatus.pure, statusText: "", quiz: [])) {
    on<GetAllQuizzes>(getAllQuizzes);
  }

  Future<void> getAllQuizzes(
      GetAllQuizzes getAllQuizzes, Emitter<QuizzesState> emit) async {
    print("ok-1");
    emit(
      state.copyWith(statusText: "Loading...", status: FormStatus.loading),
    );
    UniversalData response = await quizRepository.getAllQuizzes();
    if (response.error.isEmpty) {
      emit(state.copyWith(
          status: FormStatus.success,
          statusText: "SUCCESS",
          quiz: response.data));
    } else {
      emit(
        state.copyWith(
          status: FormStatus.failure,
          statusText: response.error,
        ),
      );
    }
  }
}
