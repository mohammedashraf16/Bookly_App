import 'package:bookely_app/constants.dart';
import 'package:bookely_app/core/utils/app_router.dart';
import 'package:bookely_app/features/home/domain/entities/book_entity.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';

void main() async{
  runApp(const BooklyApp());
  WidgetsFlutterBinding.ensureInitialized();
  Hive.registerAdapter(BookEntityAdapter());
  await Hive.openBox(kFeaturedBox);
}

class BooklyApp extends StatelessWidget {
  const BooklyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AppRouter.router,
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: kPrimaryColor,
          textTheme: GoogleFonts.spectralTextTheme(
            ThemeData.dark().textTheme,
          )),
    );
  }
}
