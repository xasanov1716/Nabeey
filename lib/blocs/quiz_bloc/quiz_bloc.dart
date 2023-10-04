import 'package:contest_app/data/models/quiz/quiz_model.dart';
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
      : super(const QuizState(quizModel: [], status: FormStatus.pure)) {
    on<GetQuizzesEvent>(_getQuizzes);
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
}
