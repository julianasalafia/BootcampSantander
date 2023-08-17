import 'package:flutter/material.dart';

class MainIconButton extends StatelessWidget {
  const MainIconButton({
    super.key,
    required this.icon,
  });

  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {},
      icon: Icon(
        icon,
        size: 25.0,
      ),
    );
  }
}
