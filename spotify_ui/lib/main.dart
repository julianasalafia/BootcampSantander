import 'package:flutter/material.dart';
import 'package:spotify_ui/shared/app_colors.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:spotify_ui/shared/constants.dart';
import 'package:spotify_ui/widgets/LastPlay.dart';
import 'package:spotify_ui/widgets/main_icon_button.dart';
import 'package:spotify_ui/widgets/main_text_button.dart';

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
        textTheme: TextTheme(
          bodyMedium: TextStyle(fontFamily: 'Open Sans'),
        ),
      ),
      home: const Scaffold(
        body: Padding(
          padding: EdgeInsets.all(10.0),
          child: Column(
            children: [
              SizedBox(
                height: 75.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Boa tarde',
                    style: kTitleTextStyle,
                  ),
                  Row(
                    children: [
                      MainIconButton(
                        icon: FontAwesomeIcons.bell,
                      ),
                      MainIconButton(
                        icon: FontAwesomeIcons.clock,
                      ),
                      MainIconButton(
                        icon: FontAwesomeIcons.gear,
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 18.0,
              ),
              Row(
                children: [
                  MainTextButton(
                    title: 'Música',
                    width: 90,
                  ),
                  SizedBox(
                    width: 8.0,
                  ),
                  MainTextButton(
                    title: 'Podcasts e programas',
                    width: 200,
                  ),
                ],
              ),
              SizedBox(
                height: 18.0,
              ),
              Column(
                children: [
                  Row(
                    children: [
                      LastPlay(
                        cover: 'assets/images/arianagrande.jpeg',
                        title: 'This is Ariana \nGrande',
                      ),
                      SizedBox(width: 8.0),
                      LastPlay(
                        cover: 'assets/images/macmiller.jpeg',
                        title: 'This is Mac \nMiller',
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
