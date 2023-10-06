import 'dart:async';
import 'dart:io';

import 'package:contest_app/cubit/download/downloader_state.dart';
import 'package:contest_app/ui/tab/profile/auth/auth_screen.dart';
import 'package:contest_app/utils/loading_dialog.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:open_filex/open_filex.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

class DownLoaderCubit extends Cubit<DownLoaderState> {
  DownLoaderCubit()
      : super(
          const DownLoaderState(
            progress: 0.0,
            newFileLocation: "",
          ),
        );

  myProgressEmitter(double pr) {
    emit(state.copyWith(progress: pr));
  }

  downloadFile(
      {required String fileInfo, required BuildContext context}) async {
    bool hasPermission = await _requestWritePermission();
    if (!hasPermission) return;
    Dio dio = Dio();

    var directory = await getDownloadPath();
    String newFileLocation =
        "${directory?.path}/Nabeey${fileInfo.substring(fileInfo.length - 5, fileInfo.length)}";
    var allFiles = directory?.list();

    List<String> filePaths = [];
    await allFiles?.forEach((element) {
      filePaths.add(element.path.toString());
    });
    if (filePaths.contains(newFileLocation)) {
      OpenFilex.open(newFileLocation);
    } else {
      try {
        if (context.mounted) {
          showLoading(context: context);
        }
        await dio.download(
          fileInfo,
          newFileLocation,
          onReceiveProgress: (count, total) {
            myProgressEmitter(count / total);
            if (count / total == 1.0) {
              emit(state.copyWith(newFileLocation: newFileLocation));
            }
          },
        );
        if (context.mounted) {
          hideLoading(context: context);
        }
        OpenFilex.open(newFileLocation);
      } catch (error) {
        debugPrint("DOWNLOAD ERROR:$error");
        if (context.mounted) showErrorDialog(context, error.toString());
      }
    }
  }

  Future<bool> _requestWritePermission() async {
    await Permission.storage.request();
    return await Permission.storage.request().isGranted;
  }

  Future<Directory?> getDownloadPath() async {
    Directory? directory;
    try {
      if (Platform.isIOS) {
        directory = await getApplicationDocumentsDirectory();
      } else {
        directory = Directory('/storage/0/Download');
        if (!await directory.exists()) {
          directory = await getExternalStorageDirectory();
        }
      }
    } catch (err) {
      debugPrint("Cannot get download folder path : $err");
    }
    return directory;
  }
}
