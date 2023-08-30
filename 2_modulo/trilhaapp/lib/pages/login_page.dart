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
        backgroundColor: Colors.white,
        body: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 70),
              const Icon(
                Icons.person,
                size: 150,
                color: Colors.blueAccent,
              ),
              const SizedBox(height: 50),
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.symmetric(horizontal: 30),
                height: 30,
                width: double.infinity,
                child: Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Text('Informe seu email:'),
                    ),
                    Expanded(
                      flex: 3,
                      child: Text('email@email.com'),
                    ),
                  ],
                ),
              ),
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.symmetric(horizontal: 30),
                height: 30,
                width: double.infinity,
                child: Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Text('Informe a senha:'),
                    ),
                    Expanded(
                      flex: 3,
                      child: Text('**********'),
                    ),
                  ],
                ),
              ),
              Expanded(child: Container()),
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.symmetric(horizontal: 30),
                color: Colors.green,
                height: 30,
                width: double.infinity,
                child: Text('Login'),
              ),
              const SizedBox(height: 20),
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.symmetric(horizontal: 30),
                color: Colors.green,
                height: 30,
                width: double.infinity,
                child: Text('Cadastro'),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
