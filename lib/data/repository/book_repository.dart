import 'package:contest_app/data/models/universal_data.dart';
import 'package:contest_app/services/api_service.dart';

class BookRepoSitory{

  BookRepoSitory({required this.apiService});

  final ApiService apiService;


  Future<UniversalData>  getBook()async => await apiService.getAllBook();

  Future<UniversalData>  getBookById(int id)async => await apiService.getBookByIds(id);
}