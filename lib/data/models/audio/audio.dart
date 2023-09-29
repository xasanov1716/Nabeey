class Audio {
  int id;
  String fileName;
  String filePath;

  Audio({
    required this.id,
    required this.fileName,
    required this.filePath,
  });

  factory Audio.fromJson(Map<String, dynamic> json) => Audio(
        id: json["id"] as int? ?? 0,
        fileName: json["file_name"] as String? ?? "",
        filePath: json["file_path"] as String? ?? "",
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "fileName": fileName,
        "filePath": filePath,
      };

  Audio copyWith({
    int? id,
    String? fileName,
    String? filePath,
  }) {
    return Audio(
      id: id ?? this.id,
      fileName: fileName ?? this.fileName,
      filePath: filePath ?? this.filePath,
    );
  }

  @override
  String toString() {
    return """
      id: $id,
      fileName: $fileName,
      filePath: $filePath,
    """;
  }
}
