import 'package:contest_app/blocs/audio_bloc/audio_bloc.dart';
import 'package:contest_app/blocs/video_bloc/video_bloc.dart';
import 'package:contest_app/data/repository/video_repository.dart';
import 'package:contest_app/services/api_service.dart';
import 'package:contest_app/ui/tab/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'data/local/storage_repository/storage_repository.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await StorageRepository.getInstance();

  runApp(App(apiService: ApiService(),));
}

class App extends StatelessWidget {
  const App({Key? key, required this.apiService}) : super(key: key);
  final ApiService apiService;

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => VideoRepository(apiService: apiService),
      child: MultiBlocProvider(providers: [
        BlocProvider(create: (context) => AudioBloc()),
        BlocProvider(create: (context) => VideoBloc(videoRepository: context.read<VideoRepository>()))
      ], child: const MyApp()),
    );
  }
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
          initialRoute: RouteNames.tabBox,
          onGenerateRoute: AppRoutes.generateRoute,
        );
      },
    );
  }
}
