import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:marriage/login/login.dart';
import 'package:marriage/onboarding_screen/onboarding_controller.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  late PageController controller;

  bool isLastPage = false;

  @override
  void initState() {
    controller = PageController();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void checkLastPage(int index) {
    return setState(() {
      isLastPage = index == 2;
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenheight = MediaQuery.of(context).size.height;
    double screenwidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(bottom: 80),
        child: PageView(
          controller: controller,
          onPageChanged: (index) => checkLastPage(index),
          children: [
            buildPage(
                color: Colors.white,
                urlImage: 'assets/images/wedding.png',
                title: 'Marriage Station',
                subtitle:
                    '  Nepal\'s No. 1 and Most Trusted Matrimony service, has helped Millions'),
            buildPage(
                color: Colors.white,
                urlImage: 'assets/images/Wedding2.png',
                title: 'Find your perfect match',
                subtitle: 'Match youself with your own preferences'),
            buildPage(
                color: Colors.white,
                urlImage: 'assets/images/wedding3.png',
                title: 'Why Marriage Station?',
                subtitle:
                    'Start your search for a perfect match at Marriage Station'),
          ],
        ),
      ),
      bottomSheet: isLastPage
          ? Consumer(
              builder: (context, ref, child) {
                return Container(
                  color: Colors.red.shade500,
                  height: screenheight * 0.097,
                  width: screenwidth,
                  child: TextButton(
                    onPressed: () async {
                      await ref
                          .watch(onboardingControllerProvider.notifier)
                          .visited();
                      // ignore: use_build_context_synchronously
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => const Login()),
                      );
                    },
                    child: const Text(
                      'Find Your Match',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                );
              },
            )
          : Container(
              color: Colors.white,
              height: screenheight * 0.0991,
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () => controller.jumpToPage(2),
                    child: const Text(
                      'Skip',
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),
                  Center(
                    child: SmoothPageIndicator(
                      controller: controller,
                      count: 3,
                      effect: const WormEffect(
                        spacing: 16,
                        radius: 15,
                        dotHeight: 8,
                        dotWidth: 8,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () => controller.nextPage(
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeInOut),
                    child: const Text('Next'),
                  )
                ],
              ),
            ),
    );
  }

  Widget buildPage({
    required Color color,
    required String urlImage,
    required String title,
    required String subtitle,
  }) =>
      Container(
        color: color,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              urlImage,
              fit: BoxFit.cover,
              width: double.infinity,
            ),
            const SizedBox(
              height: 40,
            ),
            Text(
              title,
              style: const TextStyle(
                color: Colors.black87,
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                subtitle,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.black87,
                  fontSize: 15,
                ),
              ),
            ),
          ],
        ),
      );
}
