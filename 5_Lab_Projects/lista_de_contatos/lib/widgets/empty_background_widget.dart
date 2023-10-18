import 'package:flutter/material.dart';

import '../helper/constants.dart';

class EmptyBackgroundWidget extends StatelessWidget {
  const EmptyBackgroundWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Padding(
      padding: const EdgeInsets.all(50.0),
      child: Image.asset(backgroundImage),
    ));
  }
}
