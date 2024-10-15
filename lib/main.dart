import 'package:bloc/bloc.dart';
import 'package:bookely_app/constants.dart';
import 'package:bookely_app/core/utils/app_router.dart';
import 'package:bookely_app/core/utils/observer.dart';
import 'package:bookely_app/core/utils/setup_service_locator.dart';
import 'package:bookely_app/features/home/data/repos/home_repo_impl.dart';
import 'package:bookely_app/features/home/domain/entities/book_entity.dart';
import 'package:bookely_app/features/home/domain/use_cases/fetch_featured_books_use_case.dart';
import 'package:bookely_app/features/home/domain/use_cases/fetch_newest_books_use_case.dart';
import 'package:bookely_app/features/home/presentation/manager/featured_books_cubit/featured_books_cubit.dart';
import 'package:bookely_app/features/home/presentation/manager/newest_books_cubit/newest_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await Hive.initFlutter();
  setupServiceLocator();
  Hive.registerAdapter(BookEntityAdapter());
  await Hive.openBox<BookEntity>(kFeaturedBox);
  await Hive.openBox<BookEntity>(kNewestBox);

  runApp(const BooklyApp());
}

class BooklyApp extends StatelessWidget {
  const BooklyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) {
            return FeaturedBooksCubit(FetchFeaturedBooksUseCase(
              getIt.get<HomeRepoImpl>(),
            ));
          },
        ),
        BlocProvider(
          create: (context) {
            return NewestBooksCubit(FetchNewestBooksUseCase(
              getIt.get<HomeRepoImpl>(),
            ));
          },
        ),
      ],
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
            scaffoldBackgroundColor: kPrimaryColor,
            textTheme: GoogleFonts.spectralTextTheme(
              ThemeData.dark().textTheme,
            )),
      ),
    );
  }
}
