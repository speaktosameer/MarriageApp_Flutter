import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:marriage/data/controller/post_controller.dart';
import 'package:marriage/process_response.dart';
import 'package:marriage/provider/auth_provider_controller.dart';
import 'package:marriage/register/register_info.dart';
import 'package:marriage/register/register_page.dart';
import 'package:marriage/reset_password.dart';
import 'package:marriage/widgets/controller_helper.dart';

import '../data/model/login_model.dart';
import '../widgets/Custom_text_field.dart';

class LoginContent extends StatefulWidget {
  const LoginContent({Key? key}) : super(key: key);

  @override
  State<LoginContent> createState() => _LoginContentState();
}

class _LoginContentState extends State<LoginContent> {

 late TextEditingController _emailController ;
 late TextEditingController _passwordController ;
 String? _emailErorr , _passwordErorr;
 bool isloading = false;
 bool obsecuretext = true;


 @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }
@override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  // final TextEditingController namecontroller =
  //     TextEditingController(text: 'rosantmg12@gmail.com');
  //
  // final TextEditingController passcontroller =
  //     TextEditingController(text: 'Football@123');



  final GlobalKey<FormState> formkey = GlobalKey<FormState>();


  int validateEmail(String emailAddress) {
    String patttern = r'^[\w-.]+@([\w-]+.)+[\w-]{2,4}$';
    RegExp regExp = RegExp(patttern);
    if (emailAddress.isEmpty || emailAddress.isEmpty) {
      return 1;
    } else if (!regExp.hasMatch(emailAddress)) {
      return 2;
    } else {
      return 0;
    }
  }

  int validatePassword(String pswd) {
    if (pswd.isEmpty) {
      return 1;
    } else if (pswd.isNotEmpty) {
      return 2;
    } else {
      return 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    double screenheight = MediaQuery.of(context).size.height;
    return Form(
      key: formkey,
      child: ListView(children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 30),
          padding: const EdgeInsets.all(5),
          //height: 450,
          width: screenwidth,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTextField(
                errorText: _emailErorr,
                text1: 'Email',
                controller: _emailController,
                hinttext: 'Enter your email',
                title: 'Email',
                validate: (value) {
                  int res = validateEmail(_emailController.text);
                  if (res == 1) {
                    return "Please fill email address";
                  } else if (res == 2) {
                    return "Please enter valid email";
                  } else {
                    return null;
                  }
                },
              ),
              const SizedBox(
                height: 10,
              ),
              CustomTextField(
                  errorText: _passwordErorr,
                  obsecuretext: obsecuretext,
                  textInputAction: TextInputAction.done,
                  text1: 'Password',
                  controller: _passwordController,
                  hinttext: 'Enter your password',
                  title: 'Password',
                  suffixicon: IconButton(
                      onPressed: () {
                        setState(() {
                          obsecuretext = !obsecuretext;
                        });
                      },
                      icon: obsecuretext
                          ? const Icon(
                              Icons.lock_open,
                              color: Colors.black,
                            )
                          : const Icon(
                              Icons.lock,
                              color: Colors.black,
                            )),
                  validate: (value) {
                    int res = validatePassword(_passwordController.text);
                    if (res == 1) {
                      return 'Password must not be empty';
                    } else {
                      return null;
                    }
                  }),
              const SizedBox(
                height: 20,
              ),
              Consumer(builder: (context, ref, child) {
                // final data =
                //     ref.read(registerUserNotifierprovider.notifier);
                return isloading
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : InkWell(
                        onTap: () async {
                          login();
                          if (formkey.currentState!.validate()) {
                            setState(() {
                              isloading = true;
                            });
                            LoginModel loginModel = LoginModel(
                                email: _emailController.text,
                                password: _passwordController.text);

                            await ref
                                .watch(registerUserNotifierprovider.notifier)
                                .postlogin(loginModel, context);
                            setState(() {
                              isloading = false;
                            });
                          }
                        },

                        // Navigator.of(context)
                        //     .push(MaterialPageRoute(builder: (context) {
                        //   return const Homepage();
                        // })),
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              color: Colors.red.shade600.withOpacity(0.9),
                              borderRadius: BorderRadius.circular(10)),
                          height: screenheight * 0.06,
                          width: screenwidth * 0.8,
                          child: const Text(
                            'LOGIN',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w400,
                                color: Colors.white),
                          ),
                        ),
                      );
              }),
              Center(
                child: TextButton(
                  onPressed: (){
                    resetPassword(_emailController.text.toString());
                  },
                  child: const Text(
                  'Forgot password?',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.redAccent,
                      decoration: TextDecoration.underline),
                ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'New Here?',
                    style: TextStyle(color: Colors.grey),
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.pushAndRemoveUntil(context,
                            CupertinoPageRoute(builder: (BuildContext context) {
                          return const RegisterPage();
                        }), (route) => false);
                      },
                      child: const Text('Create an account'))
                ],
              ),
            ],
          ),
        )
      ]),
    );
  }

  performLogin(){
    if(checkData()){
      login();
    }

  }
  bool checkData(){
    _emailErorr = _emailController.text.isEmpty ? "please email is required !" : null ;
    _passwordErorr = _passwordController.text.isEmpty ? "please password is required !" : null ;
    if(_emailController.text.isNotEmpty && _passwordController.text.isNotEmpty){
      return true;
    }
    _emailErorr = _emailController.text.isEmpty ? "please email is required !" : null ;
    _passwordErorr = _passwordController.text.isEmpty ? "please password is required !" : null ;
    return false;
  }
  login() async{
    ProcessResponse processResponse =
        await  AuthController().login(email: _emailController.text,
        password: _passwordController.text);
    if (processResponse.succsess) {
      Navigator.pushReplacementNamed(context, '/home');
    }
    else{
      context.snackBar(
          massage: processResponse.massage, error: !processResponse.succsess);
    }

  }

  resetPassword(String email){
    Navigator.push(context, MaterialPageRoute(builder: (context) =>
    ResetPassword(email : email)
    ));
    Navigator.pushNamed(context, '/reset_password');
  }
}
