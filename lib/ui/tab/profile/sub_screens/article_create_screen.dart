import 'package:contest_app/blocs/article_bloc/article_bloc.dart';
import 'package:contest_app/blocs/article_bloc/article_event.dart';
import 'package:contest_app/blocs/article_bloc/article_state.dart';
import 'package:contest_app/data/models/article/create_article_model.dart';
import 'package:contest_app/data/models/status/form_status.dart';
import 'package:contest_app/ui/tab/profile/widgets/global_button.dart';
import 'package:contest_app/ui/tab/profile/widgets/global_text_field.dart';
import 'package:contest_app/ui/tab/profile/widgets/image_button.dart';
import 'package:contest_app/ui/tab/profile/widgets/show_snackbar.dart';
import 'package:contest_app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class ArticleCreateScreen extends StatefulWidget {
  const ArticleCreateScreen({super.key});

  @override
  State<ArticleCreateScreen> createState() => _ArticleCreateScreenState();
}

class _ArticleCreateScreenState extends State<ArticleCreateScreen> {
  ImagePicker picker = ImagePicker();

  String image = '';
  TextEditingController nameController = TextEditingController();
  TextEditingController textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(scrolledUnderElevation: 0),
      body: BlocConsumer<ArticleBloc, ArticleState>(
        builder: (context, state) {
          if (state.status == FormStatus.loading) {
            return const Center(child: CircularProgressIndicator());
          }
          return Padding(
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
                        child: GlobalTextField(
                          hintText: 'Maqola nomini kiriting',
                          maxLines: 1,
                          controller: nameController,
                        ),
                      ),
                      SizedBox(height: height * (16 / 812)),
                      ImageButton(
                        onTap: () {
                          showBottomSheetDialog(context);
                        },
                        path: image,
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
                      GlobalTextField(
                        hintText: 'Matnni kiriting',
                        maxLines: 15,
                        controller: textController,
                      ),
                      SizedBox(height: height * (16 / 812)),
                    ],
                  ),
                ),
                GlobalButton(
                  text: 'Jo\'natish',
                  onTap: () {
                    if (textController.text.isNotEmpty &&
                        textController.text.isNotEmpty &&
                        image.isNotEmpty) {
                      context.read<ArticleBloc>().add(
                            CreateArticleEvent(
                              createArticleModel: CreateArticleModel(
                                text: nameController.text,
                                categoryId: 1,
                                userId: 21,
                                image: image,
                              ),
                            ),
                          );
                    } else {
                      showSnackBar(context: context, text: 'Fields are not filled');
                    }
                  },
                ),
                SizedBox(height: height * (30 / 812)),
              ],
            ),
          );
        },
        listener: (context, state) {
          if (state.status == FormStatus.success) {
            showSnackBar(context: context, text: 'Article successfully added');
            Navigator.pop(context);
          }
          if (state.status == FormStatus.failure) {
            showSnackBar(context: context, text: state.statusText);
          }
        },
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
      if (xFile != null) {
        image = xFile.path;
      }
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
      if (xFile != null) {
        image = xFile.path;
      }
      Navigator.pop(context);
    }
  }
}
