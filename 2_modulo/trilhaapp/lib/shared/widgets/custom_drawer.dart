import 'package:flutter/material.dart';

import '../../pages/dados_cadastrais.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(color: Colors.black54),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.white,
              child: Image.network(
                  'https://hermes.digitalinnovation.one/assets/diome/logo.png'),
            ),
            accountName: Text('Juliana Salafia'),
            accountEmail: Text('ju@gmail.com'),
          ),
          InkWell(
            child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                width: double.infinity,
                child: Row(
                  children: [
                    Icon(Icons.person),
                    SizedBox(width: 10),
                    Text('Dados cadastrais'),
                  ],
                )),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => DadosCadastraisPage()));
            },
          ),
          Divider(),
          SizedBox(height: 10),
          InkWell(
            child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                width: double.infinity,
                child: Row(
                  children: [
                    Icon(Icons.info),
                    SizedBox(width: 10),
                    Text('Termos de uso e privacidade'),
                  ],
                )),
            onTap: () {},
          ),
          Divider(),
          SizedBox(height: 10),
          InkWell(
            child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                width: double.infinity,
                child: Row(
                  children: [
                    Icon(Icons.gpp_maybe_rounded),
                    SizedBox(width: 10),
                    Text('Configurações'),
                  ],
                )),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
