import 'package:flutter/material.dart';
import 'package:via_cep/pages/cadastro_cep_page.dart';
import 'package:via_cep/pages/enderecos_cadastrados.dart';
import 'package:via_cep/pages/main_page.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const SizedBox(height: 25),
          Container(
              margin: const EdgeInsets.symmetric(horizontal: 100, vertical: 30),
              child: Image.asset('assets/correios-simple-logo.png')),
          const SizedBox(height: 25),
          InkWell(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              width: double.infinity,
              child: const Row(
                children: [
                  Icon(
                    Icons.home,
                    size: 25,
                  ),
                  SizedBox(width: 10),
                  Text('Home'),
                ],
              ),
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => const MainPage()));
            },
          ),
          InkWell(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              width: double.infinity,
              child: const Row(
                children: [
                  Icon(
                    Icons.pin_drop,
                    size: 25,
                  ),
                  SizedBox(width: 10),
                  Text('Cadastrar CEP'),
                ],
              ),
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const CadastroCepPage()));
            },
          ),
          InkWell(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              width: double.infinity,
              child: const Row(
                children: [
                  Icon(
                    Icons.map,
                    size: 25,
                  ),
                  SizedBox(width: 10),
                  Text('Endereços Cadastrados'),
                ],
              ),
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const EnderecosCadastradosPage()));
            },
          ),
        ],
      ),
    );
  }
}
