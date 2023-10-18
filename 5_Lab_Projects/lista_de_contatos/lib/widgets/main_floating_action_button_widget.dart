import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class MainFloatingActionButtonWidget extends StatelessWidget {
  final String page;
  final Icon icon;
  const MainFloatingActionButtonWidget({
    super.key,
    required this.page,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          FloatingActionButton(
            child: icon,
            onPressed: () {
              Modular.to.pushNamed(page);
            },
          ),
        ],
      ),
    );
  }
}
