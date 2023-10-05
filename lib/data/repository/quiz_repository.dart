import 'package:contest_app/data/models/universal_data.dart';
import 'package:contest_app/services/api_service.dart';

class QuizRepository{
  final ApiService apiService;

  QuizRepository({required this.apiService});

  Future<UniversalData> quizzesGetAll() async => await apiService.quizzesGetAll();
  Future<UniversalData> getQuizQuestions() async => await apiService.getAllQuizQuestions();
}