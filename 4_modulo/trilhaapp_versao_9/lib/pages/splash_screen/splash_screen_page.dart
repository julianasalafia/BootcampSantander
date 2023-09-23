import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:trilhaapp/pages/home_page.dart';

class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({super.key});

  @override
  State<SplashScreenPage> createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.pink, Colors.purple, Colors.blue],
            stops: [0.3, 0.5, 1],
          ),
        ),
        child: Center(
          child: AnimatedTextKit(
            onFinished: () {
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (_) => HomePage()));
            },
            animatedTexts: [
              TypewriterAnimatedText(
                'Hello world!',
                textStyle: const TextStyle(
                  fontSize: 32.0,
                  fontWeight: FontWeight.bold,
                ),
                speed: const Duration(milliseconds: 350),
              ),
            ],
            totalRepeatCount: 1,
            pause: const Duration(milliseconds: 150),
            displayFullTextOnTap: true,
            stopPauseOnTap: true,
          ),
        ),
      ),
    ));
  }
}
