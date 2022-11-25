import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:marriage/data/model/login_model.dart';
import 'package:marriage/data/model/register_model.dart';
import 'package:marriage/data/model/register_response.dart';
import 'package:marriage/data/repositiory/repository.dart';
import 'package:marriage/local/db_client.dart';
import 'package:marriage/login/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../screens/homepage.dart';

class RegisterUserNotifier extends StateNotifier<AsyncValue<RegisterResponse>> {
  RegisterUserNotifier(this.registerRepository)
      : super(const AsyncValue.loading());
  RegisterRepository registerRepository;

  postUser(RegisterModel registerModel, BuildContext context) async {
    final result = await registerRepository.postuser(registerModel);

    return result.fold(
      (l) => ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          duration: const Duration(seconds: 3),
          behavior: SnackBarBehavior.floating,
          content: Text(l.message),
          backgroundColor: Colors.red,
        ),
      ),
      (r) {
        Navigator.of(context)
            .pushReplacement(CupertinoPageRoute(builder: (context) {
          return const Login();
        }));
        return ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            behavior: SnackBarBehavior.floating,
            duration: Duration(seconds: 3),
            elevation: 0,
            content: Text('Successfully Created Account'),
            backgroundColor: Colors.green,
          ),
        );
      },
    );
  }

  postlogin(LoginModel loginModel, BuildContext context) async {
    final data = await registerRepository.postlogin(loginModel);
    Dbclient dbclient = Dbclient();
    return data.fold(
      (l) => ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          duration: const Duration(seconds: 3),
          behavior: SnackBarBehavior.floating,
          content: Text(l.message),
          backgroundColor: Colors.red,
        ),
      ),
      (r) async {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString('token', r.token);
        prefs.setString('user_id', r.user.user_id);
        Navigator.of(context)
            .pushReplacement(CupertinoPageRoute(builder: (context) {
          return const Homepage();
        }));
        return ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            duration: Duration(seconds: 3),
            behavior: SnackBarBehavior.floating,
            shape: Border.symmetric(),
            elevation: 0,
            content: Text('Login successfull'),
            backgroundColor: Colors.green,
          ),
        );
      },
    );
  }
}

final registerUserNotifierprovider =
    StateNotifierProvider<RegisterUserNotifier, AsyncValue<RegisterResponse>>(
        (ref) {
  return RegisterUserNotifier(ref.watch(registerrepoprovider));
});
