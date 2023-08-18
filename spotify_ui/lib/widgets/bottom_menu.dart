import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../shared/app_colors.dart';
import 'main_icon_button.dart';

class BottomMenu extends StatelessWidget {
  const BottomMenu({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 5,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                MainIconButton(
                    icon: FontAwesomeIcons.house, color: Colors.white),
                Text(
                  'Início',
                  style: TextStyle(fontSize: 11.0),
                ),
                SizedBox(height: 10.0),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                MainIconButton(
                  icon: FontAwesomeIcons.magnifyingGlass,
                  color: AppColors.lightGrey,
                ),
                Text(
                  'Buscar',
                  style: TextStyle(fontSize: 11.0, color: AppColors.lightGrey),
                ),
                SizedBox(height: 10.0),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                MainIconButton(
                  icon: FontAwesomeIcons.gripLinesVertical,
                  color: AppColors.lightGrey,
                ),
                Text(
                  'Sua Biblioteca',
                  style: TextStyle(fontSize: 11.0, color: AppColors.lightGrey),
                ),
                SizedBox(height: 10.0),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
