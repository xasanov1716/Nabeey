import 'package:contest_app/ui/tab/home/sub_screens/videos/sub_screens/video_detail/widgets/video_item.dart';
import 'package:contest_app/utils/colors.dart';
import 'package:flutter/material.dart';

class VideoDetailScreen extends StatefulWidget {
  const VideoDetailScreen({super.key});

  @override
  State<VideoDetailScreen> createState() => _VideoDetailScreenState();
}

class _VideoDetailScreenState extends State<VideoDetailScreen> {
  final List<String> videoUrls = [
    "https://www.youtube.com/watch?v=kxv4-NAmtlY&pp=ygUZUm9zdWx1bGxvaG5pIHR1ZydpbGlzaGFyaQ%3D%3D",
    "https://www.youtube.com/watch?v=QJdTeo_-sU4&list=PLtnBT_FLbSj8J0Gv0mcUM7OKWTCI5XTkv&index=7&pp=iAQB",
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: (){
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back),
          ),
        ),
        body: ListView(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              child: Text("Ikrom Sharif videolari", style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 24,
                  color: AppColors.C_111111
              ),),
            ),
            ...List.generate(videoUrls.length, (index) => VideoItem(
              videoUrl: videoUrls[index]
            ))
          ],
        )
    );
  }
}
