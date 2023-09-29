import 'package:contest_app/blocs/article_bloc/article_bloc.dart';
import 'package:contest_app/blocs/audio_bloc/audio_bloc.dart';
import 'package:contest_app/data/repository/article_repository.dart';
import 'package:contest_app/services/article_service.dart';
import 'package:contest_app/ui/tab/app_routes.dart';
import 'package:contest_app/ui/tab/home/sub_screens/videos/sub_screens/all_videos/videos_screen.dart';
import 'package:contest_app/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'local/storage_repository/storage_repository.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await StorageRepository.getInstance();

  runApp(App(
    articleService: ArticleService(),
  ));
}

class App extends StatelessWidget {
  const App({Key? key, required this.articleService}) : super(key: key);
  final ArticleService articleService;

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => ArticleRepository(articleService: articleService),
      child: MultiBlocProvider(providers: [
        BlocProvider(create: (context) => AudioBloc()),
        BlocProvider(
            create: (context) => ArticleBloc(
                articleRepository: context.read<ArticleRepository>())),
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
