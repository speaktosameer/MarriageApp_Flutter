// ignore_for_file: public_member_api_docs, sort_constructors_first
class PartnerPrefenceResponse {
  final Partnerprefs partnerprefs;
  PartnerPrefenceResponse({
    required this.partnerprefs,
  });
  factory PartnerPrefenceResponse.fromjson(Map<String, dynamic> json) {
    return PartnerPrefenceResponse(
        partnerprefs: Partnerprefs.fromjson(json['partnerPreference']));
  }
}

class Partnerprefs {
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
  final String userDetaiId;
  final String partnerPreferenceId;
  Partnerprefs({
    required this.gender,
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
    required this.userDetaiId,
    required this.partnerPreferenceId,
  });
  factory Partnerprefs.fromjson(Map<String, dynamic> json) {
    return Partnerprefs(
        gender: json['lookingFor'],
        minage: json['ageFrom'],
        maxage: json['ageTo'],
        minheight: json['heightFrom'],
        maxheight: json['heightTo'],
        city: json['city'],
        physicalstatus: json['bodyType'],
        religion: json['religion'],
        caste: json['caste'],
        education: json['education'],
        employedin: json['employedIn'],
        occupation: json['occupation'],
        userDetaiId: json['userDetailId'],
        partnerPreferenceId: json['partner_preference_id']);
  }
}
