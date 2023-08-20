import 'package:flutter/material.dart';
import 'package:spotify_ui/widgets/similar_artists_widget.dart';

import '../shared/app_colors.dart';
import '../shared/constants.dart';

class SimilarToWidget extends StatelessWidget {
  const SimilarToWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(100.0),
              child: Image.asset(
                'assets/images/aishadeecover.jpeg',
                width: 50,
                height: 50,
              ),
            ),
            SizedBox(width: 10.0),
            Column(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'PARECIDO COM',
                      style: TextStyle(
                          color: AppColors.mediumGrey, fontSize: 12.0),
                    ),
                    SizedBox(height: 3.0),
                    Text(
                      'Aisha Dee',
                      style: kTitleTextStyle,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              SimilarArtistsWidget(
                  artist: 'Single • Jasimi',
                  song: 'Doing great',
                  image: 'assets/images/jasimi.jpg'),
              SizedBox(width: 10.0),
              SimilarArtistsWidget(
                  artist: 'Single • Carla Bruni',
                  song: 'Le plus beau du quartier',
                  image: 'assets/images/carlabruni.jpg'),
              SizedBox(width: 10.0),
              SimilarArtistsWidget(
                  artist: 'Todos os maiores hits e...',
                  song: 'This is Kali Uchis',
                  image: 'assets/images/kaliuchis.jpeg'),
            ],
          ),
        ),
      ],
    );
  }
}
