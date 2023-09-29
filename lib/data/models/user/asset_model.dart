class AssetModel {
  final int id;
  final String fileName;
  final String filePath;

  AssetModel({
    required this.id,
    required this.fileName,
    required this.filePath,
  });

  factory AssetModel.fromJson(Map<String, dynamic> json) {
    return AssetModel(
      id: json['id'] ?? 0,
      fileName: json['fileName'] ?? '',
      filePath: json['filePath'] ?? '',
    );
  }
}
