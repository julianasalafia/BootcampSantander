import 'package:flutter/material.dart';

import '../shared/app_colors.dart';

class LastPlay extends StatelessWidget {
  const LastPlay({
    super.key,
    required this.cover,
    required this.title,
  });

  final String cover;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        children: [
          Image.asset(
            cover,
            height: 75,
          ),
          Container(
            height: 75,
            color: AppColors.grey,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Text(
                  title,
                  style: TextStyle(
                    fontFamily: 'Open Sans',
                    fontSize: 13.0,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
