import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:marriage/data/controller/get_top_user_controller.dart';
import 'package:marriage/data/model/image_model.dart';

class TopUsers extends StatefulWidget {
  const TopUsers({Key? key}) : super(key: key);

  @override
  State<TopUsers> createState() => _TopUsersState();
}

class _TopUsersState extends State<TopUsers> {
  @override
  Widget build(BuildContext context) {
    double screenheight = MediaQuery.of(context).size.height;
    double screenwidth = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepOrange,
          title: const Text('Top Users'),
        ),
        body: Consumer(
          builder: (context, ref, child) {
            final data = ref.watch(topuserInfoProvider);
            return data.when(data: (d) {
              return SizedBox(
                height: screenheight,
                child: ListView.builder(
                    itemCount: imagesList.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Card(
                            margin: const EdgeInsets.all(10),
                            child: ListTile(
                              leading: SizedBox(
                                width: screenwidth * 0.15,
                                child: Image.network(
                                  imagesList[index].Image,
                                  fit: BoxFit.fill,
                                ),
                              ),
                              title: Text(
                                  '${d.user[index].firstname} ${d.user[index].secondname}'),
                            ),
                          )
                        ],
                      );
                    }),
              );
            }, error: (err, s) {
              return Text(err.toString());
            }, loading: () {
              return const Center(
                child: CircularProgressIndicator(),
              );
            });
          },
        ));
  }
}
