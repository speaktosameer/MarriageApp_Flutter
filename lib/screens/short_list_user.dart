import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:marriage/data/controller/shortlist_controller.dart';

import '../data/model/image_model.dart';

class ShortListUsers extends StatefulWidget {
  const ShortListUsers({Key? key}) : super(key: key);

  @override
  State<ShortListUsers> createState() => _ShortListUsersState();
}

class _ShortListUsersState extends State<ShortListUsers> {
  @override
  Widget build(BuildContext context) {
    double screenheight = MediaQuery.of(context).size.height;
    double screenwidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        title: const Text('Shortlist'),
      ),
      body: Consumer(builder: (context, ref, child) {
        final data = ref.watch(shortListProvider);
        return data.when(data: (d) {
          return SizedBox(
            height: screenheight,
            width: screenwidth,
            child: ListView.builder(
                itemCount: circleimages.length,
                itemBuilder: (context, index) {
                  return Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.all(10),
                        child: CircleAvatar(
                          radius: 50,
                          backgroundColor: Colors.white,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: Image.network(
                              circleimages[index].Image,
                              fit: BoxFit.contain,
                              height: 100,
                              width: 100,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(top: 0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              ' ${d[index].user.firstname} ${d[index].user.secondname}',
                              style: const TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                                ' ${d[index].age} yrs , ${d[index].height} , ${d[index].gender}'),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(' ${d[index].city}')
                          ],
                        ),
                      )
                    ],
                  );
                }),
          );
        }, error: (err, s) {
          return Text(err.toString());
        }, loading: () {
          return const Center(child: CircularProgressIndicator());
        });
      }),
    );
  }
}
