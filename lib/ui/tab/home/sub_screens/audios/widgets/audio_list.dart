import 'package:flutter/material.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class AudioList extends StatelessWidget {
  const AudioList({super.key, required this.index, required this.onTap});
  final int index;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    double apphight = MediaQuery.of(context).size.height;
    return ZoomTapAnimation(
      onTap: onTap,
      child: Container(
        height: (56 / apphight) * 800,
        width: double.infinity,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: const BorderRadius.all(Radius.circular(15))),
        child: Text('Audio $index'),
      ),
    );
  }
}
