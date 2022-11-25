import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:marriage/data/model/login_info_model.dart';
import 'package:marriage/data/model/user.dart';
import 'package:marriage/widgets/controller_helper.dart';
import '../api_integration/api_setting.dart';
import '../data/controller/shared_pref_controlledr.dart';
import '../data/model/userlogin.dart';
import '../process_response.dart';
import 'package:http/http.dart' as http;
class AuthController  {

  Future<ProcessResponse> login({required String email, required String password}) async {
    Uri uri = Uri.parse(ApiSetting.login);
    var response = await http.post(
        uri, body: {'email': email, 'password': password});
    if (response.statusCode == 200 || response.statusCode == 400) {
      print(response.statusCode);
      var json = jsonDecode(response.body);
      if (response.statusCode == 200) {
        UserLogin user = UserLogin.fromJson(json['user']);
        SharedPrefController().save(user: user);
      }
      return ProcessResponse(
          massage: json['status'], succsess: true);
    }
    return ProcessResponse(massage: "", succsess: false);
  }

  Future<ProcessResponse> loginWithNumber({required String mobilNumber}) async {
    Uri uri = Uri.parse(ApiSetting.loginUsingNumber);
    var response = await http.post(
        uri, body: {"mobileNumber" : mobilNumber});
    if (response.statusCode == 200 || response.statusCode == 400) {
      print(response.statusCode);
      var json = jsonDecode(response.body);
      if (response.statusCode == 200) {
        UserLogin user = UserLogin.fromJson(json['user']);
        SharedPrefController().save(user: user);
        print(response.statusCode );

      }
      return ProcessResponse(
          massage: json['status'], succsess: true);
    }
    return ProcessResponse(massage: "having erorr", succsess: false);
  }

  Future<ProcessResponse> singUp(UserRegester user) async {
    Uri uri = Uri.parse(ApiSetting.register);
    var response = await http.post(uri, body:
    {
      'firstName': user.firstName,
      'lastName': user.lastName,
      'mobileNumber': user.mobileNumber,
      'email': user.email,
       'password' :user.password
    });
    if (response.statusCode == 201 || response.statusCode == 400) {
      var jeson = jsonDecode(response.body);
      return ProcessResponse(
          massage: jeson["message"], succsess: true);
    }
    print("malsa : ${response.statusCode}");
    return ProcessResponse(massage: "", succsess: false);
  }

  Future<ProcessResponse> resetPassword({required String email}) async {
    Uri uri = Uri.parse(ApiSetting.resetPassword);
    var response = await http.post(
        uri, body: {'email': email});
    if (response.statusCode == 200 || response.statusCode == 400) {
      print(response.statusCode);
      var json = jsonDecode(response.body);
      if (response.statusCode == 200) {
        UserLogin user = UserLogin.fromJson(json['user']);
        SharedPrefController().save(user: user);
      }
      return ProcessResponse(
          massage: json['status'], succsess: true);
    }
    return ProcessResponse(massage: "error", succsess: false);
  }



  // Future<bool> logout() async {
  //   var url = Uri.parse(ApiSetting.logout);
  //   var response = await http.post(url, headers: headers);
  //   if (response.statusCode == 200 || response.statusCode == 401) {
  //     SharedPrefController().clear();
  //     return true;
  //   }
  //   return false;
  // }
  //
  // Future<bool> forgetPassword(BuildContext context,
  //     {required String mobile}) async {
  //   var url = Uri.parse(ApiSetting.sendCode);
  //   var response = await http.post(url,
  //       body: {
  //         'mobile': mobile,
  //       },
  //       headers: headers);
  //   if (response.statusCode == 200) {
  //     print(jsonDecode(response.body)['code_debug']);
  //     return true;
  //   } else if (response.statusCode == 400) {
  //    showSnackBar(
  //         context: context,
  //         message: (jsonDecode(response.body)['message']),
  //         error: true);
  //   } else {
  //     showSnackBar(
  //         context: context,
  //         message: (jsonDecode(response.body)['message']),
  //         error: true);
  //   }
  //   return false;
  // }
  //

  void _setHeaders() =>{
    'Content-Type' : 'application/x-www-form-urlencoded',
    'Accept':'*/*'
  };


}