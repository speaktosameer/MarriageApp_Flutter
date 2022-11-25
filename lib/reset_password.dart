import 'package:flutter/material.dart';
import 'package:marriage/process_response.dart';
import 'package:marriage/provider/auth_provider_controller.dart';
import 'package:marriage/widgets/controller_helper.dart';
class ResetPassword extends StatefulWidget {
   ResetPassword({Key? key ,required this.email}) : super(key: key);
String email ;
  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {

 late TextEditingController _emailController;
  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
  }
  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.deepOrange.shade500,
        centerTitle: true,
        title: const Text(
          'Reset Password ',
          textAlign: TextAlign.center,
        ),
      ),
      body: Column(children: [
         Text(
          'Reset Password ',),
        Text("last email : ${widget.email}"),
        TextFormField(
          keyboardType: TextInputType.number,
          controller: _emailController,
          decoration: const InputDecoration(
            hintText: 'Enter your email',
            border: InputBorder.none,
          ),
        ),
        ElevatedButton(
          onPressed: () {
            resetPassword();


          },
          child: Text("Reset password"),
          style: ElevatedButton.styleFrom(
            primary: Colors.deepOrange.shade500,
            minimumSize: Size(340, 60),
            elevation: 2,
            alignment: AlignmentDirectional.center,
            padding: EdgeInsets.symmetric(
                horizontal: 20, vertical: 10),
          ),
        ),

      ],),
    );
  }

 resetPassword() async{
if(_emailController.text.isNotEmpty){
    ProcessResponse processResponse =
    await  AuthController().resetPassword(email: _emailController.text);
    if (processResponse.succsess) {
      print("namlsa");
      context.snackBar(
          massage: processResponse.massage, error: !processResponse.succsess);
    }
    else{
      print("namlsa");

      context.snackBar(
          massage: processResponse.massage, error: !processResponse.succsess);

    }
}
 }
}
