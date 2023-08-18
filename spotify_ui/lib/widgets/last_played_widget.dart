import 'package:flutter/material.dart';

import 'last_played_single_widget.dart';

class LastPlayedWidget extends StatelessWidget {
  const LastPlayedWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            LastPlayedSingleWidget(
                cover: 'assets/images/arianagrande.jpeg',
                title: 'This Is Ariana Grande'),
            SizedBox(
              width: 10.0,
            ),
            LastPlayedSingleWidget(
                cover: 'assets/images/macmiller.jpeg',
                title: 'This Is Mac \nMiller'),
          ],
        ),
        SizedBox(
          height: 10.0,
        ),
        Row(
          children: [
            LastPlayedSingleWidget(
                cover: 'assets/images/mileycyrus.jpg', title: 'Plastic Hearts'),
            SizedBox(
              width: 10.0,
            ),
            LastPlayedSingleWidget(
                cover: 'assets/images/naoinviabilize.jpg',
                title: 'Não \nInviabilize'),
          ],
        ),
        SizedBox(
          height: 10.0,
        ),
        Row(
          children: [
            LastPlayedSingleWidget(
                cover: 'assets/images/aishadee.jpg', title: 'SUITCASE'),
            SizedBox(
              width: 10.0,
            ),
            LastPlayedSingleWidget(
                cover: 'assets/images/spotify.jpg', title: 'Seus \nepisódios'),
          ],
        ),
      ],
    );
  }
}
