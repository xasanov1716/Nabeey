import 'package:contest_app/data/local/storage_repository/storage_repository.dart';
import 'package:contest_app/ui/tab/app_routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io' show Platform;

class LogoutDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS) {
      return CupertinoAlertDialog(
        title: Text('Logout'),
        content: Text('Are you sure you want to logout?'),
        actions: [
          CupertinoDialogAction(
            onPressed: () {
              Navigator.of(context).pop(false);
            },
            child: Text('Cancel'),
          ),
          CupertinoDialogAction(
            onPressed: () {
              Navigator.pushNamedAndRemoveUntil(context, RouteNames.tabBox, (route) => false);
              StorageRepository.deleteString("token");
            },
            child: Text('Logout',style: TextStyle(color: Colors.red),),
          ),
        ],
      );
    } else {
      return AlertDialog(
        title: Text('Logout'),
        content: Text('Are you sure you want to logout?'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(false);
            },
            child: Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pushNamedAndRemoveUntil(context, RouteNames.tabBox, (route) => false);
              StorageRepository.deleteString("token");
            },
            child: Text('Logout',style: TextStyle(color: Colors.red),),
          ),
        ],
      );
    }
  }
}
