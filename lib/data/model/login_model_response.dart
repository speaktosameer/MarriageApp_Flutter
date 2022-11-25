class LoginModelResponse {
  LoginModelResponse({required this.token, required this.user});

  String token;
  User user;

  factory LoginModelResponse.fromJson(Map<String, dynamic> json) =>
      LoginModelResponse(
          token: json["token"], user: User.fromJson(json['user']));
}

class User {
  User({
    required this.user_id,
  });

  String user_id;

  factory User.fromJson(Map<String, dynamic> json) => User(
        user_id: json["user_id"],
      );
}
