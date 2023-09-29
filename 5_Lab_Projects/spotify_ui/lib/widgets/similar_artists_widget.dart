import 'package:flutter/material.dart';

import '../shared/app_colors.dart';

class SimilarArtistsWidget extends StatelessWidget {
  SimilarArtistsWidget({
    super.key,
    required this.artist,
    required this.song,
    required this.image,
  });

  String song;
  String artist;
  String image;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 10.0),
        Container(width: 150.0, child: Image.asset(image)),
        SizedBox(height: 10.0),
        Text(song,
            style: TextStyle(
              color: AppColors.white,
              fontSize: 12.0,
            )),
        Text(
          artist,
          style: TextStyle(color: AppColors.mediumGrey, fontSize: 12.0),
        ),
      ],
    );
  }
}
