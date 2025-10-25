class UserModel {
  static const String collectionName = "Users";
  static UserModel? currentUser;
  String id;
  String name;
  String email;

  UserModel({required this.id, required this.name, required this.email});

  /// function(json)=> userModel
  UserModel.fromJson(Map<String, dynamic> json)
    : this(id: json["id"], name: json["name"], email: json["email"]);

  Map<String, dynamic> toJson() => {"id": id, "name": name, "email": email};
}
