import 'package:flutter/material.dart';
import 'package:trilhaapp/pages/splash_screen/splash_screen_delay_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreenDelayPage(),
    );
  }
}
