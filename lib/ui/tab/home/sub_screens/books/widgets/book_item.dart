import 'package:flutter/material.dart';

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
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset(
            image,
            height: height * 148 / 812,
            width: width * 121 / 375,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: const TextStyle(fontSize: 20)),
              Text(subtitle),
            ],
          )
        ],
      ),
    );
  }
}
