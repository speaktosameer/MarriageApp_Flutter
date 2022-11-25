import 'package:flutter/material.dart';

class ProfileDetails extends StatelessWidget {
  const ProfileDetails({Key? key, required this.text, this.text2})
      : super(key: key);
  final String text;
  final String? text2;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          width: 80,
          //color: Colors.red,
          child: Text(
            text,
            style: const TextStyle(fontWeight: FontWeight.w600),
          ),
        ),
        const SizedBox(
          width: 30,
        ),
        Text(text2!)
      ],
    );
  }
}
