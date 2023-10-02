
class Answer {
  final int id;
  final String text;
  final dynamic asset;
  Answer({required this.id, required this.text, required this.asset});
  factory Answer.fromJson(Map<String, dynamic> json) {
    return Answer(
        id: json["id"] as int? ?? 0,
        text: json["text"] as String? ?? "",
        asset: json["asset"] );
  }
  Map<String,dynamic>toJson()=>{
    "id":id,
    "text":text,
    "asset":asset,
  };
  @override
  String toString (){
    return """
    id:$id,
    text:$text,
    asset:$asset,
    """;
  }
}
