class HelperModel {
  final int id;
  final String fileName;
  final String filePath;

  HelperModel({
    required this.id,
    required this.fileName,
    required this.filePath,
  });

  HelperModel copyWith({
    int? id,
    String? fileName,
    String? filePath,
  }) =>
      HelperModel(
        id: id ?? this.id,
        fileName: fileName ?? this.fileName,
        filePath: filePath ?? this.filePath,
      );

  factory HelperModel.fromJson(Map<String, dynamic> json) => HelperModel(
        id: json["id"]as int? ?? 0,
        fileName: json["fileName"]as String? ?? "",
        filePath: json["filePath"]as String? ?? "",
      );
}
