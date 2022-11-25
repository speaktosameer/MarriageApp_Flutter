class UserLogin {
  String? status;
  User? user;
  String? token;

  UserLogin();

  UserLogin.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    token = json['token'];
  }

}

class User {
  String userId = "";
  String email = "";
  String firstName = "";
  String lastName = "";
  String createdAt = "";
  String updatedAt = "";
  String mobileNumber = "";
  UserDetail? userDetail;
  List<Roles>? roles;

  User();

  User.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    email = json['email'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    mobileNumber = json['mobileNumber'];
    userDetail = json['UserDetail'] != null
        ? new UserDetail.fromJson(json['UserDetail'])
        : null;
    if (json['Roles'] != null) {
      roles = <Roles>[];
      json['Roles'].forEach((v) {
        roles!.add(new Roles.fromJson(v));
      });
    }
  }

}

class UserDetail {
  String? userDetailId;
  String? profileFor;
  int? age;
  String? height;
  String? dateOfBirth;
  String? weight;
  String? gender;
  String? maritalStatus;
  String? diet;
  String? religionType;
  String? castePosition;
  String? divorceReason;
  String? noOfChildren;
  String? childrenLivingWith;
  String? anyDisability;
  String? educationFaculty;
  String? college;
  String? workLocation;
  String? organizationName;
  String? country;
  String? provience;
  String? district;
  String? rural;
  String? city;
 String? wardNo;
 String? localAdress;
 String? permanentAdress;
 String? fullAdress;
 String? citizenship;
 String? house;
 String? land;
 String? familyValues;
 String? createdBy;
 String? referencedBy;
 String? motherTongue;
 String? languageKnown;
 String? birthTime;
  String? familyStatus;
  String? smoke;
  String? drink;
  String? bodyType;
  String? skinTone;
  String? birthPlace;
  String? bloodGroup;
  String? hobby;
  String? description;
  String? religion;
  String? caste;
  String? subCaste;
  String? manglik;
  String? star;
  String? horoscope;
  String? gothra;
  String? moonSign;
  String? residenceStatus;
  String? timeToCall;
  String? livingCountry;
  String? state;
  String? address;
  String? education;
  String? occupation;
  String? designation;
  String? employedIn;
  String? anualIncome;
  String? familyType;
  String? fatherName;
  String? mothersName;
  String? mothersOccupation;
  String? fathersOccupation;
  String? noOfSisters;
  String? noOfBrothers;
  String? aboutFamily;
  String? marriedSister;
  String? marriedBrother;
  String? active;
  String? shortList;
  String? blockList;
  String? paidMember;
  String? featured;
  String? suspended;
  String? verified;
  String? userId;
  String? createdAt;
  String? updatedAt;

  UserDetail();

  UserDetail.fromJson(Map<String, dynamic> json) {
    userDetailId = json['userDetail_id'];
    profileFor = json['profileFor'];
    age = json['age'];
    height = json['height'];
    dateOfBirth = json['dateOfBirth'];
    weight = json['weight'];
    gender = json['gender'];
    maritalStatus = json['maritalStatus'];
    diet = json['diet'];
    religionType = json['religionType'];
    castePosition = json['castePosition'];
    divorceReason = json['divorceReason'];
    noOfChildren = json['noOfChildren'];
    childrenLivingWith = json['childrenLivingWith'];
    anyDisability = json['anyDisability'];
    educationFaculty = json['educationFaculty'];
    college = json['college'];
    workLocation = json['workLocation'];
    organizationName = json['organizationName'];
    country = json['country'];
    provience = json['provience'];
    district = json['district'];
    rural = json['rural'];
    city = json['city'];
    wardNo = json['wardNo'];
    localAdress = json['localAdress'];
    permanentAdress = json['permanentAdress'];
    fullAdress = json['fullAdress'];
    citizenship = json['citizenship'];
    house = json['house'];
    land = json['land'];
    familyValues = json['familyValues'];
    familyStatus = json['familyStatus'];
    smoke = json['smoke'];
    drink = json['drink'];
    motherTongue = json['motherTongue'];
    languageKnown = json['languageKnown'];
    bodyType = json['bodyType'];
    skinTone = json['skinTone'];
    createdBy = json['createdBy'];
    referencedBy = json['referencedBy'];
    birthPlace = json['birthPlace'];
    birthTime = json['birthTime'];
    bloodGroup = json['bloodGroup'];
    hobby = json['hobby'];
    description = json['description'];
    religion = json['religion'];
    caste = json['caste'];
    subCaste = json['subCaste'];
    manglik = json['manglik'];
    star = json['star'];
    horoscope = json['horoscope'];
    gothra = json['gothra'];
    moonSign = json['moonSign'];
    residenceStatus = json['residenceStatus'];
    timeToCall = json['timeToCall'];
    livingCountry = json['livingCountry'];
    state = json['state'];
    address = json['address'];
    education = json['education'];
    occupation = json['occupation'];
    designation = json['designation'];
    employedIn = json['employedIn'];
    anualIncome = json['anualIncome'];
    familyType = json['familyType'];
    fatherName = json['fatherName'];
    mothersName = json['mothersName'];
    mothersOccupation = json['mothersOccupation'];
    fathersOccupation = json['fathersOccupation'];
    noOfSisters = json['noOfSisters'];
    noOfBrothers = json['noOfBrothers'];
    aboutFamily = json['aboutFamily'];
    marriedSister = json['marriedSister'];
    marriedBrother = json['marriedBrother'];
    active = json['active'];
    shortList = json['shortList'];
    blockList = json['blockList'];
    paidMember = json['paidMember'];
    featured = json['featured'];
    suspended = json['suspended'];
    verified = json['verified'];
    userId = json['userId'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

}

class Roles {
  String? id;
  String? role;
  String? userId;
  String? createdAt;
  String? updatedAt;

  Roles();

  Roles.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    role = json['role'];
    userId = json['userId'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }


}

