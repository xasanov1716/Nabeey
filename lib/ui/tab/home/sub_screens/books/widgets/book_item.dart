import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class BookItem extends StatelessWidget {
  const BookItem(
      {super.key,
      required this.image,
      required this.title,
      required this.subtitle,
      required this.height,
      required this.width,
      required this.onTap});

  final String image;
  final String title;
  final String subtitle;
  final double height;
  final double width;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CachedNetworkImage(
            imageUrl: image,
            height: height * 148 / 812,
            width: width * 121 / 375,
            placeholder: (context, url) => Shimmer.fromColors(
              baseColor: Colors.grey.shade300,
              direction: ShimmerDirection.ltr,
              highlightColor: Colors.grey.shade100,
              child:  Container(
                height: height * 148 / 812,
                width: width * 121 / 375,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20 * width / 375),
                  color: Colors.grey.shade300,
                ),
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: const TextStyle(fontSize: 20)),
              Text(subtitle),
            ],
          ),
          SizedBox(
            width: 10,
          ),
        ],
      ),
    );
  }
}
