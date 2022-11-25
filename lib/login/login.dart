import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:marriage/login/loginemailcontent.dart';
import 'package:marriage/login/loginnumber.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController namecontroller = TextEditingController();

  final TextEditingController passcontroller = TextEditingController();

  bool isselect = true;

  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    return SafeArea(
        child: DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          //physics: const NeverScrollableScrollPhysics(),
          child: Container(
            padding: const EdgeInsets.only(top: 50),
            height: MediaQuery.of(context).size.height,
            child: Column(children: [
              const Text(
                'LOGIN',
                textAlign: TextAlign.start,
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.w400),
              ),
              SizedBox(
                height: 200,
                child: Lottie.asset('assets/animations/marry.json'),
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.pink, borderRadius: BorderRadius.circular(8)),
                margin: const EdgeInsets.symmetric(horizontal: 50),
                child: TabBar(
                    indicator: BoxDecoration(
                        color: Colors.deepOrange,
                        borderRadius: BorderRadius.circular(8)),
                    tabs: const [
                      Tab(
                        text: 'Email address',
                      ),
                      Tab(
                        text: 'Mobile Number',
                      )
                    ]),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 450 - 56,
                child: TabBarView(children: [
                  const LoginContent(),
                  LoginNumber(),
                ]),
              )
            ]),
          ),
        ),
      ),
    ));
  }
}
