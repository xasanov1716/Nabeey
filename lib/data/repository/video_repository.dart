import 'package:contest_app/services/api_service.dart';
import '../models/universal_data.dart';

class VideoRepository{
  final ApiService apiService;

  VideoRepository({required this.apiService});

  Future<UniversalData> getAllVideos() async =>
      await apiService.getAllVideos();


}