import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:marriage/data/controller/get_controller.dart';
import 'package:marriage/screens/short_list_user.dart';
import 'package:marriage/screens/top_users.dart';

import 'package:marriage/utils/shimmer_effect.dart';
import 'package:marriage/Mailbox/mailbox.dart';

import 'package:marriage/data/controller/get_top_user_controller.dart';
import 'package:marriage/data/controller/shortlist_controller.dart';
import 'package:marriage/data/model/image_model.dart';
import 'package:marriage/login/login.dart';
import 'package:marriage/utils/nav.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../data/model/short_list.dart';
import '../data/model/top_user.dart';
import '../provider/home_provider_controller.dart';
import 'matches.dart';
import 'search/Search.dart';
import 'settings_page.dart';
import 'upgrade/upgradepage.dart';
import 'userprofile/profile.dart';

class Homepage extends ConsumerStatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  ConsumerState<Homepage> createState() => _HomepageState();
}

class _HomepageState extends ConsumerState<Homepage> {
  int _currentindex = 0;
  int index = 0;
  final Screens = [
    const HomeView(),
    const Profile(),
    const Search(),
    const MailBox(),
    const Matches()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Screens[_currentindex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.deepOrange,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        elevation: 0,
        backgroundColor: Colors.white,
        currentIndex: _currentindex,
        iconSize: 20,
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: _currentindex == 0
                  ? const AvatarWidget(
                      iconData: Icons.home,
                      name: 'Home',
                    )
                  : Column(
                      children: const [Icon(Icons.home), Text('Home')],
                    ),
              label: 'Home'),
          BottomNavigationBarItem(
              icon: _currentindex == 1
                  ? const AvatarWidget(
                      iconData: Icons.person,
                      name: 'Profile',
                    )
                  : Column(
                      children: const [Icon(Icons.person), Text('Profile')],
                    ),
              label: 'Profile'),
          BottomNavigationBarItem(
              icon: _currentindex == 2
                  ? const AvatarWidget(
                      iconData: Icons.search,
                      name: 'Search',
                    )
                  : Column(
                      children: const [Icon(Icons.search), Text('Search')],
                    ),
              label: 'Search'),
          BottomNavigationBarItem(
              icon: _currentindex == 3
                  ? const AvatarWidget(
                      iconData: Icons.mail,
                      name: 'Mailbox',
                    )
                  : Column(
                      children: const [Icon(Icons.mail), Text('Mailbox')],
                    ),
              label: 'Mail'),
          BottomNavigationBarItem(
              icon: _currentindex == 4
                  ? const AvatarWidget(
                      iconData: Icons.arrow_right_alt,
                      name: 'Matches',
                    )
                  : Column(
                      children: const [Icon(Icons.arrow_back), Text('Matches')],
                    ),
              label: 'Mail'),
        ],
        onTap: (index) {
          setState(() {
            _currentindex = index;
          });
        },
      ),
    );
  }
}

class HomeView extends ConsumerStatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  ConsumerState<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<HomeView> {
  @override
  Widget build(BuildContext context) {
    final data = ref.watch(userInfoProvider);
    double screenheight = MediaQuery.of(context).size.height;
    double screenwidth = MediaQuery.of(context).size.width;
    return Scaffold(
      endDrawer: const Drawerr(),
      appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.deepOrange,
          leading: const Padding(
            padding: EdgeInsets.only(left: 15, top: 10, bottom: 10),
            child: CircleAvatar(
              radius: 40,
              backgroundColor: Colors.white,
              child: Icon(Icons.person),
            ),
          ),
          title: data.when(data: (d) {
            return Text(
              'Hello,\n${d.usersData.user.firstName} ${d.usersData.user.lastName}',
              style: const TextStyle(fontSize: 18),
            );
          }, error: (err, s) {
            Text(err.toString());
            return null;
          }, loading: () {
            return const AppBarShimmer();
          })),
      body: ListView(
          padding: const EdgeInsets.all(12),
          children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Top Users',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            TextButton(
                onPressed: () {
                  Navigator.push(context,
                      CupertinoPageRoute(builder: (context) {
                    return const TopUsers();
                  }));
                },
                child: const Text('See all'))
          ],
        ),

            FutureBuilder<List<TopUser>>(
                future: HomeController().getTopUser(),
                builder: (context ,AsyncSnapshot snapShot){
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: 1,
                    itemBuilder: (context ,index){

                      return Container(
                        color: Colors.white,
                        padding: const EdgeInsets.all(8),
                        height: screenheight * 0.19,
                        child: ConstrainedBox(
                          constraints: BoxConstraints(
                            minHeight: 90,
                            maxHeight: 90,
                            minWidth: 340,
                            maxWidth: 340
                          ),
                          child: ListView.builder(
                            padding: EdgeInsets.all(5),

                              scrollDirection: Axis.horizontal,
                              itemCount:  snapShot.data!.length,
                              itemBuilder: (context, index) {
                                return Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(Radius.circular(20)),
                                    border: Border.all(
                                      width: 0.4,
                                        color: Colors.deepOrange)
                                  ),
                                  margin: EdgeInsets.all(10),
                                  padding: EdgeInsets.all(5),
                                  child: Column(
                                    children: [
                                      CircleAvatar(
                                        child: Text(
                                         snapShot.data[index].firstName
                                        ),
                                        backgroundColor:Colors.deepOrange,
                                        radius: 25,
                                      ),
                                      Text(
                                        snapShot.data[index].firstName,
                                        style: const TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w400),
                                      ),
                                      Text(
                                        snapShot.data[index].lastName,
                                        style: const TextStyle(
                                            fontSize: 13,
                                            fontWeight: FontWeight.w300),),

                                  ],
                                  ),
                                );
                              }),
                        ),
                      );;



                    },
                  );
                }),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Shortlist',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 20),
                ),
                TextButton(
                    onPressed: () {
                      Navigator.push(context,
                          CupertinoPageRoute(builder: (context) {
                            return const ShortListUsers();
                          }));
                    },
                    child: const Text('See all'))
              ],
            ),
            FutureBuilder<List<Data>>(
                future: HomeController().getShortList(),
                builder: (context, AsyncSnapshot snapShot) {
                  if (snapShot.hasError) {
                    return Column(
                      children: [
                        Image(
                            height: 220,
                            width: 100,
                            image: AssetImage("images/search.png")),
                        const Text("Not Result Found!")
                      ],
                    );
                  }
                  if (snapShot.hasData) {
                    return Container(
                      color: Colors.white,
                      padding: const EdgeInsets.all(8),
                      height: screenheight * 0.19,
                      child: ListView.builder(
                        shrinkWrap: true,
                         // scrollDirection: Axis.horizontal,
                          itemCount: 8,
                          itemBuilder: (context, index) {
                            return Row(
                              children: [
                                Container(
                                  margin: const EdgeInsets.all(10),
                                  child: CircleAvatar(
                                    radius: 50,
                                    backgroundColor: Colors.white,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(50),
                                      child: Image.network(
                                        "snapShot.data[index].Image",
                                        fit: BoxFit.contain,
                                        height: 100,
                                        width: 100,
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.only(top: 0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        ' ${snapShot.data[index].user.firstName} ${snapShot.data[index].user.lastName}',
                                        style: const TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                          ' ${snapShot.data[index].age} yrs , ${snapShot.data[index].height} , ${snapShot.data[index].gender}'),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Text(' ${snapShot.data[index].city}')
                                    ],
                                  ),
                                )
                              ],
                            );
                          }),
                    );
                  } else {
                    return Center(
                      child: CircularProgressIndicator(
                        color: Color(0xFFF62D2D),
                      ),
                    );
                  }
                }),

        Consumer(builder: (context, ref, child) {
          final data = ref.watch(topuserInfoProvider);

          return data.when(data: (d) {
            return Container(
              color: Colors.white,
              padding: const EdgeInsets.all(8),
              height: screenheight * 0.19,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 8,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(5),
                          child: SizedBox(
                            height: screenheight * 0.13,
                            width: screenwidth * 0.28,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.network(
                                imagesList[index].Image,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        ),
                        Text(
                          d.user[index].firstname,
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w300),
                        ),
                      ],
                    );
                  }),
            );
          }, error: (err, s) {
            return Text(err.toString());
          }, loading: () {
            return const TopUserShimmer();
          });
        }),
        const SizedBox(
          height: 10,
        ),
        // Consumer(builder: (context, ref, child) {
        //   final data = ref.watch(topuserInfoProvider);
        //   return data.when(data: (d) {
        //     return CarouselSlider(
        //         items: imagesList
        //             .map((e) => Column(
        //                   children: [
        //                     Image.network(
        //                       e.Image,
        //                       height: screenheight * 0.21,
        //                     ),
        //                   ],
        //                 ))
        //             .toList(),
        //         options: CarouselOptions(autoPlay: true));
        //   }, error: (err, s) {
        //     return Text(err.toString());
        //   }, loading: () {
        //     return const Center(
        //       child: CircularProgressIndicator(),
        //     );
        //   });
        // }),

        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 5),
              child: Text(
                'Explore Marriage station',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: screenheight * 0.19,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              color: index == 0
                                  ? Colors.teal.shade100
                                  : index == 1
                                      ? Colors.lightGreen.shade300
                                      : index == 2
                                          ? Colors.blue.shade400
                                          : index == 3
                                              ? Colors.purple.shade200
                                              : Colors.deepOrange.shade100,
                              borderRadius: BorderRadius.circular(10)),
                          height: screenheight * 0.085,
                          width: screenwidth * 0.24,
                          child: Icon(
                            index == 1
                                ? Icons.safety_check
                                : index == 0
                                    ? Icons.room_service
                                    : index == 2
                                        ? Icons.store_mall_directory
                                        : index == 3
                                            ? Icons.card_membership
                                            : Icons.help,
                            color: Colors.white,
                            size: 30,
                          ),
                        ),
                        Text(index == 0
                            ? 'Service'
                            : index == 1
                                ? 'Pricavy'
                                : index == 2
                                    ? 'Stores'
                                    : index == 3
                                        ? 'Membership'
                                        : 'Help & support')
                      ],
                    );
                  }),
            )
          ],
        )
      ]),
    );
  }
}

class AvatarWidget extends StatelessWidget {
  const AvatarWidget({Key? key, required this.iconData, required this.name})
      : super(key: key);
  final IconData iconData;
  final String name;
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Icon(
        iconData,
        color: Colors.deepOrange,
      ),
      Text(
        name,
        style: const TextStyle(color: Colors.deepOrange),
      )
    ]);
  }
}

Widget buildMenuItem({
  required String text,
  required IconData icon,
  required BuildContext context,
  required Widget page,
}) {
  const color = Colors.black;
  return Padding(
    padding: const EdgeInsets.all(5),
    child: ListTile(
        hoverColor: Colors.blue,
        selectedColor: Colors.amber,
        leading: Icon(
          icon,
          color: Colors.orange,
        ),
        title: Text(
          text,
          style: const TextStyle(color: Colors.black),
        ),
        onTap: () => jaam(context, page)),
  );
}

class Drawerr extends StatelessWidget {
  const Drawerr({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        width: 230,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            buildMenuItem(
                text: 'Home',
                icon: Icons.home,
                context: context,
                page: const Homepage()),
            buildMenuItem(
                text: 'Person',
                icon: Icons.person,
                context: context,
                page: const Profile()),
            buildMenuItem(
                text: 'Matches',
                icon: Icons.arrow_left,
                context: context,
                page: const Search()),
            buildMenuItem(
                text: 'Search',
                icon: Icons.search,
                context: context,
                page: const Search()),
            buildMenuItem(
                text: 'Mailbox',
                icon: Icons.mail,
                context: context,
                page: const MailBox()),
            buildMenuItem(
                text: 'Upgrade',
                icon: Icons.upgrade,
                context: context,
                page: const UpgradePage()),
            buildMenuItem(
                text: 'Settings',
                icon: Icons.settings,
                context: context,
                page: const SettingsPage()),
            const SizedBox(
              height: 200,
            ),
            Container(
              padding: const EdgeInsets.only(right: 90, left: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Icon(
                    Icons.logout,
                    color: Colors.orange,
                  ),
                  InkWell(
                      onTap: () async {
                        SharedPreferences prefs =
                            await SharedPreferences.getInstance();
                        prefs.remove('token');
                        prefs.remove('user_id');

                        Navigator.pushAndRemoveUntil(context,
                            CupertinoPageRoute(builder: (context) {
                          return const Login();
                        }), (route) => false);
                        Phoenix.rebirth(context);
                      },
                      child: const Text('LOGOUT'))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
