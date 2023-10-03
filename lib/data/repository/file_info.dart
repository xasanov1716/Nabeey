import 'package:equatable/equatable.dart';

class FileInfo extends Equatable {
  final String fileName;
  final String fileUrl;
  final double progress;
  final double memory;

  const FileInfo({
    required this.fileName,
    required this.fileUrl,
    required this.progress,
    required this.memory,
  });

  FileInfo copyWith({
    String? fileName,
    String? fileUrl,
    double? progress,
    double? memory,
    String? time,
  }) =>
      FileInfo(
        fileName: fileName ?? this.fileName,
        fileUrl: fileUrl ?? this.fileUrl,
        progress: progress ?? this.progress,
        memory: memory ?? this.memory,
      );

  @override
  List<Object?> get props => [
    fileName,
    fileUrl,
    progress,
    memory,
  ];
}

List<FileInfo> filesData = [
  const FileInfo(
      fileName: "Kitob.uz",
      fileUrl: "https://bilimlar.uz/wp-content/uploads/2021/02/k100001.pdf",
      progress: 0.0,
      memory: 2.1,
  ),
];