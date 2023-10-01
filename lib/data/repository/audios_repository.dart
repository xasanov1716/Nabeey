import 'package:contest_app/data/models/universal_data.dart';
import 'package:contest_app/services/api_service.dart';

class AudiosRepository{

  AudiosRepository({required this.apiService});

  final ApiService apiService;


  Future<UniversalData>  getAudios()async => await apiService.getAllAudios();

}