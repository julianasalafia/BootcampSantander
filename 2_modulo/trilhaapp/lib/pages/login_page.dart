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
        backgroundColor: Colors.black54,
        body: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 50),
              Row(
                children: [
                  Expanded(child: Container()),
                  Expanded(
                    flex: 8,
                    child: Image.network(
                        'https://hermes.digitalinnovation.one/assets/diome/logo.png'),
                  ),
                  Expanded(child: Container()),
                ],
              ),
              const SizedBox(height: 20),
              const Text(
                'Já tem cadastro?',
                style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.w600,
                    color: Colors.white),
              ),
              const SizedBox(height: 10),
              const Text(
                'Faça seu login e make the change._',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.white70,
                ),
              ),
              const SizedBox(height: 40),
              Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.symmetric(horizontal: 30),
                height: 30,
                width: double.infinity,
                child: TextField(
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(top: 0),
                    hintText: 'Email',
                    hintStyle: TextStyle(color: Colors.white),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.deepPurple[500]!),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.deepPurple[500]!),
                    ),
                    prefixIcon: Icon(
                      Icons.person,
                      color: Colors.deepPurple[500],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.symmetric(horizontal: 30),
                height: 30,
                width: double.infinity,
                child: TextField(
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(top: 0),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.deepPurple[500]!),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.deepPurple[500]!),
                    ),
                    hintText: 'Senha',
                    hintStyle: TextStyle(color: Colors.white),
                    prefixIcon: Icon(
                      Icons.lock,
                      color: Colors.deepPurple[500],
                    ),
                    suffixIcon: Icon(
                      Icons.visibility,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.symmetric(horizontal: 30),
                width: double.infinity,
                child: SizedBox(
                  width: double.infinity,
                  child: TextButton(
                    onPressed: () {},
                    style: ButtonStyle(
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        backgroundColor:
                            MaterialStateProperty.all(Colors.deepPurple[500])),
                    child: const Text(
                      'ENTRAR',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
              ),
              Expanded(child: Container()),
              Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.symmetric(horizontal: 30),
                height: 30,
                width: double.infinity,
                child: const Text(
                  'Esqueci minha senha',
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.yellow,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.symmetric(horizontal: 30),
                height: 30,
                width: double.infinity,
                child: const Text(
                  'Criar conta',
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.green,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              const SizedBox(height: 60),
            ],
          ),
        ),
      ),
    );
  }
}
