// import 'package:flutter/material.dart';
// import 'package:flutter/src/foundation/key.dart';
// import 'package:flutter/src/widgets/framework.dart';

// class Settings extends StatelessWidget {
//   const Settings({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//       length: 5,
//       child: Scaffold(
//         backgroundColor: Colors.grey.shade200,
//         appBar: AppBar(
//           backgroundColor: Colors.teal.shade300,
//         ),
//         body: ListView(children: [
//           Column(
//               mainAxisAlignment: MainAxisAlignment.start,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 const SizedBox(
//                   height: 15,
//                 ),
//                 Container(
//                     padding: const EdgeInsets.only(left: 20),
//                     child: const Text(
//                       'Profile Settings',
//                       style: TextStyle(fontSize: 20),
//                     )),
//                 Container(
//                   margin: const EdgeInsets.only(left: 30, top: 10, bottom: 20),
//                   color: Colors.white,
//                   width: 300,
//                   padding: const EdgeInsets.symmetric(horizontal: 20),
//                   child: const TabBar(
//                       indicatorColor: Colors.teal,
//                       labelColor: Colors.teal,
//                       unselectedLabelColor: Colors.grey,
//                       tabs: [
//                         Tab(
//                           text: 'Change Password',
//                         ),
//                         Tab(
//                           text: 'Block List',
//                         ),
//                         Tab(
//                           text: 'Photo Visibility',
//                         ),
//                         Tab(
//                           text: 'Contact Settings',
//                         ),
//                         Tab(
//                           text: 'Delete profile',
//                         )
//                       ]),
//                 ),
//                 const SizedBox(
//                   height: 120,
//                   child: TabBarView(children: [Inbox(), Outbox()]),
//                 )
//               ]),
//         ]),
//       ),
//     );
//   }
// }
