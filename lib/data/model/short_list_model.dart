// ignore_for_file: public_member_api_docs, sort_constructors_first
class ShortList {
  final int age;
  final String height;
  final String dateofBirth;
  final String gender;
  final String weight;
  final String city;
  final User user;
  ShortList({
    required this.age,
    required this.height,
    required this.dateofBirth,
    required this.gender,
    required this.weight,
    required this.city,
    required this.user,
  });
  factory ShortList.fromjson(Map<String, dynamic> json) {
    return ShortList(
        age: json['age'] ?? 20,
        height: json['height'] ?? '5.48',
        dateofBirth: json['dateOfBirth'] ?? '2055',
        gender: json['gender'] ?? 'f',
        weight: json['weight'] ?? '90',
        city: json['city'] ?? 'ktm',
        user: User.fromjson(json['User']));
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
