import 'audio.dart';

class AudioModel {
  int id;
  String title;
  String description;
  Audio audio;

  AudioModel({
    required this.id,
    required this.title,
    required this.description,
    required this.audio,
  });

  factory AudioModel.fromJson(Map<String, dynamic> json) => AudioModel(
        id: json["id"] as int? ?? 0,
        title: json["title"] as String? ?? "",
        description: json["description"] as String? ?? "",
        audio: Audio.fromJson(json["audio"]),
      );

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "title": title,
      "description": description,
      "audio": audio.toJson(),
    };
  }

  AudioModel copyWith({
    int? id,
    String? title,
    String? description,
    Audio? audio,
  }) {
    return AudioModel(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      audio: audio ?? this.audio,
    );
  }

  @override
  String toString() {
    return """
      id: $id,
      title: $title,
      description: $description,
      audio: $audio,
    """;
  }
}
