import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class HomeShimmer extends StatelessWidget {
  const HomeShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 200 * width / 375,
        leading: Shimmer.fromColors(
          baseColor: Colors.grey.shade300,
          highlightColor: Colors.grey.shade100,
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 20 * width / 375,vertical: 18 * height / 812),
            width: 180 * width / 375,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5 * width / 375),
              color: Colors.grey.shade300,
            ),
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: 3,
        itemBuilder: (context, index) {
          return Shimmer.fromColors(
            baseColor: Colors.grey.shade300,
            highlightColor: Colors.grey.shade100,
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20 * width / 375, vertical: 10 * width / 375),
                  height: 206 * width / 375,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20 * width / 375),
                    color: Colors.grey.shade300,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
