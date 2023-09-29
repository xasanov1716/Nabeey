class VideoModel {
  VideoModel({
    required this.id,
    required this.title,
    required this.description,
    required this.videoLink,
  });

  final int id;
  final String title;
  final String description;
  final String videoLink;

  factory VideoModel.fromJson(Map<String, dynamic> json) {
    return VideoModel(
      id: json["id"] as int? ?? 0,
      title: json["title"] as String? ?? "",
      description: json["description"] as String? ?? "",
      videoLink: json["video_link"] as String? ?? "",
    );
  }

  VideoModel copyWith({
    int? id,
    String? title,
    String? description,
    String? videoLink,
  }) {
    return VideoModel(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      videoLink: videoLink ?? this.videoLink,
    );
  }

  Map<String, dynamic> toJson(){
    return {
      "id": id,
      "title": title,
      "description": description,
      "video_link": videoLink,
    };
  }
}
