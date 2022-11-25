class RegisterResponse {
  RegisterResponse({
    required this.status,
    required this.token,
    this.message,
  });

  String status;
  String token;
  String? message;
  factory RegisterResponse.fromjson(Map<String, dynamic> json) {
    return RegisterResponse(
        status: "status", token: "token", message: "message");
  }
}
