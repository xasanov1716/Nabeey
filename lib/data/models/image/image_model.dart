class ImageModel {
  final int id;
  final String fileName;
  final String filePath;

  ImageModel({
    required this.id,
    required this.fileName,
    required this.filePath,
  });

  factory ImageModel.fromJson(Map<String, dynamic> json) {
    return ImageModel(
      id: json['id'] ?? 0,
      fileName: json['fileName'] ?? '',
      filePath: json['filePath'] ?? '',
    );
  }
}
