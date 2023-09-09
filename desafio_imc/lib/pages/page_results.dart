import 'package:flutter/material.dart';

class PageResults extends StatefulWidget {
  const PageResults({super.key});

  @override
  State<PageResults> createState() => _PageResultsState();
}

class _PageResultsState extends State<PageResults> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          Text('teste'),
        ],
      ),
    );
  }
}
