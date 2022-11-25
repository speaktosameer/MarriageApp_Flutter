import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:marriage/data/controller/partner_prefs_controller.dart';
import 'package:marriage/data/model/partner_preference_model.dart';
import 'package:marriage/local/db_client.dart';
import 'package:marriage/utils/sizeboxs.dart';

class BasicSearch extends StatefulWidget {
  const BasicSearch({Key? key}) : super(key: key);

  @override
  State<BasicSearch> createState() => _BasicSearchState();
}

class _BasicSearchState extends State<BasicSearch> {
  String marriedvalue = "";
  String physicalvalue = '';
  String religionsvalue = '';
  String castevalue = '';
  String educationvalue = '';
  String employedinvalue = '';
  String occupationvalue = '';

  int? selectedvalue = 0;
  final List<String> marriedstatus = [
    'Never married',
    'Divorce',
    'Awating Divorce',
    'Widower',
  ];
  final List<String> physicalstatus = [
    'Normal',
    'Physically challanged',
  ];
  final List<String> religionstatus = [
    'Hindu',
    'Christian',
    'Buddhist',
    'Muslim',
  ];
  final List<String> educationstatus = [
    '+2',
    'school level',
    'Bachelors',
    'Diploma',
    'Masters',
    'Phd'
  ];
  final List<String> employedIn = [
    'Business',
    'Defence',
    'Government',
    'Not working',
    'Private',
    'Self Employed'
  ];
  final List<String> occupationstatus = [
    'Administration',
    'Agriculture',
    'Airline',
    'Architecture & Design',
    'Banking & finance',
    'Beauty & Fashion',
    'BPO & Customer Service',
    'Civil Services',
    'Corporate Professionals',
    'Defence',
    'Doctor',
    'Education & Training',
    'Engineering',
    'Hospitality',
    'IT & Software',
    'Leagal',
    'Media & Entertainment',
    'Scientist',
    'Others'
  ];
  TextEditingController castecontroller = TextEditingController(text: 'Tamang');
  TextEditingController minagecontroller =
      TextEditingController(text: '18 years');
  TextEditingController maxagecontroller =
      TextEditingController(text: '30 years');
  TextEditingController minheightcontroller =
      TextEditingController(text: '4"6 ft');
  TextEditingController maxheightcontroller =
      TextEditingController(text: '5"4 ft');
  TextEditingController employedcontroller = TextEditingController(text: '');
  TextEditingController citycontroller = TextEditingController();
  bool isloading = false;
  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    double screenheight = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Select the options below to search for your matches. All fields are optional',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const Sizeboxes(),
          const Text(
            'Basic Options',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const Sizeboxes(),
          const Text(
            'Gender',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Row(
            children: [
              Radio<int>(
                  value: 1,
                  groupValue: selectedvalue,
                  onChanged: (value) {
                    setState(() {
                      selectedvalue = value;
                    });
                  }),
              const Text('Bride'),
              Radio<int>(
                  value: 2,
                  groupValue: selectedvalue,
                  onChanged: (value) {
                    setState(() {
                      selectedvalue = value;
                    });
                  }),
              const Text('Groom')
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: screenheight * 0.063,
                width: screenwidth * 0.40,
                child: TextFormField(
                  controller: minagecontroller,
                  decoration: InputDecoration(
                      labelText: 'Min Age',
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              const BorderSide(color: Colors.deepOrange))),
                ),
              ),
              const Text('To'),
              SizedBox(
                height: screenheight * 0.063,
                width: screenwidth * 0.40,
                child: TextFormField(
                  controller: maxagecontroller,
                  decoration: InputDecoration(
                      labelText: 'Max Age',
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              const BorderSide(color: Colors.deepOrange))),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: screenheight * 0.063,
                width: screenwidth * 0.40,
                child: TextFormField(
                  controller: minheightcontroller,
                  decoration: InputDecoration(
                      labelText: 'Min height',
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              const BorderSide(color: Colors.deepOrange))),
                ),
              ),
              const Text('To'),
              SizedBox(
                height: screenheight * 0.063,
                width: screenwidth * 0.40,
                child: TextFormField(
                  controller: maxheightcontroller,
                  decoration: InputDecoration(
                      labelText: 'Max Height',
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              const BorderSide(color: Colors.deepOrange))),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          TextFormField(
            controller: citycontroller,
            decoration: InputDecoration(
                labelText: 'City',
                hintText: 'Enter city ',
                floatingLabelBehavior: FloatingLabelBehavior.always,
                enabledBorder:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Colors.deepOrange))),
          ),
          const SizedBox(
            height: 20,
          ),
          DropdownButtonFormField2(
            buttonElevation: 3,
            decoration: InputDecoration(
                labelText: 'Physical status',
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
            items: physicalstatus
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
              physicalvalue = value.toString();
            },
            onSaved: (value) {
              physicalvalue = value.toString();
            },
          ),
          const Sizeboxes(),
          const Text(
            'Religious Details',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 20,
          ),
          DropdownButtonFormField2(
            buttonElevation: 3,
            decoration: InputDecoration(
                labelText: 'Religion',
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
            items: religionstatus
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
              religionsvalue = value.toString();
            },
            onSaved: (value) {
              religionsvalue = value.toString();
            },
          ),
          const SizedBox(
            height: 20,
          ),
          TextFormField(
            controller: castecontroller,
            decoration: InputDecoration(
                labelText: 'Caste',
                hintText: 'Enter caste ',
                floatingLabelBehavior: FloatingLabelBehavior.always,
                enabledBorder:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Colors.deepOrange))),
          ),
          const Sizeboxes(),
          const Text(
            'Professional Details',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 20,
          ),
          DropdownButtonFormField2(
            buttonElevation: 3,
            decoration: InputDecoration(
                labelText: 'Education',
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
            items: educationstatus
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
              educationvalue = value.toString();
            },
            onSaved: (value) {
              educationvalue = value.toString();
            },
          ),
          const SizedBox(
            height: 20,
          ),
          TextFormField(
            controller: employedcontroller,
            decoration: InputDecoration(
                labelText: 'Employed In',
                hintText: 'Enter employment place',
                floatingLabelBehavior: FloatingLabelBehavior.always,
                enabledBorder:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Colors.deepOrange))),
          )
          // DropdownButtonFormField2(
          //   buttonElevation: 3,
          //   decoration: InputDecoration(
          //       labelText: 'Employed in',
          //       isDense: true,
          //       filled: true,
          //       fillColor: Colors.transparent,
          //       contentPadding: EdgeInsets.zero,
          //       focusedBorder: OutlineInputBorder(
          //         borderSide: const BorderSide(color: Colors.deepOrange),
          //         borderRadius: BorderRadius.circular(10),
          //       ),
          //       enabledBorder: OutlineInputBorder(
          //         borderSide: const BorderSide(
          //           color: Colors.black,
          //         ),
          //         borderRadius: BorderRadius.circular(10),
          //       )),
          //   isExpanded: true,
          //   hint: const Text(
          //     'Select...',
          //     style: TextStyle(fontSize: 14),
          //   ),
          //   icon: const Icon(
          //     Icons.arrow_drop_down,
          //     color: Colors.black45,
          //   ),
          //   iconSize: 30,
          //   buttonHeight: 50,
          //   buttonPadding: const EdgeInsets.only(left: 20, right: 10),
          //   dropdownDecoration: BoxDecoration(
          //     borderRadius: BorderRadius.circular(15),
          //   ),
          //   items: marriedstatus
          //       .map((item) => DropdownMenuItem<String>(
          //             value: item,
          //             child: Text(
          //               item,
          //               style: const TextStyle(
          //                 fontSize: 14,
          //               ),
          //             ),
          //           ))
          //       .toList(),
          //   // validator: (value) {
          //   //   if (value == null) {
          //   //     return 'Please select gender.';
          //   //   }
          //   //   return null;
          //   // },
          //   onChanged: (value) {
          //     employedinvalue = value.toString();
          //   },
          //   onSaved: (value) {
          //     employedinvalue = value.toString();
          //   },
          // ),
          ,
          const SizedBox(
            height: 20,
          ),
          DropdownButtonFormField2(
            buttonElevation: 3,
            decoration: InputDecoration(
                labelText: 'Occupation',
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
            items: occupationstatus
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
              occupationvalue = value.toString();
            },
            onSaved: (value) {
              occupationvalue = value.toString();
            },
          ),
          const SizedBox(
            height: 20,
          ),
          Consumer(builder: (context, ref, child) {
            final data = ref.watch(partnberprefsnotifierprovider);
            return isloading
                ? const Center(child: CircularProgressIndicator())
                : InkWell(
                    onTap: () async {
                      PartnerPreference partnerPreference = PartnerPreference(
                          gender: selectedvalue.toString(),
                          minage: minagecontroller.text,
                          maxage: maxagecontroller.text,
                          minheight: minheightcontroller.text,
                          maxheight: maxheightcontroller.text,
                          city: citycontroller.text,
                          physicalstatus: physicalvalue,
                          religion: religionsvalue,
                          caste: castecontroller.text,
                          education: educationvalue,
                          employedin: employedinvalue,
                          occupation: occupationvalue,
                          userDetaiId: Dbclient()
                              .getData('user_id', DbDataType.string)
                              .toString());
                      ref
                          .read(partnberprefsnotifierprovider.notifier)
                          .postPrefs(partnerPreference, context);
                      setState(() {
                        isloading = true;
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.deepOrange.shade400,
                          borderRadius: BorderRadius.circular(10)),
                      alignment: Alignment.center,
                      height: screenheight * 0.05,
                      child: const Text('Search Profiles',
                          style: TextStyle(color: Colors.white)),
                    ),
                  );
          }),
        ],
      ),
    );
  }
}

class DropModel {
  final int age;
  final String name;

  DropModel(this.age, this.name);

  static List<DropModel> dropList = [
    DropModel(23, "Avishek"),
    DropModel(24, "Samit"),
    DropModel(25, "Surath")
  ];
}
