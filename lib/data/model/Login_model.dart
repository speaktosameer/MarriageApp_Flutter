// ignore_for_file: public_member_api_docs, sort_constructors_first
class LoginModel {
  String email;
  String password;
  LoginModel({
    required this.email,
    required this.password,
  });
  Map<String, dynamic> tojson() => {"email": email, "password": password};
}
