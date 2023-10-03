import 'package:contest_app/blocs/article_bloc/article_bloc.dart';
import 'package:contest_app/blocs/audio_bloc/audio_bloc.dart';
import 'package:contest_app/blocs/audios_bloc/audios_bloc.dart';
import 'package:contest_app/blocs/audios_bloc/audios_event.dart';
import 'package:contest_app/blocs/book/book_bloc.dart';
import 'package:contest_app/blocs/categories_bloc/categories_bloc.dart';
import 'package:contest_app/blocs/categories_bloc/categories_event.dart';
import 'package:contest_app/blocs/login_bloc/login_bloc.dart';
import 'package:contest_app/blocs/quizzes_bloc/quizzes_bloc.dart';
import 'package:contest_app/blocs/rating_bloc/rating_bloc.dart';
import 'package:contest_app/blocs/video_bloc/video_bloc.dart';
import 'package:contest_app/cubit/audios/audios_cubit.dart';
import 'package:contest_app/cubit/download/downloader_cubit.dart';
import 'package:contest_app/data/repository/app_repository.dart';
import 'package:contest_app/data/repository/article_repository.dart';
import 'package:contest_app/data/repository/audios_repository.dart';
import 'package:contest_app/data/repository/book_repository.dart';
import 'package:contest_app/data/repository/quiz_repository.dart';
import 'package:contest_app/data/repository/rating_repository.dart';
import 'package:contest_app/data/repository/video_repository.dart';
import 'package:contest_app/services/api_service.dart';
import 'package:contest_app/ui/tab/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'cubit/auth_cubit/auth_cubit.dart';
import 'data/local/storage_repository/storage_repository.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await StorageRepository.getInstance();

  runApp(App(
    apiService: ApiService(),
  ));
}

class App extends StatelessWidget {
  const App({Key? key, required this.apiService}) : super(key: key);
  final ApiService apiService;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => RatingRepository(apiService: apiService),
        ),
        RepositoryProvider(
          create: (context) => ArticleRepository(apiService: apiService),
        ),
        RepositoryProvider(
          create: (context) => QuizRepository(apiService: apiService),
        ),
        RepositoryProvider(
          create: (context) => BookRepoSitory(apiService: apiService),
        ),
        RepositoryProvider(
          create: (context) => VideoRepository(apiService: apiService),
        ),
        RepositoryProvider(
          create: (context) => AppRepository(apiService: apiService),
        ),
        RepositoryProvider(
          create: (context) => AudiosRepository(apiService: apiService),
        ),
      ],
      child: MultiBlocProvider(providers: [
        BlocProvider(create: (context) => AudioBloc()),
        BlocProvider(create: (context) => DownLoaderCubit()),
        BlocProvider(create: (context) => AuthCubit(apiService)),
        BlocProvider(create: (context) => LoginBloc(apiService)),
        BlocProvider(
            create: (context) =>
                VideoBloc(videoRepository: context.read<VideoRepository>())
                  ..add(GetVideosEvent())),
        BlocProvider(
            create: (context) => ArticleBloc(
                articleRepository: context.read<ArticleRepository>())),
        BlocProvider(
            create: (context) =>
                AudiosBloc(audiosRepository: context.read<AudiosRepository>())
                  ..add(GetAudiosEvent())),
        BlocProvider(
            create: (context) =>
                BookBloc(bookRepoSitory: context.read<BookRepoSitory>())),
        BlocProvider(
            create: (context) => AudiosCubit(
                audiosRepository: context.read<AudiosRepository>())),
        BlocProvider(
            create: (context) => QuizzesBloc(
                quizRepository: context.read<QuizRepository>())),
        BlocProvider(
            create: (context) =>
                CategoriesBloc(appRepository: context.read<AppRepository>())
                  ..add(GetCategories())),
        BlocProvider(
            create: (context) =>
            RatingBloc(ratingRepository: context.read<RatingRepository>())),
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
