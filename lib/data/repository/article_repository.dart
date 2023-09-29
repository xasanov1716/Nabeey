import 'package:contest_app/data/models/universal_data.dart';
import 'package:contest_app/services/api_service.dart';

class ArticleRepository {
  final ApiService apiService;

  ArticleRepository({required this.apiService});

  Future<UniversalData> getAllArticles() async =>
      await apiService.getAllArticles();

  Future<UniversalData> getArticleById(int id) async =>
      await apiService.getArticleById(id);
}