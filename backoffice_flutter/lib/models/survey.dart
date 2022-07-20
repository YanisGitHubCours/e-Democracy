class Survey {
  final String name;
  final String description;
  final String type;
  final bool isAnonym;
  final bool isFinish;
  final String timer;
  final String id;

  Survey(
    this.name,
    this.description,
    this.type,
    this.isAnonym,
    this.isFinish,
    this.timer,
    this.id,
  );

  factory Survey.fromJson(Map<String, dynamic> json) {
    return Survey(
      json["name"],
      json["description"],
      json["type"],
      json["isAnonym"],
      json["isFinish"],
      json["timer"],
      json["_id"],
    );
  }
}