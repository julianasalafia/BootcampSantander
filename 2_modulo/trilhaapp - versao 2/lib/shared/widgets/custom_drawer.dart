import 'package:flutter/material.dart';
import 'package:trilhaapp/pages/login_page.dart';
import 'package:trilhaapp/pages/numeros_aleatorios_page.dart';

import '../../pages/dados_cadastrais.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () {
              showModalBottomSheet(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  context: context,
                  builder: (BuildContext bc) {
                    return Wrap(
                      children: [
                        ListTile(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          title: Text('camera'),
                          leading: Icon(Icons.camera),
                        ),
                        ListTile(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          title: Text('galeria'),
                          leading: Icon(Icons.photo_album),
                        ),
                      ],
                    );
                  });
            },
            child: UserAccountsDrawerHeader(
              decoration: BoxDecoration(color: Colors.black54),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child: Image.network(
                    'https://hermes.digitalinnovation.one/assets/diome/logo.png'),
              ),
              accountName: Text('Juliana Salafia'),
              accountEmail: Text('ju@gmail.com'),
            ),
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
            onTap: () {
              showModalBottomSheet(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  context: context,
                  builder: (BuildContext bc) {
                    return Container(
                      padding: EdgeInsets.symmetric(
                          vertical: 12.0, horizontal: 16.0),
                      child: Column(
                        children: [
                          Text(
                            'Termos de uso e privacidade',
                            style: TextStyle(
                                fontSize: 20.0, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 20),
                          Text(
                            '  Ainda assim, existem dúvidas a respeito de como a valorização de fatores subjetivos oferece uma interessante oportunidade para verificação da gestão inovadora da qual fazemos parte. Todavia, a estrutura atual da organização faz parte de um processo de gerenciamento do fluxo de informações. Nunca é demais lembrar o peso e o significado destes problemas, uma vez que o aumento do diálogo entre os diferentes setores produtivos desafia a capacidade de equalização do sistema de participação geral. O cuidado em identificar pontos críticos no desenvolvimento contínuo de distintas formas de atuação cumpre um papel essencial na formulação das regras de conduta normativas. Por conseguinte, a consolidação das estruturas facilita a criação dos modos de operação convencionais.',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 16.0),
                          ),
                        ],
                      ),
                    );
                  });
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
                    Icon(Icons.gpp_maybe_rounded),
                    SizedBox(width: 10),
                    Text('Configurações'),
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
                    Icon(Icons.numbers),
                    SizedBox(width: 10),
                    Text('Gerador de números'),
                  ],
                )),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext bc) =>
                          const NumerosAleatoriosPage()));
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
                    Icon(Icons.exit_to_app),
                    SizedBox(width: 10),
                    Text('Sair'),
                  ],
                )),
            onTap: () {
              showDialog(
                  context: context,
                  builder: (BuildContext bc) {
                    return AlertDialog(
                      alignment: Alignment.centerLeft,
                      elevation: 8,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      title: Text(
                        'Meu app',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      content: Wrap(
                        children: [
                          Text('Você sairá do aplicativo!'),
                          Text('Deseja realmente sair?'),
                        ],
                      ),
                      actions: [
                        TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text('Não')),
                        TextButton(
                            onPressed: () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => LoginPage()));
                            },
                            child: Text('Sim')),
                      ],
                    );
                  });
            },
          ),
        ],
      ),
    );
  }
}
