import 'dart:async';
import 'package:contest_app/data/helper/helper_model.dart';
import 'package:contest_app/data/models/category/category_model.dart';
import 'package:contest_app/data/models/universal_data.dart';
import 'package:contest_app/data/repository/app_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/models/status/form_status.dart';
import 'categories_event.dart';
import 'categories_state.dart';

class CategoriesBloc extends Bloc<CategoriesEvent, CategoriesState> {
  CategoriesBloc({required this.appRepository})
      : super(
          CategoriesState(
            categories: [],
            status: FormStatus.pure,
            categoryModel: CategoryModel(
              id: 0,
              name: '',
              description: '',
              image: HelperModel(id: 0, fileName: '', filePath: ''),
              books: [],
              audios: [],
              videos: [],
              articles: [],
            ),
          ),
        ) {
    on<GetCategories>(_getCategories);
    on<SetCurrentCategory>(_setCurrentCategory);
  }

  final AppRepository appRepository;

  Future<void> _getCategories(
      GetCategories event, Emitter<CategoriesState> emit) async {
    emit(state.copyWith(status: FormStatus.loading));

    UniversalData data = await appRepository.getAllCategories();

    if (data.error.isEmpty) {
      emit(state.copyWith(
        categories: data.data,
        status: FormStatus.success,
      ));
    }
    emit(state.copyWith(
      status: FormStatus.failure,
    ));
  }

  void _setCurrentCategory(
      SetCurrentCategory event, Emitter<CategoriesState> emit) {
    emit(state.copyWith(categoryModel: event.categoryModel));
  }

  void setInitialState(
      SetCurrentCategory event, Emitter<CategoriesState> emit) {
    emit(
      CategoriesState(
        categories: [],
        status: FormStatus.pure,
        categoryModel: CategoryModel(
          id: 0,
          name: '',
          description: '',
          image: HelperModel(id: 0, fileName: '', filePath: ''),
          books: [],
          audios: [],
          videos: [],
          articles: [],
        ),
      ),
    );
  }
}
