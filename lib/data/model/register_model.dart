class RegisterModel {

  late String name;
  late String email;
  late String password;
  late String number;
  late String lastname;

   String? age;
   String? height;
   String? bodytype;
   String? skintone;
   String? mothertingue;
   String? materialstatus;
   String? horoscope;
   String? bloodgroup;
   String? aboutme;
   String? religion;
   String? caste;
   String? gotra;
   String? address;
   String? city;
   String? education;
   String? occupation;
   String? employedin;
   String? annualincome;
   String? familystatus;
   String? familytype;
   String? profilefor;
   String? gender;
   String? birthday;
   String? weight;
   String? hobbies;
   String? birthTime;
   String? birthPlace;
   String? timetocall;
   String? orgname;

  RegisterModel();

  Map<String, dynamic> toJson() => {
        "profileFor": profilefor,
        "bloodGroup": bloodgroup,
        "age": age,
        "height": height,
        "dateOfBirth": birthday,
        "weight": weight,
        "gender": gender,
        "maritalStatus": materialstatus,
        "motherTongue": mothertingue,
        "bodyType": bodytype,
        "skinTone": skintone,
        "birthPlace": birthPlace,
        "birthTime": birthTime,
        "hobby": hobbies,
        "description": aboutme,
        "religion": religion,
        "caste": caste,
        "horoscope": horoscope,
        "timeToCall": timetocall,
        "city": city,
        "address": address,
        "education": education,
        "occupation": occupation,
        "employedIn": orgname,
        "anualIncome": annualincome,
        "familyType": familytype,
        "familyStatus": familystatus,
        "firstName": name,
        "lastName": lastname,
        "email": email,
        "mobileNumber": number,
        "password": password,
        "bloodGroup": bloodgroup ?? "A+",
      };
}
