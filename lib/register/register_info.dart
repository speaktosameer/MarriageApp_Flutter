import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:marriage/data/model/user.dart';
import 'package:marriage/process_response.dart';
import 'package:marriage/register/education.dart';
import 'package:marriage/register/lifestyle_info.dart';
import 'package:marriage/register/submit_regester.dart';
import 'package:marriage/widgets/all_list.dart';
import 'package:marriage/widgets/controller_helper.dart';

import '../data/controller/post_controller.dart';
import '../provider/auth_provider_controller.dart';
import '../widgets/Custom_text_field.dart';

class RegisterInfo extends StatefulWidget {
   RegisterInfo({
    required this.firstName,
     required this.lastName,
      this.gender,
     required this.mobileNumber,
      this.profileFor,
     Key? key,
      }) : super(key: key);
  String firstName ,lastName  , mobileNumber ;
  String? profileFor,gender;

  @override
  State<RegisterInfo> createState() => _RegisterInfoState();
}

class _RegisterInfoState extends State<RegisterInfo> {

 late TextEditingController _agecontroller ;
 late TextEditingController _emailcontroller;
 late TextEditingController _passcontroller;
 late TextEditingController _repasscontroller;

 final GlobalKey<FormState> formkey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _agecontroller = TextEditingController();
    _emailcontroller = TextEditingController();
    _passcontroller = TextEditingController();
    _repasscontroller = TextEditingController();
  }
  @override
  void dispose() {
    super.dispose();
    _agecontroller.dispose();
    _emailcontroller.dispose();
    _passcontroller.dispose();
    _repasscontroller.dispose();
  }

  late String fname ,pass ,lname ,num ,email ,age;
  String? emailErorr ,passError;
  bool isLoading = false;


  int validateEmail(String emailAddress) {
    String patttern = r'^[\w-.]+@([\w-]+.)+[\w-]{2,4}$';
    RegExp regExp = RegExp(patttern);
    if (emailAddress.isEmpty || emailAddress.isEmpty) {
      return 1;
    } else if (!regExp.hasMatch(emailAddress)) {
      return 2;
    } else {
      return 0;
    }
  }
  int validatePassword(String pswd) {
    if (pswd.isEmpty) {
      return 1;
    } else if (pswd.isNotEmpty && pswd.length <= 8) {
      return 2;
    } else {
      return 0;
    }
  }

  String bloodgrpselect = '';

  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    double screenheight = MediaQuery.of(context).size.height;
    return SafeArea(

      child: Scaffold(
        body: ListView(children: [
          Form(
            key: formkey,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Provide us your basic information',
                    style: TextStyle(fontSize: 20),
                  ),
                  Row(
                    children: [
                      const Text('If you need support, please contact us'),
                      TextButton(
                          onPressed: () {}, child: const Text('Contact Page'))
                    ],
                  ),

                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                      height: screenheight * 0.088,
                      width: screenwidth * 1,
                      margin: const EdgeInsets.all(5),

                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Prefered time to call you',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),

                            DropdownButtonFormField2(
                              buttonElevation: 3,
                              decoration: InputDecoration(
                                  isDense: true,
                                  filled: true,
                                  fillColor: Colors.transparent,
                                  contentPadding: EdgeInsets.zero,
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: Colors.deepOrange),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: Colors.black,
                                    ),
                                    borderRadius: BorderRadius.circular(10),
                                  )),
                              isExpanded: true,
                              hint: const Text(
                                'Select...',
                                style: TextStyle(fontSize: 14),
                              ),
                              icon: const Icon(
                                Icons.arrow_drop_down,
                                color: Colors.black45,
                              ),
                              iconSize: 30,
                              buttonHeight: 50,
                              buttonPadding:
                                  const EdgeInsets.only(left: 20, right: 10),
                              dropdownDecoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              items: AllList().callItems
                                  .map((item) => DropdownMenuItem<String>(
                                        value: item,
                                        child: Text(
                                          item,
                                          style: const TextStyle(
                                            fontSize: 14,
                                          ),
                                        ),
                                      ))
                                  .toList(),
                              // validator: (value) {
                              //   if (value == null) {
                              //     return 'Please select gender.';
                              //   }
                              //   return null;
                              // },
                              onChanged: (value) {
                                //Do something when changing the item if you want.
                              },
                              onSaved: (value) {
                                AllList().timetocallvalue = value.toString();
                              },
                            ),
                          ])),

                  //age textFild
                  CustomTextField(
                    text1: 'Age',
                    controller: _agecontroller,
                    hinttext: 'Enter age',
                    title: 'Age',
                  ),

                 //boold
                  Container(
                      height: screenheight * 0.088,
                      width: screenwidth * 1,
                      margin: const EdgeInsets.all(5),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Blood Group',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            DropdownButtonFormField2(
                              buttonElevation: 3,
                              decoration: InputDecoration(
                                  isDense: true,
                                  filled: true,
                                  fillColor: Colors.transparent,
                                  contentPadding: EdgeInsets.zero,
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: Colors.deepOrange),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: Colors.black,
                                    ),
                                    borderRadius: BorderRadius.circular(10),
                                  )),
                              isExpanded: true,
                              hint: const Text(
                                'Select...',
                                style: TextStyle(fontSize: 14),
                              ),
                              icon: const Icon(
                                Icons.arrow_drop_down,
                                color: Colors.black45,
                              ),
                              iconSize: 30,
                              buttonHeight: 50,
                              buttonPadding:
                                  const EdgeInsets.only(left: 20, right: 10),
                              dropdownDecoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              items: AllList().bloodgrp
                                  .map((item) => DropdownMenuItem<String>(
                                        value: item,
                                        child: Text(
                                          item,
                                          style: const TextStyle(
                                            fontSize: 14,
                                          ),
                                        ),
                                      ))
                                  .toList(),
                              // validator: (value) {
                              //   if (value == null) {
                              //     return 'Please select gender.';
                              //   }
                              //   return null;
                              // },
                              onChanged: (value) {
                                bloodgrpselect = value.toString();
                              },
                              onSaved: (value) {
                                AllList().timetocallvalue = value.toString();
                              },
                            ),
                          ])),

                  //email
                  CustomTextField(
                    validate: (value) {
                      int res = validateEmail(_emailcontroller.text);
                      if (res == 1) {
                        return "Please fill email address";
                      } else if (res == 2) {
                        return "Please enter valid email";
                      } else {
                        return null;
                      }
                    },
                    text1: 'Email address',
                    controller: _emailcontroller,
                    hinttext: 'Enter email',
                    title: 'Email address',
                  ),

                  //password
                  CustomTextField(
                      validate: (value) {
                        int res = validatePassword(_passcontroller.text);
                        if (res == 1) {
                          return "Please enter password";
                        } else if (res == 2) {
                          return "Please enter minimum  7 characters";
                        } else {
                          return null;
                        }
                      },
                      text1: 'Password',
                      controller: _passcontroller,
                      hinttext: 'Enter password',
                      title: 'Password'),

                  //conformPass
                  CustomTextField(
                      validate: (value) {
                        if (_repasscontroller.text != _repasscontroller.text) {
                          return "Please enter same password";
                        } else {
                          return null;
                        }
                      },
                      text1: 'Repass',
                      controller: _repasscontroller,
                      hinttext: 'Re-enter password',
                      title: 'Confirm password'),

                  ElevatedButton(
                    onPressed: () {
                      regesert();
                    },
                    child: Text("contunio"),
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xFF000000),
                      minimumSize: Size(340, 60),
                      elevation: 2,
                      alignment: AlignmentDirectional.center,
                      padding: EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                    ),
                  ),


                 InkWell(
                            onTap: () async {
                              print("object");
                              regesert();
                            },
                            child: Container(
                              margin: EdgeInsets.only(
                                  top: 25, left: screenwidth / 4),
                              padding: const EdgeInsets.all(8),
                              height: screenheight * 0.05,
                              width: screenwidth / 2,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.deepOrange),
                              child: const Text(
                                'Continue',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ))

                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }
 void performRegester(){
    if(checkData()){
      regesert();
    }
  }
  bool checkData(){
    if(_emailcontroller.text.isNotEmpty &&
        _passcontroller.text.isNotEmpty &&
        _agecontroller.text.isNotEmpty
    ){
      return true;
    }
    _emailcontroller.text.isEmpty ? "email requird " : null ;
    _passcontroller.text.isEmpty ? "password requird  " : null ;
    _agecontroller.text.isEmpty ? "age requird  " : null ;
    return false;
  }
  void regester() {
    // Navigator.push(context,
    //     MaterialPageRoute(builder: (context)=> Education(
    //       firstName: widget.firstName,
    //       lastName: widget.lastName,
    //       gender: widget.gender,
    //       mobileNumber: widget.mobileNumber,
    //       profileFor: widget.profileFor,
    //       email: _emailcontroller.text,
    //       age: _agecontroller.text,
    //       timeToCall:AllList().timetocallvalue,
    //       booldType: bloodgrpselect,
    //       password: _passcontroller.text,
    //     )
    //
    // ));
  }

 regesert()async {
   ProcessResponse processResponse =
   await AuthController().singUp(user);
   if (processResponse.succsess) {
     Navigator.pushNamed(context, "/login");
   }
   else{
     context.snackBar(
         massage: processResponse.massage, error: !processResponse.succsess);
   }
   context.snackBar(
       massage: processResponse.massage, error: !processResponse.succsess);
   print(processResponse.massage);

 }

 UserRegester get user {
   UserRegester user = UserRegester();
   user.firstName = widget.firstName;
   user.lastName = widget.lastName;
   user.mobileNumber = widget.mobileNumber;
   user.email = _emailcontroller.text.trim();
   user.password = _passcontroller.text.trim();
   user.profileFor = widget.profileFor;
   user.age =  int.parse( _agecontroller.text.trim());
   return user;
 }
}

class Registerdrop {
  final String name;
  Registerdrop({required this.name});
  static List<Registerdrop> dropList = [
    Registerdrop(name: 'Morning'),
    Registerdrop(name: 'Evening'),
    Registerdrop(name: 'Night'),
    Registerdrop(name: 'Afternoon'),
    Registerdrop(name: 'Any time is ok'),
  ];
}

