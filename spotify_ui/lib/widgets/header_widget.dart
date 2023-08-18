import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../shared/constants.dart';
import 'main_icon_button.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
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
    );
  }
}
