class Answer {
  final String id;
  final String content;

  Answer(
      this.id,
      this.content,
      );

  factory Answer.fromJson(Map<String, dynamic> json) {
    return Answer(
      json["_id"],
      json["content"],
    );
  }
}