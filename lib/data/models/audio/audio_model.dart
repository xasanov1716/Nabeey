import 'package:contest_app/data/helper/helper_model.dart';

class AudioModel {
  int id;
  String title;
  String description;
  HelperModel audio;

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
        audio: HelperModel.fromJson(json['audio']),
      );

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
