class UserModel {
  String? name;
  String? emal;
  String? urlAvatar;
  String? token;
  String? loginType;
  String? id;

  UserModel(
      {this.emal,
      this.name,
      this.token,
      this.urlAvatar,
      this.loginType,
      this.id});

  static UserModel fromJson(Map map) {
    return UserModel(
        name: map["playername"] ?? "",
        emal: map["email"] ?? "",
        urlAvatar: map["url_avatar"] ?? "",
        token: map["tokens"][(map["tokens"] as List).length - 1],
        id: map["_id"]);
  }

  Map toMap() {
    return {
      'playername': name,
      'email': emal,
      'url_avatar': urlAvatar,
      'tokens': [token],
      'id': id
    };
  }
}
