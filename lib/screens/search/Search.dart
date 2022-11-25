import 'package:flutter/material.dart';
import 'package:marriage/screens/homepage.dart';

import 'Basic_search.dart';
import 'id_search.dart';

class Search extends StatelessWidget {
  const Search({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenheight = MediaQuery.of(context).size.height;
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        endDrawer: const Drawerr(),
        appBar: AppBar(
          backgroundColor: Colors.deepOrange.shade500,
          centerTitle: true,
          title: const Text('Search'),
        ),
        body: ListView(children: [
          Column(children: [
            const SizedBox(
              height: 15,
            ),
            Container(
              width: 300,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: const TabBar(
                  indicatorColor: Colors.orange,
                  labelColor: Colors.deepOrangeAccent,
                  unselectedLabelColor: Colors.grey,
                  tabs: [
                    Tab(
                      text: 'Regular Search',
                    ),
                    Tab(
                      text: 'Id Search',
                    )
                  ]),
            ),
            SizedBox(
              height: screenheight * 1.24,
              child: TabBarView(children: [const BasicSearch(), IdSearch()]),
            )
          ]),
        ]),
      ),
    );
  }
}
