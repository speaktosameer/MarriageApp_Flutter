import 'package:flutter/material.dart';
import 'upgradecustom.dart';

class UpgradePage extends StatelessWidget {
  const UpgradePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.deepOrange.shade400,
        title: const Text('Upgrade'),
      ),
      body: ListView(
        children: [
          Column(
            children: const [
              SizedBox(
                height: 200,
              ),
              UpgradeCustom(
                  duration: 'Duration : 180 days',
                  viewp: 'View profile : 50 times',
                  price: 'Rs 5000',
                  title: 'GOLD'),
              UpgradeCustom(
                  duration: 'Duration : 180 days',
                  viewp: 'View profile : 50 times',
                  price: 'Rs 10000',
                  title: 'Foreign'),
              UpgradeCustom(
                  duration: 'Duration : 90 days',
                  viewp: 'View profile : 50 times',
                  price: 'Rs 2500',
                  title: 'Economy')
            ],
          )
        ],
      ),
    );
  }
}
