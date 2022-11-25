import 'package:flutter/material.dart';

class IdSearch extends StatelessWidget {
  IdSearch({Key? key}) : super(key: key);
  TextEditingController idcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 20,
        ),
        const Padding(
            padding: EdgeInsets.only(left: 20),
            child: Text(
              'Enter the id of the member you want to search',
              style: TextStyle(fontWeight: FontWeight.bold),
            )),
        const SizedBox(
          height: 10,
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(10)),
          height: 50,
          child: TextFormField(
            controller: idcontroller,
            decoration: const InputDecoration(
              hintText: 'Enter ID',
              border: InputBorder.none,
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          padding: const EdgeInsets.only(top: 10),
          width: 80,
          height: 40,
          decoration: BoxDecoration(
              color: Colors.red, borderRadius: BorderRadius.circular(10)),
          child: const Text(
            'Search',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white),
          ),
        )
      ],
    );
  }
}
