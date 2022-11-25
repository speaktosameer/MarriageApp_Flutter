import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:marriage/login/login.dart';
import 'package:marriage/process_response.dart';
import 'package:marriage/register/about_user.dart';
import 'package:marriage/register/register_info.dart';
import 'package:marriage/register/submit_regester.dart';
import 'package:marriage/widgets/controller_helper.dart';

import '../data/model/user.dart';
import '../provider/auth_provider_controller.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  String dropDownValu = "Select Profile";
  int? selectedvalue = 0;
  TextEditingController namecontroller = TextEditingController();
  TextEditingController numbercontroller = TextEditingController();
  TextEditingController lastnamecontroller = TextEditingController();


  final GlobalKey<FormState> formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    double screenheight = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.deepOrange,
          actions: [
            Container(
                padding: const EdgeInsets.all(5),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Already a member?',
                        style: TextStyle(color: Colors.white),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (context) {
                            return const Login();
                          }));
                        },
                        child: const Text(
                          'LOGIN',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      )
                    ])),
          ],
        ),
        body: ListView(children: [
          Consumer(builder: (context, ref, child) {
            return Form(
              key: formkey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.all(10),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'Find your perfect match at',
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.w400),
                          ),
                          Text(
                            'Marriage Station',
                            style: TextStyle(
                                fontSize: 30, fontWeight: FontWeight.w600),
                          ),
                        ]),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Container(
                      margin: const EdgeInsets.all(15),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Profile for',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w600),
                            ),
                            DropdownButton<Registerdrop>(
                              hint: Text(dropDownValu),
                              items: [
                                ...Registerdrop.dropList
                                    .map((e) => DropdownMenuItem(
                                        value: e, child: Text(e.name)))
                                    .toList(),
                              ],
                              onChanged: (value) {
                                setState(() {
                                  dropDownValu = value!.name;
                                });
                              },
                            ),
                          ])),
                  Container(
                    margin: const EdgeInsets.all(10),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Gender',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w600)),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Radio<int>(
                                  activeColor: Colors.red.shade600,
                                  value: 1,
                                  groupValue: selectedvalue,
                                  onChanged: (value) {
                                    setState(() {
                                      selectedvalue = value;
                                    });
                                  }),
                              const Text('Male'),
                              Radio<int>(
                                  activeColor: Colors.red.shade600,
                                  value: 2,
                                  groupValue: selectedvalue,
                                  onChanged: (value) {
                                    setState(() {
                                      selectedvalue = value;
                                    });
                                  }),
                              const Text('Female')
                            ],
                          ),
                        ]),
                  ),
                  Container(
                    margin: const EdgeInsets.all(10),

                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('First name',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w600)),
                          const SizedBox(
                            height: 5,
                          ),
                          TextFormField(
                            validator: (name) {
                              return namecontroller.text.isNotEmpty ? null : "please enter name";
                            },
                            controller: namecontroller,
                            decoration: InputDecoration(
                                hintText: 'Enter your name',
                                focusedBorder: outlinefocusBorder(
                                    color: Colors.deepOrange),
                                enabledBorder: outlinefocusBorder(),
                                errorBorder:
                                    outlinefocusBorder(color: Colors.red),
                                focusedErrorBorder:
                                    outlinefocusBorder(color: Colors.red)),
                          ),
                        ]),
                  ),
                  Container(
                    margin: const EdgeInsets.all(10),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Last name',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w600)),
                          const SizedBox(
                            height: 5,
                          ),
                          TextFormField(
                            validator: (name) {
                              return lastnamecontroller.text.isNotEmpty
                                  ? null
                                  : "please enter last name";
                            },
                            controller: lastnamecontroller,
                            decoration: InputDecoration(
                                hintText: 'Enter your last name',
                                focusedBorder: outlinefocusBorder(
                                    color: Colors.deepOrange),
                                enabledBorder: outlinefocusBorder(),
                                errorBorder:
                                    outlinefocusBorder(color: Colors.red),
                                focusedErrorBorder:
                                    outlinefocusBorder(color: Colors.red)),
                          ),
                        ]),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 10 , right:  10 ,left: 10 ,bottom: 20),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Mobile Number',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w600)),
                          const SizedBox(
                            height: 5,
                          ),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(15),
                                  decoration: BoxDecoration(
                                      color: Colors.grey.shade100,
                                      borderRadius: BorderRadius.circular(10)),
                                  height: screenheight * 0.075,
                                  width: screenwidth / 4.5,
                                  child: const Text(
                                    '+ 977',
                                    style: TextStyle(fontSize: 20),
                                  ),
                                ),
                                Container(
                                  //padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      // color: Colors.white,
                                      borderRadius: BorderRadius.circular(10)),
                                  height: screenheight * 0.095,
                                  width: screenwidth / 1.5,
                                  child: TextFormField(
                                    validator: (number) {
                                      return numbercontroller.text.isNotEmpty
                                          ? null
                                          : "please enter your number";
                                    },
                                    keyboardType: TextInputType.emailAddress,
                                    controller: numbercontroller,
                                    decoration: InputDecoration(
                                        hintText: 'Enter your number',
                                        focusedBorder: outlinefocusBorder(
                                            color: Colors.deepOrange),
                                        enabledBorder: outlinefocusBorder(),
                                        errorBorder: outlinefocusBorder(
                                            color: Colors.red),
                                        focusedErrorBorder: outlinefocusBorder(
                                            color: Colors.red)),
                                  ),
                                ),
                              ]),
                        ]),
                  ),
                  InkWell(
                      onTap: () {
                        regester();
                      },
                      child: Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.only(left: screenwidth / 4),
                        // padding: const EdgeInsets.all(8),
                        height: screenheight * 0.05,
                        width: screenwidth / 2,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.deepOrange),
                        child: const Text(
                          'Continue',
                          style: TextStyle(color: Colors.white, fontSize: 16),
                          textAlign: TextAlign.center,
                        ),
                      ))
                ],
              ),
            );
          }),
        ]));
  }

 void regester(){
    if(numbercontroller.text.isNotEmpty &&
        namecontroller.text.isNotEmpty &&
        lastnamecontroller.text.isNotEmpty){
      Navigator.push(context, MaterialPageRoute(builder: (context)=>
          RegisterInfo(
              firstName: numbercontroller.text,
              lastName: lastnamecontroller.text,
              gender: selectedvalue ==0 ? "meal" :"femeal",
              mobileNumber: numbercontroller.text,
              profileFor: dropDownValu)
      ) );
    }}
  OutlineInputBorder outlinefocusBorder({Color color = Colors.black}) {
    return OutlineInputBorder(
        borderSide: BorderSide(color: color),
        gapPadding: 0.2,
        borderRadius: BorderRadius.circular(15));
  }
}

class Registerdrop {
  final String name;
  Registerdrop({required this.name});
  static List<Registerdrop> dropList = [
    Registerdrop(name: 'Myself'),
    Registerdrop(name: 'Daughter'),
    Registerdrop(name: 'Son'),
    Registerdrop(name: 'Sister'),
    Registerdrop(name: 'Brother'),
    Registerdrop(name: 'Relative'),
    Registerdrop(name: 'Friend')
  ];
}
