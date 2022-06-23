class User {
  final String firstName;
  final String lastName;
  final String pseudo;
  final String email;
  final String bio;
  final String img;
  final String id;

  User(
    this.firstName,
    this.lastName,
    this.pseudo,
    this.email,
    this.bio,
    this.img,
    this.id,
  );

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      json["firstname"],
      json["lastname"],
      json["pseudo"],
      json["email"],
      json["bio"],
      json["img"],
      json["_id"],
    );
  }
}
