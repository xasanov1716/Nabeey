class FileClass {
  final int id;
  final String fileName;
  final String filePath;

  FileClass({
    required this.id,
    required this.fileName,
    required this.filePath,
  });

  FileClass copyWith({
    int? id,
    String? fileName,
    String? filePath,
  }) =>
      FileClass(
        id: id ?? this.id,
        fileName: fileName ?? this.fileName,
        filePath: filePath ?? this.filePath,
      );

  factory FileClass.fromJson(Map<String, dynamic> json) => FileClass(
        id: json["id"]as int? ?? 0,
        fileName: json["fileName"]as String? ?? "",
        filePath: json["filePath"]as String? ?? "",
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "fileName": fileName,
        "filePath": filePath,
      };
}
