class LoginInfoModel {
  LoginInfoModel({
    required this.usersData,
  });

  UsersData usersData;

  factory LoginInfoModel.fromJson(Map<String, dynamic> json) =>
      LoginInfoModel(usersData: UsersData.fromJson(json["usersData"]),);
}

class UsersData {
  UsersData({
    required this.userDetailId,
    this.profileFor,
    required this.age,
    required this.height,
    required this.dateOfBirth,
    required this.weight,
    this.gender,
    required this.maritalStatus,
    this.diet,
    this.religionType,
    this.castePosition,
    this.divorceReason,
    this.noOfChildren,
    this.childrenLivingWith,
    this.anyDisability,
    this.educationFaculty,
    this.college,
    this.workLocation,
    this.organizationName,
    this.country,
    this.provience,
    this.district,
    this.rural,
    this.city,
    this.wardNo,
    this.localAdress,
    this.permanentAdress,
    this.fullAdress,
    this.citizenship,
    this.house,
    this.land,
    this.familyValues,
    required this.familyStatus,
    required this.smoke,
    required this.drink,
    this.motherTongue,
    this.languageKnown,
    required this.bodyType,
    required this.skinTone,
    this.createdBy,
    this.referencedBy,
    this.birthPlace,
    this.birthTime,
    this.bloodGroup,
    required this.hobby,
    required this.description,
    required this.religion,
    required this.caste,
    this.subCaste,
    this.manglik,
    this.star,
    this.horoscope,
    this.gothra,
    this.moonSign,
    this.residenceStatus,
    this.timeToCall,
    this.livingCountry,
    this.state,
    required this.address,
    required this.education,
    required this.occupation,
    this.designation,
    required this.employedIn,
    required this.anualIncome,
    required this.familyType,
    this.fatherName,
    this.mothersName,
    this.mothersOccupation,
    this.fathersOccupation,
    this.noOfSisters,
    this.noOfBrothers,
    this.aboutFamily,
    this.marriedSister,
    this.marriedBrother,
    this.active,
    this.shortList,
    this.blockList,
    this.paidMember,
    this.featured,
    this.suspended,
    this.verified,
    this.userId,
    required this.user,
  });

  String userDetailId;
  dynamic profileFor;
  int age;
  String height;
  String dateOfBirth;
  String weight;
  dynamic gender;
  String maritalStatus;
  dynamic diet;
  dynamic religionType;
  dynamic castePosition;
  dynamic divorceReason;
  dynamic noOfChildren;
  dynamic childrenLivingWith;
  dynamic anyDisability;
  dynamic educationFaculty;
  dynamic college;
  dynamic workLocation;
  dynamic organizationName;
  dynamic country;
  dynamic provience;
  dynamic district;
  dynamic rural;
  dynamic city;
  dynamic wardNo;
  dynamic localAdress;
  dynamic permanentAdress;
  dynamic fullAdress;
  dynamic citizenship;
  dynamic house;
  dynamic land;
  dynamic familyValues;
  String familyStatus;
  String smoke;
  String drink;
  dynamic motherTongue;
  dynamic languageKnown;
  String bodyType;
  String skinTone;
  dynamic createdBy;
  dynamic referencedBy;
  dynamic birthPlace;
  dynamic birthTime;
  String? bloodGroup;
  String hobby;
  String description;
  String religion;
  String caste;
  dynamic subCaste;
  dynamic manglik;
  dynamic star;
  dynamic horoscope;
  dynamic gothra;
  dynamic moonSign;
  dynamic residenceStatus;
  dynamic timeToCall;
  dynamic livingCountry;
  dynamic state;
  String address;
  String education;
  String occupation;
  dynamic designation;
  String employedIn;
  String anualIncome;
  String familyType;
  dynamic fatherName;
  dynamic mothersName;
  dynamic mothersOccupation;
  dynamic fathersOccupation;
  dynamic noOfSisters;
  dynamic noOfBrothers;
  dynamic aboutFamily;
  dynamic marriedSister;
  dynamic marriedBrother;
  String? active;
  String? shortList;
  String? blockList;
  String? paidMember;
  String? featured;
  String? suspended;
  String? verified;
  String? userId;
  User user;

  factory UsersData.fromJson(Map<String, dynamic> json) => UsersData(
        userDetailId: json["userDetail_id"],
        profileFor: json["profileFor"],
        age: json["age"],
        height: json["height"],
        dateOfBirth: json["dateOfBirth"],
        weight: json["weight"],
        gender: json["gender"],
        maritalStatus: json["maritalStatus"],
        diet: json["diet"],
        religionType: json["religionType"],
        castePosition: json["castePosition"],
        divorceReason: json["divorceReason"],
        noOfChildren: json["noOfChildren"],
        childrenLivingWith: json["childrenLivingWith"],
        anyDisability: json["anyDisability"],
        educationFaculty: json["educationFaculty"],
        college: json["college"],
        workLocation: json["workLocation"],
        organizationName: json["organizationName"],
        country: json["country"],
        provience: json["provience"],
        district: json["district"],
        rural: json["rural"],
        city: json["city"],
        wardNo: json["wardNo"],
        localAdress: json["localAdress"],
        permanentAdress: json["permanentAdress"],
        fullAdress: json["fullAdress"],
        citizenship: json["citizenship"],
        house: json["house"],
        land: json["land"],
        familyValues: json["familyValues"],
        familyStatus: json["familyStatus"],
        smoke: json["smoke"],
        drink: json["drink"],
        motherTongue: json["motherTongue"],
        languageKnown: json["languageKnown"],
        bodyType: json["bodyType"],
        skinTone: json["skinTone"],
        createdBy: json["createdBy"],
        referencedBy: json["referencedBy"],
        birthPlace: json["birthPlace"],
        birthTime: json["birthTime"],
        bloodGroup: json["bloodGroup"] ?? "Null",
        hobby: json["hobby"],
        description: json["description"],
        religion: json["religion"],
        caste: json["caste"],
        subCaste: json["subCaste"],
        manglik: json["manglik"],
        star: json["star"],
        horoscope: json["horoscope"] ?? "Null",
        gothra: json["gothra"],
        moonSign: json["moonSign"],
        residenceStatus: json["residenceStatus"],
        timeToCall: json["timeToCall"],
        livingCountry: json["livingCountry"],
        state: json["state"],
        address: json["address"],
        education: json["education"],
        occupation: json["occupation"],
        designation: json["designation"],
        employedIn: json["employedIn"],
        anualIncome: json["anualIncome"],
        familyType: json["familyType"],
        fatherName: json["fatherName"],
        mothersName: json["mothersName"],
        mothersOccupation: json["mothersOccupation"],
        fathersOccupation: json["fathersOccupation"],
        noOfSisters: json["noOfSisters"],
        noOfBrothers: json["noOfBrothers"],
        aboutFamily: json["aboutFamily"],
        marriedSister: json["marriedSister"],
        marriedBrother: json["marriedBrother"],
        active: json["active"],
        shortList: json["shortList"],
        blockList: json["blockList"],
        paidMember: json["paidMember"],
        featured: json["featured"],
        suspended: json["suspended"],
        verified: json["verified"],
        userId: json["userId"],
        user: User.fromJson(json["User"]),
      );
}

class User {
  User({
    required this.email,
    required this.mobileNumber,
    required this.firstName,
    required this.lastName,
  });

  String email;
  String? mobileNumber;
  String firstName;
  String lastName;

  factory User.fromJson(Map<String, dynamic> json) => User(
        email: json["email"],
        mobileNumber: json["mobileNumber"],
        firstName: json["firstName"],
        lastName: json["lastName"],
      );
}
