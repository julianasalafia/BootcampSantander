import 'package:flutter/material.dart';

class CircularCenterProgressWidget extends StatelessWidget {
  const CircularCenterProgressWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Expanded(child: Center(child: CircularProgressIndicator()));
  }
}
