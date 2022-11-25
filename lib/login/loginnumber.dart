import 'package:flutter/material.dart';
import 'package:marriage/process_response.dart';
import 'package:marriage/provider/auth_provider_controller.dart';
import 'package:marriage/widgets/controller_helper.dart';

class LoginNumber extends StatelessWidget {
  LoginNumber({Key? key}) : super(key: key);
  TextEditingController numbercontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;

    return SizedBox(
        height: 500,
        child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 30),
            padding: const EdgeInsets.all(5),
            height: 500,
            width: screenwidth,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Mobile Number',
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(15),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10)),
                          height: 50,
                          width: 80,
                          child: const Text('+ 977'),
                        ),
                        Container(
                          padding: const EdgeInsets.all(10),
                          margin: const EdgeInsets.only(bottom: 20),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10)),
                          height: 50,
                          width: screenwidth / 2,
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            controller: numbercontroller,
                            decoration: const InputDecoration(
                              hintText: 'Enter your number',
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ]),

                  InkWell(
                    onTap: (){
                      loginUsingNumber(context);
                      print("object");
                    },
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      margin: EdgeInsets.only(bottom: 20),
                      decoration: BoxDecoration(
                          color: Colors.red.shade400,
                          borderRadius: BorderRadius.circular(10)),
                      height: 50,
                      width: 300,
                      child: const Text(
                        'LOGIN',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                            color: Colors.white),
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
                            Navigator.of(context).pop();
                          },
                          child: const Text('Create an account'))
                    ],
                  )
                ])));
  }

  void loginUsingNumber(BuildContext context) async{
    ProcessResponse processResponse = await AuthController()
        .loginWithNumber(mobilNumber: numbercontroller.text);
    if(processResponse.succsess){
      Navigator.pushReplacementNamed(context, '/home');
    }
    else{
      context.snackBar(massage: processResponse.massage, error: !processResponse.succsess);
    }
  }
}
