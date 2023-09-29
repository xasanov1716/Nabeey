import 'package:contest_app/data/models/universal_data.dart';
import 'package:contest_app/services/article_service.dart';

class ArticleRepository {
  final ArticleService articleService;

  ArticleRepository({required this.articleService});

  Future<UniversalData> getAllArticles() async =>
      await articleService.getAllArticles();

  Future<UniversalData> getArticleById(int id) async =>
      await articleService.getArticleById(id);
}