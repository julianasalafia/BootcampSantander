import 'package:flutter/material.dart';

import 'main_text_button.dart';

class SelectorWidget extends StatelessWidget {
  const SelectorWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        MainTextButton(
          title: 'Música',
          width: 90,
        ),
        SizedBox(
          width: 8.0,
        ),
        MainTextButton(
          title: 'Podcasts e programas',
          width: 200,
        ),
      ],
    );
  }
}
