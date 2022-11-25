class TopUser {
  String firstName = "";
  String? lastName;
  UserDetail? userDetail;

  TopUser();

  TopUser.fromJson(Map<String, dynamic> json) {
    firstName = json['firstName'];
    lastName = json['lastName'];
    userDetail = json['UserDetail'] != null
        ? new UserDetail.fromJson(json['UserDetail'])
        : null;
  }
}

class UserDetail {
  String? height;
  String? education;

  UserDetail();

  UserDetail.fromJson(Map<String, dynamic> json) {
    height = json['height'];
    education = json['education'];
  }

}