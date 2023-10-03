import 'package:contest_app/ui/tab/profile/widgets/global_button.dart';
import 'package:contest_app/ui/tab/profile/widgets/global_text_field.dart';
import 'package:contest_app/ui/tab/profile/widgets/image_button.dart';
import 'package:contest_app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ArticleCreateScreen extends StatefulWidget {
  const ArticleCreateScreen({super.key});

  @override
  State<ArticleCreateScreen> createState() => _ArticleCreateScreenState();
}

class _ArticleCreateScreenState extends State<ArticleCreateScreen> {
  ImagePicker picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: height * (20 / 812)),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  SizedBox(height: height * (28 / 812)),
                  const Text(
                    'Maqola nomi',
                    style: TextStyle(
                      color: AppColors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: height * (4 / 812)),
                  SizedBox(
                    height: height * (59 / 812),
                    child: const GlobalTextField(
                      hintText: 'Maqola nomini kiriting',
                      maxLines: 1,
                    ),
                  ),
                  SizedBox(height: height * (16 / 812)),
                  ImageButton(
                    onTap: () {
                      showBottomSheetDialog(context);
                    },
                  ),
                  SizedBox(height: height * (24 / 812)),
                  const Text(
                    'Text',
                    style: TextStyle(
                      color: AppColors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: height * (4 / 812)),
                  const GlobalTextField(
                    hintText: 'Matnni kiriting',
                    maxLines: 15,
                  ),
                  SizedBox(height: height * (16 / 812)),
                ],
              ),
            ),
            GlobalButton(
              color: AppColors.white,
              text: 'Jo\'natish',
              onTap: () {},
            ),
            SizedBox(height: height * (30 / 812)),
          ],
        ),
      ),
    );
  }

  void showBottomSheetDialog(BuildContext context) {
    showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.all(24),
          // height: 200,
          decoration: const BoxDecoration(
            color: Color.fromARGB(255, 255, 248, 248),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                onTap: () {
                  _getFromCamera(context);
                },
                leading: const Icon(Icons.camera_alt),
                title: const Text("Select from Camera"),
              ),
              ListTile(
                onTap: () {
                  _getFromGallery(context);
                },
                leading: const Icon(Icons.photo),
                title: const Text("Select from Gallery"),
              ),
            ],
          ),
        );
      },
    );
  }

  Future<void> _getFromCamera(BuildContext context) async {
    XFile? xFile = await picker.pickImage(
      source: ImageSource.camera,
      maxHeight: 512,
      maxWidth: 512,
    );

    if (context.mounted) {
      if (xFile != null) {}
      Navigator.pop(context);
    }
  }

  Future<void> _getFromGallery(BuildContext context) async {
    XFile? xFile = await picker.pickImage(
      source: ImageSource.gallery,
      maxHeight: 512,
      maxWidth: 512,
    );
    if (context.mounted) {
      if (xFile != null) {}
      Navigator.pop(context);
    }
  }
}
