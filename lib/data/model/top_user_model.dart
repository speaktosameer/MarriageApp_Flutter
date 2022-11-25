// ignore_for_file: public_member_api_docs, sort_constructors_first
class TopUserModel {
  final List<User> user;
  TopUserModel({
    required this.user,
  });
  factory TopUserModel.formjson(Map<String, dynamic> json) {
    return TopUserModel(
        user: List.from(json["user"]).map((e) => User.fromjson(e)).toList());
  }
}

class User {
  final String firstname;
  final String secondname;
  final String user_id;
  User({
    required this.firstname,
    required this.secondname,
    required this.user_id,
  });
  factory User.fromjson(Map<String, dynamic> json) {
    return User(
        firstname: json['firstName'],
        secondname: json['lastName'],
        user_id: json['user_id']);
  }
}
