import 'package:flutter/material.dart';

import '../helper/app_colors.dart';

class CircleAvatarPictureWidget extends StatelessWidget {
  const CircleAvatarPictureWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30.0),
      child: CircleAvatar(
          backgroundColor: AppColors.lightBlue,
          maxRadius: 80,
          minRadius: 30,
          child: IconButton(
            padding: EdgeInsets.zero,
            onPressed: () {
              //TODO: selecionar imagem e salvar no contato
            },
            icon: const Icon(
              Icons.add_photo_alternate_outlined,
              color: Colors.black54,
              size: 50,
            ),
          )),
    );
  }
}
