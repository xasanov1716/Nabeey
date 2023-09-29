import 'file_model.dart';

class BookModel {
  final int id;
  final String title;
  final String author;
  final String description;
  final FileClass file;
  final FileClass image;

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
    FileClass? file,
    FileClass? image,
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
        id: json["id"]as int? ?? 0,
        title: json["title"]as String? ?? "",
        author: json["author"]as String? ?? "",
        description: json["description"]as String? ?? "",
        file: FileClass.fromJson(json["file"]),
        image: FileClass.fromJson(json["image"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "author": author,
        "description": description,
        "file": file.toJson(),
        "image": image.toJson(),
      };
}
