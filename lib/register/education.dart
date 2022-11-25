import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:marriage/register/kundali_info.dart';
import 'package:marriage/register/submit_regester.dart';
import '../widgets/Custom_text_field.dart';
import '../widgets/all_list.dart';

class Education extends StatefulWidget {
   Education({Key? key,
     required this.firstName,
     required this.lastName,
     required this.gender,
     required this.mobileNumber,
     required this.profileFor,
     required this.email,
     required this.password,
     this.timeToCall,
     this.age,
     this.booldType,
   }) : super(key: key);

   String firstName ,lastName ,gender ,password, mobileNumber ,profileFor ,email;
   String? timeToCall ,age ,booldType ;

   State<Education> createState() => _EducationState();
}
class _EducationState extends State<Education> {
  TextEditingController facultycontroller = TextEditingController();
  TextEditingController incomecontroller = TextEditingController();
  TextEditingController occupationcontroller = TextEditingController();
  TextEditingController orgcontroller = TextEditingController();
  TextEditingController workcontroller = TextEditingController();

  String? educationvalue;
  String? univalue;
  String? lifevalue;

  String education = '';
  String univalv = '';
  String lifevalv = '';

  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    double screenheight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(10),
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Some informations about your kundali',
                style: TextStyle(fontSize: 20),
              ),
              Row(
                children: [
                  const Text('If you need support, please contact us'),
                  TextButton(
                      onPressed: () {}, child: const Text('Contact Us'))
                ],
              ),

              const Text(
                "Highest Education",
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 5,
              ),

              //education.......
              DropdownButtonFormField2(
                buttonElevation: 3,
                decoration: InputDecoration(
                    isDense: true,
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding: EdgeInsets.zero,
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.deepOrange),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.black),
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
                buttonPadding: const EdgeInsets.only(left: 20, right: 10),
                dropdownDecoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                ),
                items:AllList().studied
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
                validator: (value) {
                  if (value == null) {
                    return 'Please select gender.';
                  }
                  return null;
                },
                onChanged: (value) {
                  education = value.toString();
                },
                onSaved: (value) {
                  setState(() {
                    educationvalue = value.toString();
                  });
                },
              ),

              const SizedBox(
                height: 5,
              ),

              const Text("College attended",
                  style: TextStyle(fontWeight: FontWeight.w600)),
              const SizedBox(
                height: 5,
              ),

              //uniValue.......
              DropdownButtonFormField2(
                buttonElevation: 3,
                decoration: InputDecoration(
                    isDense: true,
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding: EdgeInsets.zero,
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.deepOrange),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.black),
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
                buttonPadding: const EdgeInsets.only(left: 20, right: 10),
                dropdownDecoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                ),
                items: AllList().college
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
                validator: (value) {
                  if (value == null) {
                    return 'Please select gender.';
                  }
                  return null;
                },
                onChanged: (value) {
                  setState(() {
                    univalv = value.toString();
                  });
                },
                onSaved: (value) {
                  univalue = value.toString();
                },
              ),

              //faculty ........
              CustomTextField(
                  text1: "education faculty",
                  controller: facultycontroller,
                  hinttext: 'Enter Education...',
                  title: 'Education faculty'),

              //occupuation
              CustomTextField(
                  text1: "occupation",
                  controller: occupationcontroller,
                  hinttext: 'Enter your occupation',
                  title: 'Occupation'),

              //incom price
              CustomTextField(
                  text1: "Annual Icome",
                  controller: incomecontroller,
                  hinttext: 'Enter your Income',
                  title: 'Annual Income'),


              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      margin: const EdgeInsets.only(
                        left: 10,
                        right: 10,
                      ),
                      padding: const EdgeInsets.all(0),
                      height: screenheight * 0.12,
                      width: screenwidth / 3,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Work Location',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w600),
                            ),
                            const SizedBox(
                              height: 5,
                            ),

                            //workLocation
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10)),
                              height: screenheight * 0.066,


                              child: TextFormField(
                                controller: workcontroller,
                                decoration: InputDecoration(
                                  hintText: 'Enter work location',
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: Colors.deepOrange),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide:
                                        const BorderSide(color: Colors.black),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ),
                            ),
                          ])),


                  Container(
                      margin: const EdgeInsets.only(left: 8, right: 8),
                      padding: const EdgeInsets.all(1),
                      height: screenheight * 0.12,
                      width: screenwidth / 2,
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              ' Organization name',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w600),
                            ),
                            const SizedBox(
                              height: 5,
                            ),

                            //org. Name
                            Container(
                              // padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  // color:
                                  //     Colors.grey.shade200.withOpacity(0.5),
                                  borderRadius: BorderRadius.circular(10)),
                              height: screenheight * 0.066,

                              child: TextFormField(
                                controller: orgcontroller,
                                decoration: InputDecoration(
                                  hintText: 'Enter oragnization name',
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: Colors.deepOrange),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide:
                                        const BorderSide(color: Colors.black),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ),
                            ),
                          ])),
                ],
              ),


              const Text("Life Insurance",
                  style: TextStyle(fontWeight: FontWeight.w600)),
              const SizedBox(
                height: 5,
              ),

              //life insurance
              DropdownButtonFormField2(
                buttonElevation: 3,
                decoration: InputDecoration(
                    isDense: true,
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding: EdgeInsets.zero,
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.deepOrange),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.black),
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
                buttonPadding: const EdgeInsets.only(left: 20, right: 10),
                dropdownDecoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                ),
                items: AllList().yesno
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
                validator: (value) {
                  if (value == null) {
                    return 'Please select gender.';
                  }
                  return null;
                },
                onChanged: (value) {
                  //Do something when changing the item if you want.
                },
                onSaved: (value) {
                  lifevalue = value.toString();
                },
              ),
              const SizedBox(
                height: 8,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/about_user');
                      },
                      child: const Text('Skip')),
                  InkWell(
                    onTap: () {
                      regester();
                      },
                    child: Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: Colors.deepOrange,
                          borderRadius: BorderRadius.circular(10)),
                      height: screenheight * 0.05,
                      width: screenwidth * 0.4,
                      child: const Text('Continue',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w500)),
                    ),
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }

  void regester(){
    if(facultycontroller.text.isNotEmpty
        && incomecontroller.text.isNotEmpty
        && occupationcontroller.text.isNotEmpty
        && orgcontroller.text.isNotEmpty
        && workcontroller.text.isNotEmpty
    ){
      Navigator.push(context, MaterialPageRoute(builder: (context)=>
          KundaliInfo(
            faculty: facultycontroller.text,
            income: incomecontroller.text,
            occupation: occupationcontroller.text,
            orgnazationName: orgcontroller.text,
            work: workcontroller.text,
            lifeInsurance: lifevalv,
            educationvalue :education,
            univValue : univalue,
            gender: widget.gender,
            profileFor:widget.profileFor ,
            email: widget.email,
            firstName: widget.firstName,
            lastName: widget.lastName,
            mobileNumber: widget.mobileNumber,
            password: widget.password,
            booldType: widget.booldType,
            timeToCall: widget.timeToCall,
            age: widget.age,
          )
      ));

    }
  }


}
