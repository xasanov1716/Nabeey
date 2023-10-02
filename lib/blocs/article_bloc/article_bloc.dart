import 'package:contest_app/blocs/article_bloc/article_event.dart';
import 'package:contest_app/blocs/article_bloc/article_state.dart';
import 'package:contest_app/data/helper/helper_model.dart';
import 'package:contest_app/data/models/article/article_model.dart';
import 'package:contest_app/data/models/category/category_model.dart';
import 'package:contest_app/data/models/status/form_status.dart';
import 'package:contest_app/data/models/universal_data.dart';
import 'package:contest_app/data/repository/article_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ArticleBloc extends Bloc<ArticleEvent, ArticleState> {
  ArticleBloc({required this.articleRepository})
      : super(
          ArticleState(
            articleModel: ArticleModel(
              id: 0,
              text: '',
              category: CategoryModel(
                id: 0,
                name: '',
                description: '',
                image: HelperModel(id: 0, fileName: '', filePath: ''),
                books: [],
                audios: [],
                videos: [],
                articles: [],
              ),
              image: HelperModel(id: 0, fileName: '', filePath: ''),
            ),
            articles: const [],
          ),
        ) {
    on<GetArticlesEvent>(getAllArticles);
    on<GetArticleByIdEvent>(getAllArticleById);
  }

  final ArticleRepository articleRepository;

  Future<void> getAllArticles(
      GetArticlesEvent getArticlesEvent, Emitter<ArticleState> emit) async {
    emit(state.copyWith(status: FormStatus.loading, statusText: 'Loading...'));
    UniversalData response = await articleRepository.getAllArticles();
    if (response.error.isEmpty) {
      emit(
        state.copyWith(
          status: FormStatus.success,
          statusText: "SUCCESS",
          articles: response.data as List<ArticleModel>,
        ),
      );
    } else {
      emit(
        state.copyWith(
          status: FormStatus.failure,
          statusText: response.error,
        ),
      );
    }
  }

  Future<void> getAllArticleById(GetArticleByIdEvent getArticleByIdEvent,
      Emitter<ArticleState> emit) async {
    emit(state.copyWith(status: FormStatus.loading, statusText: 'Loading...'));
    UniversalData response =
        await articleRepository.getArticleById(getArticleByIdEvent.id);
    if (response.error.isEmpty) {
      emit(
        state.copyWith(
          status: FormStatus.success,
          statusText: "SUCCESS",
          articleModel: response.data as ArticleModel,
        ),
      );
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
