import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:marriage/login/login.dart';
import 'package:marriage/onboarding/Intropage.dart';
import 'package:marriage/onboarding_screen/onboarding_controller.dart';
import 'package:marriage/register/about_user.dart';
import 'package:marriage/register/education.dart';
import 'package:marriage/register/kundali_details.dart';
import 'package:marriage/register/kundali_info.dart';
import 'package:marriage/register/lifestyle_info.dart';
import 'package:marriage/register/register_info.dart';
import 'package:marriage/register/register_page.dart';
import 'package:marriage/screens/homepage.dart';

class Marriage extends ConsumerWidget {
  const Marriage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    ref.watch(onboardingControllerProvider.notifier).check();
    final intro = ref.watch(onboardingControllerProvider);
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Product Sans',
      ),
      debugShowCheckedModeBanner: false,
      routes: {
        '/home': (context) => const Homepage(),
        '/login': (context) => const Login(),
        '/regester_page': (context) => const RegisterPage(),

      },
      home: intro.when(
        visited: () =>  const RegisterPage(),
        // visited: () => token == null ? const Login() : const Homepage(),
        unvisited: () => const OnboardingScreen(),

        loading: () => const Material(
          child: Center(
            child: CircularProgressIndicator(),
          ),
        ),
      ),
    );
  }
}
