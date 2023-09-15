import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HttpTestePage extends StatefulWidget {
  const HttpTestePage({super.key});

  @override
  State<HttpTestePage> createState() => _HttpTestePageState();
}

class _HttpTestePageState extends State<HttpTestePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Container(),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          var response = await http.get(Uri.parse('https://www.google.com'));
          print(response.statusCode);
          print(response.body);
        },
        child: const Icon(Icons.add),
      ),
    ));
  }
}
