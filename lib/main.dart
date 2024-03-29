import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:insights_news/core/utils/colors.dart';
import 'package:insights_news/features/splash/presentation/view/splash_view.dart';

Future<void> main() async {
  await Hive.initFlutter();
  await Hive.openBox('user');
  runApp(const NewsApp());
}

class NewsApp extends StatelessWidget {
  const NewsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          type: BottomNavigationBarType.fixed,
          backgroundColor: AppColoes.darkBackground,
          showSelectedLabels: false,
          showUnselectedLabels: false,
        ),
        scaffoldBackgroundColor: AppColoes.darkBackground,
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: AppColoes.colorList,
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(color: AppColoes.colorList)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(color: AppColoes.colorList)),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(color: AppColoes.red)),
          focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(color: AppColoes.red)),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: const SplashView(),
    );
  }
}
