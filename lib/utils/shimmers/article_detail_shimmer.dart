import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ArticleDetailShimmer extends StatelessWidget {
  const ArticleDetailShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Shimmer.fromColors(
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
          ),
          Shimmer.fromColors(
            baseColor: Colors.grey.shade300,
            highlightColor: Colors.grey.shade100,
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 20 * width / 375, vertical: 10 * height / 812),
              width: double.infinity,
              height: 30 * height / 812,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5 * width / 375),
                color: Colors.grey.shade300,
              ),
            ),
          ),
          Row(
            children: [
              Shimmer.fromColors(
                baseColor: Colors.grey.shade300,
                highlightColor: Colors.grey.shade100,
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 20 * width / 375, vertical: 15 * height / 812),
                  width: 130 * width / 375,
                  height: 25 * height / 812,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5 * width / 375),
                    color: Colors.grey.shade300,
                  ),
                ),
              ),
              Shimmer.fromColors(
                baseColor: Colors.grey.shade300,
                highlightColor: Colors.grey.shade100,
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 20 * width / 375, vertical: 15 * height / 812),
                  width: 80 * width / 375,
                  height: 25 * height / 812,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5 * width / 375),
                    color: Colors.grey.shade300,
                  ),
                ),
              ),
            ],
          ),
          ...List.generate(9, (index) => Shimmer.fromColors(
            baseColor: Colors.grey.shade300,
            highlightColor: Colors.grey.shade100,
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 20 * width / 375, vertical: 10 * height / 812),
              width: double.infinity,
              height: 20 * height / 812,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5 * width / 375),
                color: Colors.grey.shade300,
              ),
            ),
          )),
        ],
      ),
    );
  }
}
