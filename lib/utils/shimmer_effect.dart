import 'package:flutter/material.dart';

import 'package:shimmer/shimmer.dart';

class ShimmerEffets extends StatelessWidget {
  const ShimmerEffets({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        baseColor: Colors.grey.shade400,
        highlightColor: Colors.grey.shade100,
        child: SizedBox(
          height: 250,
          child: ListView.builder(
              itemBuilder: (context, index) => Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.all(10),
                        child: const CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 50,
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 5,
                            width: 100,
                            color: Colors.white,
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Container(
                            height: 5,
                            width: 100,
                            color: Colors.white,
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Container(
                            height: 5,
                            width: 100,
                            color: Colors.white,
                          ),
                        ],
                      )
                    ],
                  ),
              itemCount: 2),
        )

        // Row(
        //   children: [
        //     Container(
        //       margin: const EdgeInsets.all(10),
        //       child: CircleAvatar(
        //         radius: 50,
        //         backgroundColor: Colors.deepPurple.shade50,
        //         child: const Icon(Icons.person,
        //             size: 80, color: Colors.amberAccent),
        //       ),
        //     ),
        //     Container(
        //       padding: const EdgeInsets.only(top: 0),
        //       child: Column(
        //         crossAxisAlignment: CrossAxisAlignment.start,
        //         children: [
        //           SizedBox(
        //             height: 5,
        //             width: 80,
        //           ),
        //           const SizedBox(
        //             height: 5,
        //           ),
        //           SizedBox(
        //             height: 5,
        //             width: 80,
        //           ),
        //           const SizedBox(
        //             height: 5,
        //           ),
        //           SizedBox(
        //             height: 5,
        //             width: 80,
        //           )
        //         ],
        //       ),
        //     )
        //   ],
        // ));
        );
  }
}

class TopUserShimmer extends StatelessWidget {
  const TopUserShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        baseColor: Colors.grey,
        highlightColor: Colors.grey.shade100,
        child: SizedBox(
          height: 150,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 3,
              itemBuilder: (context, index) {
                return Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.all(20),
                      height: 100,
                      width: 100,
                      color: Colors.grey,
                    )
                  ],
                );
              }),
        ));
  }
}

class AppBarShimmer extends StatelessWidget {
  const AppBarShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        baseColor: Colors.grey,
        highlightColor: Colors.grey.shade100,
        child: Column(
          children: [
            Container(
              height: 10,
              width: 40,
            ),
            Container(
              height: 20,
              width: 80,
            )
          ],
        ));
  }
}
