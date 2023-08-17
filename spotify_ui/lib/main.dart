import 'package:flutter/material.dart';
import 'package:spotify_ui/shared/app_colors.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:spotify_ui/shared/constants.dart';

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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Boa tarde',
                    style: TextStyle(
                      fontFamily: 'Open Sans',
                      fontSize: 30.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          FontAwesomeIcons.bell,
                          size: 25.0,
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          FontAwesomeIcons.clock,
                          size: 25.0,
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          FontAwesomeIcons.gear,
                          size: 25.0,
                        ),
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
                  Container(
                    width: 90,
                    decoration: BoxDecoration(
                      color: AppColors.grey,
                      borderRadius: BorderRadius.all(
                        Radius.circular(50),
                      ),
                    ),
                    child: TextButton(
                        onPressed: () {},
                        child: Text(
                          'Música',
                          style: kMainButtonTextStyle,
                        )),
                  ),
                  SizedBox(
                    width: 8.0,
                  ),
                  Container(
                    width: 200,
                    decoration: BoxDecoration(
                      color: AppColors.grey,
                      borderRadius: BorderRadius.all(
                        Radius.circular(50),
                      ),
                    ),
                    child: TextButton(
                        onPressed: () {},
                        child: Text(
                          'Podcasts e programas',
                          style: kMainButtonTextStyle,
                        )),
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
