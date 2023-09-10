import 'package:flutter/material.dart';

class PageResults extends StatefulWidget {
  const PageResults({super.key});

  @override
  State<PageResults> createState() => _PageResultsState();
}

class _PageResultsState extends State<PageResults> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('resultados'),
      ),
      body: Column(
        children: [],
      ),
    );
  }
}
