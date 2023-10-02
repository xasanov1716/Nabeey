import 'package:contest_app/data/models/universal_data.dart';
import 'package:contest_app/services/api_service.dart';

class QuizRepository {
  final ApiService apiService;

  QuizRepository({required this.apiService});

  Future<UniversalData> getAllQuizzes() async =>
      await apiService.getAllQuizzes();
}
