import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey,
        body: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 70),
              Container(
                width: 150,
                height: 150,
                color: Colors.amber,
              ),
              const SizedBox(height: 10),
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.symmetric(horizontal: 30),
                color: Colors.green,
                height: 30,
                width: double.infinity,
                child: Text('Informe seu email'),
              ),
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.symmetric(horizontal: 30),
                color: Colors.green,
                height: 30,
                width: double.infinity,
                child: Text('Informe a senha'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
