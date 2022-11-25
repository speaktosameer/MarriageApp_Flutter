// ignore_for_file: public_member_api_docs, sort_constructors_first
class PartnerPreference {
  final String gender;
  final String minage;
  final String maxage;
  final String minheight;
  final String maxheight;
  final String city;
  final String physicalstatus;
  final String religion;
  final String caste;
  final String education;
  final String employedin;
  final String occupation;
  final String? userDetaiId;
  PartnerPreference(
      {required this.gender,
      required this.minage,
      required this.maxage,
      required this.minheight,
      required this.maxheight,
      required this.city,
      required this.physicalstatus,
      required this.religion,
      required this.caste,
      required this.education,
      required this.employedin,
      required this.occupation,
      this.userDetaiId});
  Map<String, dynamic> tojson() => {
        "lookingFor": gender,
        "ageFrom": minage,
        "ageTo": maxage,
        "heightTo": maxheight,
        "heightFrom": minheight,
        "bodyType": physicalstatus,
        "religion": religion,
        "caste": caste,
        "city": city,
        "education": education,
        "occupation": occupation,
        "employedIn": employedin,
        "userDetailId": userDetaiId
      };
}
