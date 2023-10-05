//"id": 1,
// "text": "571-yil Ramazon 10",
// "isTrue": false,
// "asset": null

class QuestionAnswerModel{
  int id;
  String text;
  bool isTrue;
  String asset;

  QuestionAnswerModel({
    required this.id,
    required this.text,
    required this.isTrue,
    required this.asset,
});

  QuestionAnswerModel copyWith({
    int? id,
    String? text,
    bool? isTrue,
    String? asset,

  }) =>
      QuestionAnswerModel(
        id: id ?? this.id,
        text: text ?? this.text,
        isTrue: isTrue ?? this.isTrue,
        asset: asset ?? this.asset,
      );

  factory QuestionAnswerModel.fromJson(Map<String, dynamic> json) => QuestionAnswerModel(
    id: json["id"] as int? ?? 0,
    text: json["text"] as String? ?? "",
    isTrue: json["isTrue"] as bool? ?? false,
    asset: json["asset"] as String? ?? "",
  );
}