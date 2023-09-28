import 'package:contest_app/ui/tab/app_routes.dart';
import 'package:contest_app/ui/tab/home/sub_screens/videos/sub_screens/all_videos/videos_screen.dart';
import 'package:contest_app/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'local/storage_repository/storage_repository.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await StorageRepository.getInstance();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (BuildContext context, Widget? child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
            useMaterial3: true,
          ),
          home: const VideosScreen(),
          // initialRoute: RouteNames.tabBox,
          // onGenerateRoute: AppRoutes.generateRoute,
        );
      },
    );
  }
}
