import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:marriage/data/controller/get_controller.dart';
import 'package:marriage/data/model/regester_detils.dart';
import 'package:marriage/data/model/short_list.dart';
import 'package:marriage/data/model/top_user.dart';
import 'package:marriage/provider/home_provider_controller.dart';
import 'package:marriage/screens/homepage.dart';
import 'package:marriage/screens/top_users.dart';

import '../../data/model/top_user_model.dart';
import 'profiledetail.dart';
import '../../utils/alertdialogue.dart';
import '../../utils/sizeboxs.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  TextEditingController agecontrol = TextEditingController();

  PopupMenuItem<MenuModel> buildItem(MenuModel item) =>
      PopupMenuItem(child: Text(item.name));

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double w = size.width;
    double h = size.height;
    return Scaffold(
      endDrawer: const Drawerr(),
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.deepOrange.shade500,
        centerTitle: true,
        title: const Text(
          'Profile ',
          textAlign: TextAlign.center,
        ),
      ),

      // body: Column(
      //   children: [
      //     Consumer(builder: (context, ref, child) {
      //       final data = ref.watch(userInfoProvider);
      //       return data.when(data: (d) {
      //         return Text(d.usersData.user.firstName);
      //       }, error: (err, s) {
      //         return Text(err.toString());
      //       }, loading: () {
      //         return const Center(
      //           child: CircularProgressIndicator(),
      //         );
      //       });
      //     })
      //   ],
      // )
      body: ListView(children: [

        FutureBuilder<List<Data>>(
           future: HomeController().getShortList(),
            builder: (context ,AsyncSnapshot snapShot){
          return ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: 1,
             itemBuilder: (context ,index){
              return Column(children: [
                Container(
                  margin: EdgeInsets.only(top: 20),
                  height: 180,
                  width: 200,
                  decoration: BoxDecoration(
                      color: Colors.blueGrey.shade300.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(18)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Stack(children: [
                        const Icon(
                          Icons.person,
                          size: 150,
                        ),
                        Positioned(
                          bottom: 0,
                          child: Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color: Colors.deepOrange.shade400,
                                borderRadius: BorderRadius.circular(18)),
                            height: 24,
                            width: 150,
                            child: const Text(
                              'Edit',
                              style: TextStyle(fontSize: 12, color: Colors.white),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ]),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                 "${snapShot.data[index].user.firstName} ${snapShot.data[index].user.lastName}" ,
                  style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                      color: Color(0xff6082B6)),
                ),
                Container(
                    width: 68,
                    padding: const EdgeInsets.all(3),
                    decoration: BoxDecoration(
                        color: const Color(0xff50C878),
                        borderRadius: BorderRadius.circular(18)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(
                          Icons.verified_outlined,
                          size: 14,
                          color: Colors.white,
                        ),
                        Text(
                          ' verified',
                          style: TextStyle(fontSize: 12, color: Colors.white),
                        ),
                      ],
                    )),
                const SizedBox(
                  height: 25,
                ),
                Container(
                  margin: const EdgeInsets.only(top: 20),
                  padding: const EdgeInsets.only(left: 40),
                  height: 40,
                  width: 400,
                  child: const Text(
                    'My profile',
                    textAlign: TextAlign.start,
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                SizedBox(
                  width: w - 60,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(children: const [
                        Icon(
                          Icons.stop,
                          size: 18,
                        ),
                        Text(
                          '  Basic Details',
                          style: TextStyle(fontSize: 18, color: Colors.blueGrey),
                        ),
                      ]),
                      // EditBtn(
                      //   onTap: () {
                      //     Navigator.push(
                      //       context,
                      //       CupertinoPageRoute(
                      //         builder: (context) => EditDialog(loginInfoModel: ),
                      //       ),
                      //     );
                      //   },
                      // ),
                    ],
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Colors.grey.shade200.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(10)),
                  margin: const EdgeInsets.all(10),
                  padding: const EdgeInsets.only(left: 20, top: 12),
                  width: 300,
                  height: 300,
                  child: Column(children: [
                    ProfileDetails(
                      text: 'Name',
                      text2:
                      "${snapShot.data[index].user.firstName} "
                          "${snapShot.data[index].user.lastName}",
                    ),
                    const Sizeboxes(),
                    ProfileDetails(
                        text: 'Age', text2: "${snapShot.data[index].age} years"),
                    const Sizeboxes(),
                    ProfileDetails(text: 'Height', text2: "${snapShot.data[index].height} Cm"),
                    const Sizeboxes(),
                    ProfileDetails(text: 'Weight', text2:"${snapShot.data[index].weight} Kg"),
                    const Sizeboxes(),
                    ProfileDetails(
                        text: 'Body type ', text2: "${snapShot.data[index].bodyType}"),
                    const Sizeboxes(),
                    const ProfileDetails(text: 'Skin tone', text2: 'Fair'),
                    const Sizeboxes(),
                    const ProfileDetails(
                        text: 'Mother \nTongue', text2: 'Nepali'),
                    const Sizeboxes(),
                    ProfileDetails(
                        text: 'Material status',
                        text2: "${snapShot.data[index].maritalStatus}"),
                    const Sizeboxes(),
                    ProfileDetails(
                        text: 'Horoscope', text2:"${snapShot.data[index].horoscope}"),
                    const Sizeboxes(),
                    ProfileDetails(
                        text: 'Blood Group', text2: "${snapShot.data[index].bloodGroup}")
                  ]),
                ),
                SizedBox(
                  width: w - 60,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(children: const [
                        Icon(
                          Icons.stop,
                          size: 18,
                        ),
                        Text(
                          '  About Me',
                          style: TextStyle(fontSize: 18, color: Colors.blueGrey),
                        ),
                      ]),
                      EditBtn(
                        onTap: () {},
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 300,
                  alignment: Alignment.topLeft,
                  decoration: BoxDecoration(
                      color: Colors.grey.shade200.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(10)),
                  margin: const EdgeInsets.all(10),
                  padding: const EdgeInsets.only(left: 20, top: 12),
                  height: 100,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${snapShot.data[index].description}",
                        )
                      ]),
                ),
                SizedBox(
                  width: w - 60,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(children: const [
                        Icon(
                          Icons.stop,
                          size: 18,
                        ),
                        Text(
                          'Religion Inflormation',
                          style: TextStyle(fontSize: 18, color: Colors.blueGrey),
                        ),
                      ]),
                      EditBtn(
                        onTap: () {
                          // Editdailogue(context, agecontrol);
                        },
                      ),
                    ],
                  ),
                ),
                Container(
                    alignment: Alignment.topLeft,
                    decoration: BoxDecoration(
                        color: Colors.grey.shade200.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(10)),
                    margin: const EdgeInsets.all(10),
                    padding: const EdgeInsets.only(left: 20, top: 12, bottom: 10),
                    width: 300,
                    //height: 90,
                    child: Column(children: [
                      ProfileDetails(
                        text: 'Religion',
                        text2: "${snapShot.data[index].religion}",
                      ),
                      const Sizeboxes(),
                      ProfileDetails(text: 'Caste', text2: "${snapShot.data[index].caste}"),
                      const Sizeboxes(),
                      const ProfileDetails(text: 'Gotra', text2: ""),
                    ])),
                SizedBox(
                  width: w - 60,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(children: const [
                        Icon(
                          Icons.stop,
                          size: 18,
                        ),
                        Text(
                          '  Address Information',
                          style: TextStyle(fontSize: 18, color: Colors.blueGrey),
                        ),
                      ]),
                      EditBtn(
                        onTap: () {
                          // Editdailogue(context, agecontrol);
                        },
                      ),
                    ],
                  ),
                ),
                Container(
                    alignment: Alignment.topLeft,
                    decoration: BoxDecoration(
                        color: Colors.grey.shade200.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(10)),
                    margin: const EdgeInsets.all(10),
                    padding: const EdgeInsets.only(left: 20, top: 12, bottom: 10),
                    width: 300,
                    //height: 80,
                    child: Column(children: [
                      ProfileDetails(
                        text: 'Address',
                        text2: "${snapShot.data[index].address}",
                      ),
                      const Sizeboxes(),
                      ProfileDetails(text: 'City', text2: "${snapShot.data[index].city}"),
                    ])),
                SizedBox(
                  width: w - 60,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(children: const [
                        Icon(
                          Icons.stop,
                          size: 18,
                        ),
                        Text(
                          '  Education Information',
                          style: TextStyle(fontSize: 18, color: Colors.blueGrey),
                        ),
                      ]),
                      EditBtn(
                        onTap: () {
                          // Editdailogue(context, agecontrol);
                        },
                      ),
                    ],
                  ),
                ),
                Container(
                    alignment: Alignment.topLeft,
                    decoration: BoxDecoration(
                        color: Colors.grey.shade200.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(10)),
                    margin: const EdgeInsets.all(10),
                    padding: const EdgeInsets.only(left: 20, top: 12, bottom: 10),
                    width: 300,

                    //height: 120,
                    child: Column(children: [
                      ProfileDetails(
                        text: 'Education',
                        text2: "${snapShot.data[index].education}",
                      ),
                      const Sizeboxes(),
                      ProfileDetails(
                          text: 'Occupation', text2: "${snapShot.data[index].occupation}"),
                      const Sizeboxes(),
                      ProfileDetails(
                          text: 'Employed in', text2: "${snapShot.data[index].employedIn}"),
                      const Sizeboxes(),
                      ProfileDetails(
                        text: 'Annual \nIncome',
                        text2: "${snapShot.data[index].anualIncome} \$",
                      )
                    ])),
                SizedBox(
                  width: w - 60,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(children: const [
                        Icon(
                          Icons.stop,
                          size: 18,
                        ),
                        Text(
                          '  Family Details',
                          style: TextStyle(fontSize: 18, color: Colors.blueGrey),
                        ),
                      ]),
                      EditBtn(
                        onTap: () {
                          // Editdailogue(context, agecontrol);
                        },
                      ),
                    ],
                  ),
                ),
                Container(
                  alignment: Alignment.topLeft,
                  decoration: BoxDecoration(
                      color: Colors.grey.shade200.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(10)),
                  margin: const EdgeInsets.all(10),
                  padding: const EdgeInsets.only(left: 20, top: 12, bottom: 10),
                  width: 300,
                  //height: 300,
                  child: Column(children: [
                    ProfileDetails(
                      text: 'Family status',
                      text2:"${snapShot.data[index].familyStatus}",
                    ),
                    const Sizeboxes(),
                    ProfileDetails(
                        text: 'Family type', text2: "${snapShot.data[index].familyType}"),
                    const Sizeboxes(),
                    const ProfileDetails(
                        text: 'Fathers \nName', text2: 'Not specified'),
                    const Sizeboxes(),
                    const ProfileDetails(
                        text: 'Fathers \noccupation', text2: 'Not Specified'),
                    const Sizeboxes(),
                    const ProfileDetails(
                        text: 'Mothers \nName', text2: 'Not specified'),
                    const Sizeboxes(),
                    const ProfileDetails(
                        text: 'Mothers \nOccupation', text2: 'Not Specified'),
                    const Sizeboxes(),
                    const ProfileDetails(
                        text: 'No of \nBrothers', text2: 'Notspecified'),
                    const Sizeboxes(),
                    const ProfileDetails(
                        text: 'No of \nSisters', text2: ""),
                  ]),
                ),
              ]);



             },
          );
        }),



        // Consumer(builder: (context, ref, child) {
        //   final data = ref.watch(userInfoProvider);
        //   return data.when(data: (d) {
        //     return Column(children: [
        //       const SizedBox(
        //         height: 10,
        //       ),
        //       Container(
        //         height: 180,
        //         width: 200,
        //         decoration: BoxDecoration(
        //             color: Colors.blueGrey.shade300.withOpacity(0.2),
        //             borderRadius: BorderRadius.circular(18)),
        //         child: Column(
        //           mainAxisAlignment: MainAxisAlignment.center,
        //           children: [
        //             Stack(children: [
        //               const Icon(
        //                 Icons.person,
        //                 size: 150,
        //               ),
        //               Positioned(
        //                 bottom: 0,
        //                 child: Container(
        //                   alignment: Alignment.center,
        //                   decoration: BoxDecoration(
        //                       color: Colors.deepOrange.shade400,
        //                       borderRadius: BorderRadius.circular(18)),
        //                   height: 24,
        //                   width: 150,
        //                   child: const Text(
        //                     'Edit',
        //                     style: TextStyle(fontSize: 12, color: Colors.white),
        //                     textAlign: TextAlign.center,
        //                   ),
        //                 ),
        //               ),
        //             ]),
        //           ],
        //         ),
        //       ),
        //       const SizedBox(
        //         height: 15,
        //       ),
        //       Text(
        //         "name",
        //         style: const TextStyle(
        //             fontSize: 22,
        //             fontWeight: FontWeight.w600,
        //             color: Color(0xff6082B6)),
        //       ),
        //       Container(
        //           width: 68,
        //           padding: const EdgeInsets.all(3),
        //           decoration: BoxDecoration(
        //               color: const Color(0xff50C878),
        //               borderRadius: BorderRadius.circular(18)),
        //           child: Row(
        //             mainAxisAlignment: MainAxisAlignment.center,
        //             children: const [
        //               Icon(
        //                 Icons.verified_outlined,
        //                 size: 14,
        //                 color: Colors.white,
        //               ),
        //               Text(
        //                 ' verified',
        //                 style: TextStyle(fontSize: 12, color: Colors.white),
        //               ),
        //             ],
        //           )),
        //       const SizedBox(
        //         height: 25,
        //       ),
        //       Container(
        //         margin: const EdgeInsets.only(top: 20),
        //         padding: const EdgeInsets.only(left: 40),
        //         height: 40,
        //         width: 400,
        //         child: const Text(
        //           'My profile',
        //           textAlign: TextAlign.start,
        //           style: TextStyle(fontSize: 20),
        //         ),
        //       ),
        //       SizedBox(
        //         width: w - 60,
        //         child: Row(
        //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //           children: [
        //             Row(children: const [
        //               Icon(
        //                 Icons.stop,
        //                 size: 18,
        //               ),
        //               Text(
        //                 '  Basic Details',
        //                 style: TextStyle(fontSize: 18, color: Colors.blueGrey),
        //               ),
        //             ]),
        //             EditBtn(
        //               onTap: () {
        //                 Navigator.push(
        //                   context,
        //                   CupertinoPageRoute(
        //                     builder: (context) => EditDialog(loginInfoModel: d),
        //                   ),
        //                 );
        //               },
        //             ),
        //           ],
        //         ),
        //       ),
        //       Container(
        //         alignment: Alignment.center,
        //         decoration: BoxDecoration(
        //             color: Colors.grey.shade200.withOpacity(0.5),
        //             borderRadius: BorderRadius.circular(10)),
        //         margin: const EdgeInsets.all(10),
        //         padding: const EdgeInsets.only(left: 20, top: 12),
        //         width: 300,
        //         height: 300,
        //         child: Column(children: [
        //           ProfileDetails(
        //             text: 'Name',
        //             text2:
        //                 "malsa Name",
        //           ),
        //           const Sizeboxes(),
        //           ProfileDetails(
        //               text: 'Age', text2: "d.usersData.age.toString()"),
        //           const Sizeboxes(),
        //           ProfileDetails(text: 'Height', text2: "d.usersData.height"),
        //           const Sizeboxes(),
        //           ProfileDetails(text: 'Weight', text2: "d.usersData.weight"),
        //           const Sizeboxes(),
        //           ProfileDetails(
        //               text: 'Body type ', text2: "d.usersData.bodyType"),
        //           const Sizeboxes(),
        //           const ProfileDetails(text: 'Skin tone', text2: 'Fair'),
        //           const Sizeboxes(),
        //           const ProfileDetails(
        //               text: 'Mother \nTongue', text2: 'Nepali'),
        //           const Sizeboxes(),
        //           ProfileDetails(
        //               text: 'Material status',
        //               text2: "d.usersData.maritalStatus"),
        //           const Sizeboxes(),
        //           ProfileDetails(
        //               text: 'Horoscope', text2:" d.usersData.horoscope"),
        //           const Sizeboxes(),
        //           ProfileDetails(
        //               text: 'Blood Group', text2: "d.usersData.bloodGroup")
        //         ]),
        //       ),
        //       SizedBox(
        //         width: w - 60,
        //         child: Row(
        //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //           children: [
        //             Row(children: const [
        //               Icon(
        //                 Icons.stop,
        //                 size: 18,
        //               ),
        //               Text(
        //                 '  About Me',
        //                 style: TextStyle(fontSize: 18, color: Colors.blueGrey),
        //               ),
        //             ]),
        //             EditBtn(
        //               onTap: () {},
        //             ),
        //           ],
        //         ),
        //       ),
        //       Container(
        //         width: 300,
        //         alignment: Alignment.topLeft,
        //         decoration: BoxDecoration(
        //             color: Colors.grey.shade200.withOpacity(0.5),
        //             borderRadius: BorderRadius.circular(10)),
        //         margin: const EdgeInsets.all(10),
        //         padding: const EdgeInsets.only(left: 20, top: 12),
        //         height: 100,
        //         child: Column(
        //             crossAxisAlignment: CrossAxisAlignment.start,
        //             children: [
        //               Text(
        //                 d.usersData.description,
        //               )
        //             ]),
        //       ),
        //       SizedBox(
        //         width: w - 60,
        //         child: Row(
        //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //           children: [
        //             Row(children: const [
        //               Icon(
        //                 Icons.stop,
        //                 size: 18,
        //               ),
        //               Text(
        //                 '  Religion Inflormation',
        //                 style: TextStyle(fontSize: 18, color: Colors.blueGrey),
        //               ),
        //             ]),
        //             EditBtn(
        //               onTap: () {
        //                 // Editdailogue(context, agecontrol);
        //               },
        //             ),
        //           ],
        //         ),
        //       ),
        //       Container(
        //           alignment: Alignment.topLeft,
        //           decoration: BoxDecoration(
        //               color: Colors.grey.shade200.withOpacity(0.5),
        //               borderRadius: BorderRadius.circular(10)),
        //           margin: const EdgeInsets.all(10),
        //           padding: const EdgeInsets.only(left: 20, top: 12, bottom: 10),
        //           width: 300,
        //           //height: 90,
        //           child: Column(children: [
        //             ProfileDetails(
        //               text: 'Religion',
        //               text2: "d.usersData.religion",
        //             ),
        //             const Sizeboxes(),
        //             ProfileDetails(text: 'Caste', text2: d.usersData.caste),
        //             const Sizeboxes(),
        //             const ProfileDetails(text: 'Gotra', text2: ''),
        //           ])),
        //       SizedBox(
        //         width: w - 60,
        //         child: Row(
        //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //           children: [
        //             Row(children: const [
        //               Icon(
        //                 Icons.stop,
        //                 size: 18,
        //               ),
        //               Text(
        //                 '  Address Information',
        //                 style: TextStyle(fontSize: 18, color: Colors.blueGrey),
        //               ),
        //             ]),
        //             EditBtn(
        //               onTap: () {
        //                 // Editdailogue(context, agecontrol);
        //               },
        //             ),
        //           ],
        //         ),
        //       ),
        //       Container(
        //           alignment: Alignment.topLeft,
        //           decoration: BoxDecoration(
        //               color: Colors.grey.shade200.withOpacity(0.5),
        //               borderRadius: BorderRadius.circular(10)),
        //           margin: const EdgeInsets.all(10),
        //           padding: const EdgeInsets.only(left: 20, top: 12, bottom: 10),
        //           width: 300,
        //           //height: 80,
        //           child: Column(children: [
        //             ProfileDetails(
        //               text: 'Address',
        //               text2: "d.usersData.address",
        //             ),
        //             const Sizeboxes(),
        //             ProfileDetails(text: 'City', text2: "d.usersData.address"),
        //           ])),
        //       SizedBox(
        //         width: w - 60,
        //         child: Row(
        //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //           children: [
        //             Row(children: const [
        //               Icon(
        //                 Icons.stop,
        //                 size: 18,
        //               ),
        //               Text(
        //                 '  Education Information',
        //                 style: TextStyle(fontSize: 18, color: Colors.blueGrey),
        //               ),
        //             ]),
        //             EditBtn(
        //               onTap: () {
        //                 // Editdailogue(context, agecontrol);
        //               },
        //             ),
        //           ],
        //         ),
        //       ),
        //       Container(
        //           alignment: Alignment.topLeft,
        //           decoration: BoxDecoration(
        //               color: Colors.grey.shade200.withOpacity(0.5),
        //               borderRadius: BorderRadius.circular(10)),
        //           margin: const EdgeInsets.all(10),
        //           padding: const EdgeInsets.only(left: 20, top: 12, bottom: 10),
        //           width: 300,
        //
        //           //height: 120,
        //           child: Column(children: [
        //             ProfileDetails(
        //               text: 'Education',
        //               text2: "d.usersData.education",
        //             ),
        //             const Sizeboxes(),
        //             ProfileDetails(
        //                 text: 'Occupation', text2: "d.usersData.occupation"),
        //             const Sizeboxes(),
        //             ProfileDetails(
        //                 text: 'Employed in', text2: "d.usersData.employedIn"),
        //             const Sizeboxes(),
        //             ProfileDetails(
        //               text: 'Annual \nIncome',
        //               text2: "d.usersData.anualIncome",
        //             )
        //           ])),
        //       SizedBox(
        //         width: w - 60,
        //         child: Row(
        //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //           children: [
        //             Row(children: const [
        //               Icon(
        //                 Icons.stop,
        //                 size: 18,
        //               ),
        //               Text(
        //                 '  Family Details',
        //                 style: TextStyle(fontSize: 18, color: Colors.blueGrey),
        //               ),
        //             ]),
        //             EditBtn(
        //               onTap: () {
        //                 // Editdailogue(context, agecontrol);
        //               },
        //             ),
        //           ],
        //         ),
        //       ),
        //       Container(
        //         alignment: Alignment.topLeft,
        //         decoration: BoxDecoration(
        //             color: Colors.grey.shade200.withOpacity(0.5),
        //             borderRadius: BorderRadius.circular(10)),
        //         margin: const EdgeInsets.all(10),
        //         padding: const EdgeInsets.only(left: 20, top: 12, bottom: 10),
        //         width: 300,
        //         //height: 300,
        //         child: Column(children: [
        //           ProfileDetails(
        //             text: 'Family status',
        //             text2:" d.usersData.familyStatus",
        //           ),
        //           const Sizeboxes(),
        //           ProfileDetails(
        //               text: 'Family type', text2: "d.usersData.familyType"),
        //           const Sizeboxes(),
        //           const ProfileDetails(
        //               text: 'Fathers \nName', text2: 'Not specified'),
        //           const Sizeboxes(),
        //           const ProfileDetails(
        //               text: 'Fathers \noccupation', text2: 'Not Specified'),
        //           const Sizeboxes(),
        //           const ProfileDetails(
        //               text: 'Mothers \nName', text2: 'Not specified'),
        //           const Sizeboxes(),
        //           const ProfileDetails(
        //               text: 'Mothers \nOccupation', text2: 'Not Specified'),
        //           const Sizeboxes(),
        //           const ProfileDetails(
        //               text: 'No of \nBrothers', text2: 'Notspecified'),
        //           const Sizeboxes(),
        //           const ProfileDetails(
        //               text: 'No of \nSisters', text2: 'Not specified'),
        //         ]),
        //       ),
        //     ]);
        //   }, error: (err, s) {
        //     return Text(err.toString());
        //   }, loading: () {
        //     return const Center(child: CircularProgressIndicator());
        //   });
        // }),
      ]),
    );
  }
}

class EditBtn extends StatelessWidget {
  final VoidCallback onTap;
  const EditBtn({
    Key? key,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        //padding: const EdgeInsets.only(top: 5),
        height: 30,
        //olor: Colors.red,
        width: 50,
        // decoration: BoxDecoration(
        //     color: Colors.deepOrange, borderRadius: BorderRadius.circular(10)),
        child: const Text(
          'Edit',
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 16,
              color: Color(0xff5bb3e8),
              decoration: TextDecoration.underline),
        ),
      ),
    );
  }
}

class MenuModel {
  final String name;

  MenuModel(this.name);

  static List<MenuModel> menuList = [
    MenuModel("Home"),
    MenuModel("Profile Settings"),
  ];
}
