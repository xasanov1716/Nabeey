import 'package:contest_app/data/models/article/create_article_model.dart';

abstract class ArticleEvent {}

class GetArticlesEvent extends ArticleEvent {}

class GetArticleByIdEvent extends ArticleEvent {
  final int id;

  GetArticleByIdEvent({required this.id});
}

class CreateArticleEvent extends ArticleEvent {
  final CreateArticleModel createArticleModel;

  CreateArticleEvent({required this.createArticleModel});
}
