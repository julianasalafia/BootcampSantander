import 'package:flutter/material.dart';
import 'package:spotify_ui/shared/app_colors.dart';
import 'package:spotify_ui/widgets/header_widget.dart';
import 'package:spotify_ui/widgets/bottom_menu.dart';
import 'package:spotify_ui/widgets/last_played_widget.dart';
import 'package:spotify_ui/widgets/main_text_button.dart';
import 'package:spotify_ui/widgets/now_playing_widget.dart';
import 'package:spotify_ui/widgets/selector_widget.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: AppColors.white,
        scaffoldBackgroundColor: AppColors.darkerGrey,
        textTheme: const TextTheme(
          bodyMedium:
              TextStyle(fontFamily: 'Open Sans', color: AppColors.white),
        ),
      ),
      home: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 8.0, left: 8.0),
              child: Column(
                children: [
                  SizedBox(
                    height: 50.0,
                  ),
                  HeaderWidget(),
                  SizedBox(
                    height: 18.0,
                  ),
                  SelectorWidget(),
                  SizedBox(
                    height: 18.0,
                  ),
                  LastPlayedWidget(),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: 3.0, left: 3.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  NowPlayingWidget(),
                  BottomMenu(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
