import 'package:flutter/material.dart';

class UpgradeCustom extends StatelessWidget {
  const UpgradeCustom(
      {Key? key,
      required this.duration,
      required this.viewp,
      required this.price,
      required this.title})
      : super(key: key);
  final String duration;
  final String viewp;
  final String price;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(15),
      height: 290,
      width: 280,
      child: Column(children: [
        Text(
          title,
          style: const TextStyle(color: Colors.deepOrange, fontSize: 25),
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          children: [const Icon(Icons.timeline), Text(duration)],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(viewp),
            const Icon(
              Icons.check,
              color: Colors.green,
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Text('Live chat: Unlimited'),
            Icon(
              Icons.check,
              color: Colors.green,
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Text('Personal message: 50 times'),
            Icon(
              Icons.check,
              color: Colors.green,
            ),
          ],
        ),
        const SizedBox(
          height: 30,
        ),
        Text(
          price,
          style: const TextStyle(color: Colors.orange, fontSize: 20),
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          padding: const EdgeInsets.only(top: 8),
          height: 40,
          width: 240,
          decoration: BoxDecoration(
              color: Colors.pink, borderRadius: BorderRadius.circular(10)),
          child: const Text(
            'BUY NOW',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        )
      ]),
    );
  }
}
