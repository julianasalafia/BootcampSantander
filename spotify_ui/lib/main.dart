import 'package:flutter/material.dart';
import 'package:spotify_ui/shared/app_colors.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:spotify_ui/shared/constants.dart';
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
      home: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              SizedBox(
                height: 75.0,
              ),
              const Row(
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
              const Row(
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
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Row(
                          children: [
                            Image.asset(
                              'assets/images/arianagrande.jpeg',
                              height: 75,
                            ),
                            Container(
                              height: 75,
                              color: AppColors.grey,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Center(
                                  child: Text(
                                    'This is Ariana \nGrande',
                                    style: TextStyle(
                                        fontFamily: 'Open Sans',
                                        fontSize: 13.0,
                                        fontWeight: FontWeight.w800),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 8.0),
                      Expanded(
                        child: Row(
                          children: [
                            Image.asset(
                              'assets/images/arianagrande.jpeg',
                              height: 75,
                            ),
                            Container(
                              height: 75,
                              color: AppColors.grey,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Center(
                                  child: Text(
                                    'This is Ariana \nGrande',
                                    style: TextStyle(
                                        fontFamily: 'Open Sans',
                                        fontSize: 13.0,
                                        fontWeight: FontWeight.w800),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8.0),
                  Row(
                    children: [
                      Expanded(
                        child: Row(
                          children: [
                            Image.asset(
                              'assets/images/arianagrande.jpeg',
                              height: 75,
                            ),
                            Container(
                              height: 75,
                              color: AppColors.grey,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Center(
                                  child: Text(
                                    'This is Ariana \nGrande',
                                    style: TextStyle(
                                        fontFamily: 'Open Sans',
                                        fontSize: 13.0,
                                        fontWeight: FontWeight.w800),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 8.0),
                      Expanded(
                        child: Row(
                          children: [
                            Image.asset(
                              'assets/images/arianagrande.jpeg',
                              height: 75,
                            ),
                            Container(
                              height: 75,
                              color: AppColors.grey,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Center(
                                  child: Text(
                                    'This is Ariana \nGrande',
                                    style: TextStyle(
                                        fontFamily: 'Open Sans',
                                        fontSize: 13.0,
                                        fontWeight: FontWeight.w800),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8.0),
                  Row(
                    children: [
                      Expanded(
                        child: Row(
                          children: [
                            Image.asset(
                              'assets/images/arianagrande.jpeg',
                              height: 75,
                            ),
                            Container(
                              height: 75,
                              color: AppColors.grey,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Center(
                                  child: Text(
                                    'This is Ariana \nGrande',
                                    style: TextStyle(
                                        fontFamily: 'Open Sans',
                                        fontSize: 13.0,
                                        fontWeight: FontWeight.w800),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 8.0),
                      Expanded(
                        child: Row(
                          children: [
                            Image.asset(
                              'assets/images/arianagrande.jpeg',
                              height: 75,
                            ),
                            Container(
                              height: 75,
                              color: AppColors.grey,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Center(
                                  child: Text(
                                    'This is Ariana \nGrande',
                                    style: TextStyle(
                                        fontFamily: 'Open Sans',
                                        fontSize: 13.0,
                                        fontWeight: FontWeight.w800),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
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
