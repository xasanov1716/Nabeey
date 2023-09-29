abstract class ArticleEvent {}

class GetArticlesEvent extends ArticleEvent {}

class GetArticleByIdEvent extends ArticleEvent {
  final int id;
  GetArticleByIdEvent({required this.id});
}
