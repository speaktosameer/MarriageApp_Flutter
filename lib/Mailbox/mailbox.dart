import 'package:flutter/material.dart';
import 'package:marriage/Mailbox/Inbox..dart';
import 'package:marriage/Mailbox/outbox.dart';
import 'package:marriage/screens/homepage.dart';

class MailBox extends StatelessWidget {
  const MailBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        endDrawer: const Drawerr(),
        appBar: AppBar(
          backgroundColor: Colors.deepOrange.shade500,
          centerTitle: true,
          title: const Text('Mailbox'),
        ),
        backgroundColor: Colors.grey.shade200,
        body: ListView(children: [
          Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 15,
                ),
                Container(
                    padding: const EdgeInsets.only(left: 20),
                    child: const Text(
                      'Your Mailbox',
                      style: TextStyle(fontSize: 20),
                    )),
                Container(
                  margin: const EdgeInsets.only(left: 30, top: 10, bottom: 20),
                  color: Colors.white,
                  width: 300,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: const TabBar(
                      indicatorColor: Colors.orange,
                      labelColor: Colors.deepOrangeAccent,
                      unselectedLabelColor: Colors.grey,
                      tabs: [
                        Tab(
                          text: 'Inbox',
                        ),
                        Tab(
                          text: 'Outbox',
                        )
                      ]),
                ),
                const SizedBox(
                  height: 120,
                  child: TabBarView(children: [Inbox(), Outbox()]),
                )
              ]),
        ]),
      ),
    );
  }
}
