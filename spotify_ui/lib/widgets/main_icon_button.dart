import 'package:flutter/material.dart';

class MainIconButton extends StatelessWidget {
  const MainIconButton({
    super.key,
    required this.icon,
    this.color,
  });

  final IconData icon;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {},
      icon: Icon(
        icon,
        size: 20.0,
        color: color,
      ),
    );
  }
}
