import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:marriage/data/controller/post_controller.dart';
import 'package:marriage/data/model/login_info_model.dart';
import 'package:marriage/data/model/register_model.dart';
import 'package:marriage/data/model/user.dart';
import 'package:marriage/process_response.dart';
import 'package:marriage/provider/auth_provider_controller.dart';
import 'package:marriage/register/submit_regester.dart';
import 'package:marriage/widgets/controller_helper.dart';

class AboutUser extends StatefulWidget {
  const AboutUser(
      {Key? key,})
      : super(key: key);
  @override
  State<AboutUser> createState() => _AboutUserState();
}

class _AboutUserState extends State<AboutUser> {
  File? img;
  Future pickImage() async {
    final img = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (img == null) return;
    final imgTemporary = File(img.path);
    setState(() {
      this.img = imgTemporary;
    });
  }


  TextEditingController aboutcontroller = TextEditingController();
  bool isloading = false;

  @override
  Widget build(BuildContext context) {
    double screenheight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(10),
        children: [
          Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'Some informations about you',
                  style: TextStyle(fontSize: 20),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Text('If you need support, please contact us'),
                    TextButton(
                        onPressed: () {}, child: const Text('Contact Page'))
                  ],
                ),

               //uplode images
                Container(
                    height: 150,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: Colors.red),

                    child: img != null
                        ? CircleAvatar(
                            radius: 150,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child: Image.file(
                                height: 150,
                                width: 150,
                                img!,
                                fit: BoxFit.cover,
                              ),
                            ),
                          )
                        : CircleAvatar(
                            backgroundColor: Colors.grey.shade200,
                            radius: 150,
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(100),
                                child: const Icon(
                                  Icons.person,
                                  size: 80,
                                  color: Colors.grey,
                                )),
                          )),
                TextButton(
                    onPressed: () {
                      pickImage();
                    },
                    child: const Text('Upload Image')),


                const Text(
                  'Tell About yourself',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),

                //tell us about you
                Container(
                  margin: const EdgeInsets.all(10),
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Colors.grey.shade200.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(10)),
                  height: screenheight / 3,
                  child: TextFormField(
                    textInputAction: TextInputAction.done,
                    maxLines: 7,
                    controller: aboutcontroller,
                    decoration: const InputDecoration(
                      hintText: 'Write something intresting',
                      border: InputBorder.none,
                    ),
                  ),
                ),

                //uplode item in api
                         InkWell(
                          onTap: ()  {
                            regesert();
                            print("malsa");
                          },
                          child: Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color: Colors.deepOrange,
                                borderRadius: BorderRadius.circular(10)),
                            height: 40,
                            width: 120,
                            child: const Text('Continue',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500)),
                          ),
                        )
        ],)
    ]),
    );
  }

  regesert()async {

    // ProcessResponse processResponse = await AuthController().singUp(user);
    // if (processResponse.succsess) {
    //   Navigator.pushNamed(context, '/login');
    //   print("regester");
    //
    // }
    // else{
    // }
    // context.snackBar(
    //     massage: processResponse.massage, error: !processResponse.succsess);

  }

  // UserModel get user {
  //   UserModel user = UserModel();
  //   user.firstName = SubmitRegester().firstName!;
  //   user.lastName = SubmitRegester().lastName!;
  //   user.password = SubmitRegester().password!;
  //   user.mobileNumber =SubmitRegester().mobilNumber!;
  //   user.profileFor =SubmitRegester().profileFor!;
  //   user.email =SubmitRegester().email!;
  //   user.education =SubmitRegester().educationvalue!;
  //   //user.age = 2;
  //   user.height =20;
  //   user.weight =SubmitRegester().weight!;
  //   user.dateOfBirth =SubmitRegester().birthday!;
  //   user.bodyType =SubmitRegester().bodyType!;
  //   user.skinTone =SubmitRegester().skinTone!;
  //   user.smoke =SubmitRegester().smokingHabit!;
  //   user.marriedBrother =SubmitRegester().brotherMarried!;
  //   user.marriedSister =SubmitRegester().sisterMarried!;
  //   user.maritalStatus =SubmitRegester().marriedstatus!;
  //   user.manglik =SubmitRegester().manglik!;
  //   user.occupation =SubmitRegester().occupation!;
  //   user.mothersName =SubmitRegester().motherName!;
  //   user.fatherName =SubmitRegester().fathreName!;
  //   user.familyType =SubmitRegester().familytype!;
  //   user.familyStatus =SubmitRegester().familystatus!;
  //   user.aboutFamily =SubmitRegester().familyvalues!;
  //   user.noOfBrothers =SubmitRegester().brother!;
  //   user.noOfSisters =SubmitRegester().sister!;
  //   user.anualIncome =SubmitRegester().income!;
  //   user.religion =SubmitRegester().religion!;
  //   user.employedIn =SubmitRegester().work!;
  //   user.address =SubmitRegester().land!;
  //   user.caste =SubmitRegester().caste!;
  //   user.subCaste =SubmitRegester().subcaste!;
  //   user.maritalStatus =SubmitRegester().marriedstatus!;
  //   user.gothra =SubmitRegester().gotra!;
  //   user.timeToCall =SubmitRegester().time!;
  //   user.hobby =SubmitRegester().hobby!;
  //   user.birthPlace =SubmitRegester().place!;
  //   user.languageKnown =SubmitRegester().language!;
  //   user.livingCountry =SubmitRegester().familylocation!;
  //   user.city =SubmitRegester().house!;
  //   user.gender =SubmitRegester().selected!;
  //   user.description =SubmitRegester().description!;
  //   user.residenceStatus =SubmitRegester().rasi!;
  //   user.bloodGroup =SubmitRegester().bloodgrp!;
  //
  //
  //
  //
  //
  //   return user;
  // }
}
