import 'package:flutter/material.dart';
import 'package:jazenet_app/const/colors.dart';
import 'package:jazenet_app/routes/routes.dart';
import 'package:jazenet_app/screen/onboarding/splash_screen/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Jazenet',
      routes: routes(),
      debugShowCheckedModeBanner: false,
      color: Colours().black,
      theme: ThemeData(
        appBarTheme: AppBarTheme(backgroundColor: Colours().black,iconTheme: IconThemeData(color: Colours().white)),
        primaryColor: Colours().black,
        scaffoldBackgroundColor: Colours().white,
        primarySwatch: Colors.blue,
      ),
      home: const SplashScreen(),
    );
  }
}
