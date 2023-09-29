import 'package:contest_app/data/helper/helper_model.dart';

class BookModel {
  final int id;
  final String title;
  final String author;
  final String description;
  final HelperModel file;
  final HelperModel image;

  BookModel({
    required this.id,
    required this.title,
    required this.author,
    required this.description,
    required this.file,
    required this.image,
  });

  BookModel copyWith({
    int? id,
    String? title,
    String? author,
    String? description,
    HelperModel? file,
    HelperModel? image,
  }) =>
      BookModel(
        id: id ?? this.id,
        title: title ?? this.title,
        author: author ?? this.author,
        description: description ?? this.description,
        file: file ?? this.file,
        image: image ?? this.image,
      );

  factory BookModel.fromJson(Map<String, dynamic> json) => BookModel(
        id: json["id"] as int? ?? 0,
        title: json["title"] as String? ?? "",
        author: json["author"] as String? ?? "",
        description: json["description"] as String? ?? "",
        file: HelperModel.fromJson(json["file"]),
        image: HelperModel.fromJson(json["image"]),
      );
}
