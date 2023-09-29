import 'package:contest_app/services/api_service.dart';
import '../models/universal_data.dart';

class AppRepository{
  final ApiService apiService;

  AppRepository({required this.apiService});

  Future<UniversalData> getAllCategories() async =>
      await apiService.getAllCategories();


}