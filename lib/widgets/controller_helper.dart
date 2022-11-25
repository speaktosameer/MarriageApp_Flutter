
import 'package:flutter/material.dart';

extension ControllerHelp on BuildContext{

 void snackBar({required String massage , bool error =false}){
   ScaffoldMessenger.of(this).showSnackBar(
     SnackBar(content: Text(massage),
       backgroundColor:error == true ? Color(0xFFEE3237) :Color(0xFFFBA808),
       elevation: 2,
       duration: Duration(seconds: 2),),
   );
   }

}