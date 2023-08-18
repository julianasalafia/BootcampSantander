import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../shared/app_colors.dart';
import 'main_icon_button.dart';

class NowPlayingWidget extends StatelessWidget {
  const NowPlayingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55.0,
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.darkerPink,
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ClipRRect(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(5.0),
                    ),
                    child: Image.asset('assets/images/aishadee.jpg')),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'BABIE GORGEOUS',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Aisha Dee',
                    style: TextStyle(color: AppColors.lightGrey),
                  ),
                ],
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              MainIconButton(
                icon: FontAwesomeIcons.computer,
                color: AppColors.lightGrey,
              ),
              MainIconButton(
                icon: FontAwesomeIcons.heart,
                color: AppColors.white,
              ),
              MainIconButton(
                icon: FontAwesomeIcons.play,
                color: AppColors.white,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
