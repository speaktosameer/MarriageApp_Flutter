import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:marriage/register/submit_regester.dart';
import '../widgets/all_list.dart';

class LoginPage extends StatefulWidget {
   LoginPage({Key? key,
    this.work, this.income ,
    this.occupation , this.educationvalue,this.faculty ,
    this.lifeInsurance , this.orgnazationName, this.univValue,
    required this.firstName, required this.lastName,
    required this.gender,
    required this.mobileNumber,
    required this.profileFor,
    required this.email,
    required this.password, this.maglo,
    this.familytype, this.timeToCall,this.casteLanguage ,
    this.age, this.booldType, this.language,
    this.house, this.marriedstatus, this.familylocation, this.sister,
    this.brother, this.sisterMarried,this.familyvalues,this.familystatus,
    this.brotherMarried,this.height, this.land,
     this.birthday, this.place ,this.gan ,this.religion ,this.caste,
     this.subcaste ,this.rasi ,this.time ,this.gotra ,this.manglik
  
  })
      : super(key: key);
   int? height;
   String email, firstName, lastName, mobileNumber, password;
   String? language, house, marriedstatus,familystatus, familylocation,
       familyvalues, familytype,
       brother, brotherMarried, sister, sisterMarried ,land;
   String?  faculty, income, occupation, orgnazationName, work,
  lifeInsurance, educationvalue, univValue, gender, profileFor, booldType, timeToCall,
  age, place, birthday, gan, religion, caste, subcaste, gotra, time, maglo, rasi, manglik,
       casteLanguage;
  @override
  State<LoginPage> createState() => _LoginPageState();
}
bool ispressed = false;
final _formKey = GlobalKey<FormState>();

class _LoginPageState extends State<LoginPage> {
  late String hobbyselectedValue;


  String bodyType = "";
  String skinTone = "";
  String eatingHabit = "";
  String drinkingHabit = "";
  String smokingHabit = "";
  String anyDisabality = "";
  String selected = '';
  String weightselect = '';
  String? weightselectedvalue;

  @override
  void initState() {
    // TODO: implement initState\
    hobbyselectedValue = "";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double screemwidth = MediaQuery.of(context).size.width;
    double screenheight = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        body: Form(
          key: _formKey,
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            children: [
              const Text(
                'Some informations about your lifestyle',
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
                height: 15,
              ),

              const Text(
                "Hobbies",
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 5,
              ),

              //gender
              DropdownButtonFormField2(
                buttonElevation: 3,
                decoration: InputDecoration(
                    isDense: true,
                    filled: true,
                    fillColor: Colors.transparent,
                    contentPadding: EdgeInsets.zero,
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.deepOrange),
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
                buttonPadding: const EdgeInsets.only(left: 20, right: 10),
                dropdownDecoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                ),
                items: AllList().genderItems
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
                    selected = value.toString();
                  });
                  //Do something when changing the item if you want.
                },
                onSaved: (value) {
                  setState(() {
                    hobbyselectedValue = value.toString();
                  });
                },
              ),


              const SizedBox(
                height: 13,
              ),
              const Text(
                "Weight",
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 5,
              ),

              //wight
              DropdownButtonFormField2<String>(
                buttonElevation: 3,
                decoration: InputDecoration(
                    isDense: true,
                    filled: true,
                    fillColor: Colors.transparent,
                    contentPadding: EdgeInsets.zero,
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.deepOrange),
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
                buttonPadding: const EdgeInsets.only(left: 20, right: 10),
                dropdownDecoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                ),
                items: AllList().weight
                    .map((item) => DropdownMenuItem<String>(
                          value: item.toString(),
                          child: Text(
                            item.toString(),
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
                    weightselect = value.toString();
                  });
                },
                onSaved: (value) {
                  weightselectedvalue = value.toString();
                },
              ),

              //body Type
              const SizedBox(
                height: 13,
              ),
              const Text(
                "Body Type",
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              Wrap(
                children: [
                  ChoiceChip(
                    pressElevation: 3,
                    label: const Text("Slim"),
                    selected: (bodyType == "Slim") ? true : false,
                    selectedColor: Colors.deepOrange.shade200,
                    disabledColor: Colors.white,
                    onSelected: (bool value) {
                      setState(() {
                        bodyType = "Slim";
                      });
                    },
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  ChoiceChip(
                    label: const Text("Average"),
                    selected: (bodyType == "Average") ? true : false,
                    selectedColor: Colors.deepOrange.shade200,
                    disabledColor: Colors.white,
                    onSelected: (bool value) {
                      setState(() {
                        bodyType = "Average";
                      });
                    },
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  ChoiceChip(
                    label: const Text("Athetic"),
                    selected: (bodyType == "Athetic") ? true : false,
                    selectedColor: Colors.deepOrange.shade200,
                    disabledColor: Colors.white,
                    onSelected: (bool value) {
                      setState(() {
                        bodyType = "Athetic";
                      });
                    },
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  ChoiceChip(
                    label: const Text("Heavy"),
                    selected: (bodyType == "Heavy") ? true : false,
                    selectedColor: Colors.deepOrange.shade200,
                    disabledColor: Colors.white,
                    onSelected: (bool value) {
                      setState(() {
                        bodyType = "Heavy";
                      });
                    },
                  )
                ],
              ),

              //Skin
              const SizedBox(
                height: 13,
              ),
              const Text(
                "Skin Tone",
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              Wrap(
                children: [
                  ChoiceChip(
                    label: const Text("Fair"),
                    selected: (skinTone == "Fair") ? true : false,
                    selectedColor: Colors.deepOrange.shade200,
                    disabledColor: Colors.white,
                    onSelected: (bool value) {
                      setState(() {
                        skinTone = "Fair";
                      });
                    },
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  ChoiceChip(
                    label: const Text("White"),
                    selected: (skinTone == "White") ? true : false,
                    selectedColor: Colors.deepOrange.shade200,
                    disabledColor: Colors.white,
                    onSelected: (bool value) {
                      setState(() {
                        skinTone = "White";
                      });
                    },
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  ChoiceChip(
                    label: const Text("Semi-Dark"),
                    selected: (skinTone == "Semi-Dark") ? true : false,
                    selectedColor: Colors.deepOrange.shade200,
                    disabledColor: Colors.white,
                    onSelected: (bool value) {
                      setState(() {
                        skinTone = "Semi-Dark";
                      });
                    },
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  ChoiceChip(
                    label: const Text("Dark"),
                    selected: (skinTone == "Dark") ? true : false,
                    selectedColor: Colors.deepOrange.shade200,
                    disabledColor: Colors.white,
                    onSelected: (bool value) {
                      setState(() {
                        skinTone = "Dark";
                      });
                    },
                  )
                ],
              ),

             // Eating Habit
              const SizedBox(
                height: 13,
              ),
              const Text(
                "Eating Habit",
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              Wrap(
                children: [
                  ChoiceChip(
                    label: const Text("All"),
                    selected: (eatingHabit == "All") ? true : false,
                    selectedColor: Colors.deepOrange.shade200,
                    disabledColor: Colors.white,
                    onSelected: (bool value) {
                      setState(() {
                        eatingHabit = "All";
                      });
                    },
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  ChoiceChip(
                    label: const Text("Vegeterian"),
                    selected: (eatingHabit == "Vegeterian") ? true : false,
                    selectedColor: Colors.deepOrange.shade200,
                    disabledColor: Colors.white,
                    onSelected: (bool value) {
                      setState(() {
                        eatingHabit = "Vegeterian";
                      });
                    },
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  ChoiceChip(
                    label: const Text("Non-Vegeterian"),
                    selected:
                        (eatingHabit == "Non-Vegeterian") ? true : false,
                    selectedColor: Colors.deepOrange.shade200,
                    disabledColor: Colors.white,
                    onSelected: (bool value) {
                      setState(() {
                        eatingHabit = "Non-Vegeterian";
                      });
                    },
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  ChoiceChip(
                    label: const Text("Eggetarian"),
                    selected: (eatingHabit == "Eggetarian") ? true : false,
                    selectedColor: Colors.deepOrange.shade200,
                    disabledColor: Colors.white,
                    onSelected: (bool value) {
                      setState(() {
                        eatingHabit = "Eggetarian";
                      });
                    },
                  )
                ],
              ),

              //Drinking Habit
              const SizedBox(
                height: 13,
              ),
              const Text(
                "Drinking Habit",
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              Wrap(
                children: [
                  ChoiceChip(
                    label: const Text("Non-Drinker"),
                    selected: (drinkingHabit == "Non-Drinker") ? true : false,
                    selectedColor: Colors.deepOrange.shade200,
                    disabledColor: Colors.white,
                    onSelected: (bool value) {
                      setState(() {
                        drinkingHabit = "Non-Drinker";
                      });
                    },
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  ChoiceChip(
                    label: const Text("Drink Socially"),
                    selected:
                        (drinkingHabit == "Drink Socially") ? true : false,
                    selectedColor: Colors.deepOrange.shade200,
                    disabledColor: Colors.white,
                    onSelected: (bool value) {
                      setState(() {
                        drinkingHabit = "Drink Socially";
                      });
                    },
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  ChoiceChip(
                    label: const Text("Regular"),
                    selected: (drinkingHabit == "Regular") ? true : false,
                    selectedColor: Colors.deepOrange.shade200,
                    disabledColor: Colors.white,
                    onSelected: (bool value) {
                      setState(() {
                        drinkingHabit = "Regular";
                      });
                    },
                  ),
                ],
              ),

              //Smoking Habit
              const SizedBox(
                height: 13,
              ),
              const Text(
                "Smoking Habit",
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              Wrap(
                children: [
                  ChoiceChip(
                    label: const Text("Non-Smoker"),
                    selected: (smokingHabit == "Non-Smoker") ? true : false,
                    selectedColor: Colors.deepOrange.shade200,
                    disabledColor: Colors.white,
                    onSelected: (bool value) {
                      setState(() {
                        smokingHabit = "Non-Smoker";
                      });
                    },
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  ChoiceChip(
                    label: const Text("Light/Social"),
                    selected: (smokingHabit == "Light/Social") ? true : false,
                    selectedColor: Colors.deepOrange.shade200,
                    disabledColor: Colors.white,
                    onSelected: (bool value) {
                      setState(() {
                        smokingHabit = "Light/Social";
                      });
                    },
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  ChoiceChip(
                    label: const Text("Occasionally"),
                    selected: (smokingHabit == "Occasionally") ? true : false,
                    selectedColor: Colors.deepOrange.shade200,
                    disabledColor: Colors.white,
                    onSelected: (bool value) {
                      setState(() {
                        smokingHabit = "Occasionally";
                      });
                    },
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  ChoiceChip(
                    label: const Text("Regular"),
                    selected: (smokingHabit == "Regular") ? true : false,
                    selectedColor: Colors.deepOrange.shade200,
                    disabledColor: Colors.white,
                    onSelected: (bool value) {
                      setState(() {
                        smokingHabit = "Regular";
                      });
                    },
                  )
                ],
              ),

              //disabality
              const SizedBox(
                height: 13,
              ),
              const Text(
                "Any disabality",
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              Wrap(
                children: [
                  ChoiceChip(
                    label: const Text("No"),
                    selected: (anyDisabality == "No") ? true : false,
                    selectedColor: Colors.deepOrange.shade200,
                    disabledColor: Colors.white,
                    onSelected: (bool value) {
                      setState(() {
                        anyDisabality = "No";
                      });
                    },
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  ChoiceChip(
                    label: const Text("Yes"),
                    selected: (anyDisabality == "Yes") ? true : false,
                    selectedColor: Colors.deepOrange.shade200,
                    disabledColor: Colors.white,
                    onSelected: (bool value) {
                      setState(() {
                        anyDisabality = "Yes";
                      });
                    },
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                ],
              ),


              const SizedBox(
                height: 18,
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
                    onTap: () async {
                     regester();
                    },
                    child: Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: Colors.deepOrange,
                          borderRadius: BorderRadius.circular(10)),
                      height: screenheight * 0.05,
                      width: screemwidth * 0.4,
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
          ),
        ),
      ),
    );
  }

  void regester (){
    SubmitRegester(
      bodyType: bodyType,
        skinTone: skinTone,
      eatingHabit: eatingHabit,
      drinkingHabit: drinkingHabit,
      smokingHabit: smokingHabit,
      disabiltiy: anyDisabality,
     selected:selected,
      hobby: hobbyselectedValue,
      weight: weightselectedvalue.toString(),

    );
  }
}
