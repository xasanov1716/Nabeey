import 'package:contest_app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class AudioList extends StatelessWidget {
  const AudioList({super.key, required this.title, required this.onTap});

  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ZoomTapAnimation(
      onTap: onTap,
      child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
              border: Border.all(color: AppColors.black.withOpacity(0.1)),
              borderRadius: const BorderRadius.all(Radius.circular(15))),
          child: Padding(
            padding: const EdgeInsets.all(18),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    overflow: TextOverflow.ellipsis,
                    fontFamily: "SF Pro Display",
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff111111),
                    height: 20 / 18,
                  ),
                  textAlign: TextAlign.left,
                ),
                // Visibility(
                //   visible: true,
                //   child: SizedBox(
                //       width: 50,
                //       height: 25,
                //       child: Lottie.asset("assets/audio_playing.json")),
                // )
              ],
            ),
          )),
    );
  }
}
