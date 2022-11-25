import 'package:flutter/material.dart';

import '../register/register_info.dart';
import '../widgets/Custom_text_field.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  TextEditingController oldpasscontroller = TextEditingController();

  TextEditingController newpasscontroller = TextEditingController();

  TextEditingController renewpasscontroller = TextEditingController();

  bool isvisible = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            title: const Text('Settings'),
            backgroundColor: Colors.deepOrange,
          ),
          body: ListView(
            children: [
              Column(
                children: [
                  ListTile(
                    onTap: () {
                      setState(() {
                        isvisible = !isvisible;
                      });
                    },
                    title: const Text('Change password'),
                    leading: const Icon(Icons.password),
                  ),
                  Visibility(
                    replacement: const SizedBox.shrink(),
                    visible: isvisible,
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      height: 350,
                      width: 400,
                      child: Column(
                        children: [
                          CustomTextField(
                              title: 'Old password',
                              text1: 'Old password',
                              controller: oldpasscontroller,
                              hinttext: 'Enter your old password'),
                          CustomTextField(
                              title: 'New Password',
                              text1: 'New password',
                              controller: newpasscontroller,
                              hinttext: 'Enter new password'),
                          CustomTextField(
                              title: 'Re-type New password',
                              text1: 'Re-type new password',
                              controller: renewpasscontroller,
                              hinttext: 'Enter new password'),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            alignment: Alignment.center,
                            height: 40,
                            width: 200,
                            decoration: BoxDecoration(
                                color: Colors.deepOrange.shade300,
                                borderRadius: BorderRadius.circular(10)),
                            child: const Text(
                              'Done',
                              style:
                                  TextStyle(fontSize: 18, color: Colors.white),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  const ListTile(
                    title: Text('Delete Account'),
                    leading: Icon(Icons.delete),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
