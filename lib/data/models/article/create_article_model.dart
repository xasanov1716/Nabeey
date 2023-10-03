import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';

class CreateArticleModel {
  final String text;
  final int categoryId;
  final int userId;
  final String image;

  CreateArticleModel({
    required this.text,
    required this.categoryId,
    required this.userId,
    required this.image,
  });

  CreateArticleModel copyWith({
    String? text,
    int? categoryId,
    int? userId,
    String? image,
  }) =>
      CreateArticleModel(
        text: text ?? this.text,
        categoryId: categoryId ?? this.categoryId,
        userId: userId ?? this.userId,
        image: image ?? this.image,
      );

  Future<FormData> getFormData() async {
    XFile file = XFile(image);
    String fileName = file.path.split('/').last;
    return FormData.fromMap({
      "text": text,
      "categoryId": categoryId,
      "userId": userId,
      "image": await MultipartFile.fromFile(file.path, filename: fileName),
    });
  }
}
