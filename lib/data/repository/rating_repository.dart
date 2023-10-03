import '../../services/api_service.dart';
import '../models/universal_data.dart';

class RatingRepository {
  final ApiService apiService;

  RatingRepository({required this.apiService});

  Future<UniversalData> getAllRating() async => await apiService.getAllRating();
}
