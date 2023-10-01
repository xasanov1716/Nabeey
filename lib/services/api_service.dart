import 'dart:convert';

import 'package:contest_app/data/models/book/book_model.dart';
import 'package:contest_app/data/models/category/category_model.dart';
import 'package:contest_app/data/models/result_model.dart';
import 'package:contest_app/data/models/video_model/video_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import '../data/models/universal_data.dart';
import '../utils/constants.dart';
import 'package:contest_app/data/models/article/article_model.dart';
import 'package:contest_app/data/models/universal_data.dart';
import 'package:contest_app/utils/constants.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class ApiService {
  final _dio = Dio(
    BaseOptions(
      baseUrl: baseUrl,
      headers: {"Content-Type": "application/json"},
      connectTimeout: Duration(seconds: TimeOutConstants.connectTimeout),
      receiveTimeout: Duration(seconds: TimeOutConstants.receiveTimeout),
      sendTimeout: Duration(seconds: TimeOutConstants.sendTimeout),
    ),
  );

  ApiService() {
    init();
  }

  init() {
    _dio.interceptors.add(
      InterceptorsWrapper(
        onError: (error, handler) async {
          debugPrint('On Error: ${error.message}');

          return handler.next(error);
        },
        onRequest: (requestOptions, handler) async {
          debugPrint('On Request: ${requestOptions.data}');
          return handler.next(requestOptions);
        },
        onResponse: (response, handler) async {
          debugPrint('On Response: ${response.statusCode}');
          debugPrint('PATH: ${response.requestOptions.path}');
          return handler.next(response);
        },
      ),
    );
  }

  Future<UniversalData> getAllArticles() async {
    Response response;
    try {
      response = await _dio.get("/api/article/get-all");
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        return UniversalData(
          data: (response.data['data'] as List?)
                  ?.map((e) => ArticleModel.fromJson(e))
                  .toList() ??
              [],
        );
      }
      return UniversalData(error: 'ERROR');
    } on DioException catch (e) {
      if (e.response != null) {
        return UniversalData(error: e.response!.data['message']);
      } else {
        return UniversalData(error: e.message!);
      }
    } catch (e) {
      debugPrint("Caught: $e");
      return UniversalData(error: e.toString());
    }
  }

  Future<UniversalData> getAllVideos() async {
    Response response;
    try {
      response = await _dio.get("/api/content-videos/get-all");
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        return UniversalData(
          data: (response.data['data'] as List?)
                  ?.map((e) => VideoModel.fromJson(e))
                  .toList() ??
              [],
        );
      }
      return UniversalData(error: 'ERROR');
    } on DioException catch (e) {
      if (e.response != null) {
        return UniversalData(error: e.response!.data['message']);
      } else {
        return UniversalData(error: e.message!);
      }
    } catch (e) {
      return UniversalData(error: e.toString());
    }
  }

  Future<UniversalData> getArticleById(int id) async {
    Response response;
    try {
      response = await _dio.get("/api/article/get/$id");
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        return UniversalData(
            data: ArticleModel.fromJson(response.data['data']));
      }
      return UniversalData(error: 'ERROR');
    } on DioException catch (e) {
      if (e.response != null) {
        return UniversalData(error: e.response!.data['message']);
      } else {
        return UniversalData(error: e.message!);
      }
    } catch (e) {
      debugPrint("Caught: $e");
      return UniversalData(error: e.toString());
    }
  }

  Future<UniversalData> getAllCategories() async {
    Response response;
    try {
      response = await _dio.get("/api/content-categories/get-all");
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        // debugPrint(response.data["data"]);
        return UniversalData(
          data: (response.data["data"] as List?)
                  ?.map((e) => CategoryModel.fromJson(e))
                  .toList() ??
              [],
        );
      }
      return UniversalData(error: 'ERROR');
    } on DioException catch (e) {
      if (e.response != null) {
        return UniversalData(error: e.response!.data['message']);
      } else {
        return UniversalData(error: e.message!);
      }
    } catch (e) {
      debugPrint("Caught: $e");
      return UniversalData(error: e.toString());
    }
  }

  Future<Result> loginUser(
    String phone,
    String password,
  ) async {
    try {
      print(phone);
      final response =
          await _dio.post("/api/auth/login?phone=$phone&password=$password");
      print(response.data);
      if (response.statusCode == 200) {
        return Result.success(null);
      }
      return Result.fail(
          "StatusCode is not equal to 200!\nCurrent StatusCode equal to ${response.statusCode}");
    } on DioError catch (e) {
      if (e.response != null && e.response!.statusCode == 404) {
        return Result.fail(e.response?.data['message'].toString());
      } if (e.response != null && e.response!.statusCode == 400) {
        return Result.fail(e.response?.data['message'].toString());
      }
      return Result.fail(e.toString());
    } catch (e) {
      return Result.fail(e.toString());
    }
  }

  Future<UniversalData> getAllBook()async{
    Response response;
    try{
      response = await _dio.get('/api/books/get-all');
      if(response.statusCode! >= 200 && response.statusCode! < 300){
      return UniversalData(data: (response.data['data'] as List?)?.map((e) => BookModel.fromJson(e)).toList());
      }
      return UniversalData(error: 'ERROR');
    }
    on DioException catch(e){
       if (e.response != null) {
        return UniversalData(error: e.response!.data['message']);
      } else {
        return UniversalData(error: e.message!);
      }
    } catch (e) {
      debugPrint("Caught: $e");
      return UniversalData(error: e.toString());
    }
  }


  Future<UniversalData> getBookById(int id)async{
    Response response;
    try{
      response = await _dio.get('/api/books/get/$id');
      if(response.statusCode! >= 200 && response.statusCode! < 300){
      return UniversalData(data: BookModel.fromJson(response.data['data']));
      }
      return UniversalData(error: 'ERROR');
    }
    on DioException catch(e){
       if (e.response != null) {
        return UniversalData(error: e.response!.data['message']);
      } else {
        return UniversalData(error: e.message!);
      }
    } catch (e) {
      debugPrint("Caught: $e");
      return UniversalData(error: e.toString());
    }
  }
}
