import 'package:flutter/material.dart';

import '../helper/constants.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 1,
      backgroundColor: Colors.white,
      title: const Text(
        appBarTitle,
        style: TextStyle(color: Colors.blue),
      ),
      leading: const Icon(
        Icons.person_rounded,
        color: Colors.blue,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
