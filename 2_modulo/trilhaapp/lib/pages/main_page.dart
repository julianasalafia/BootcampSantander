import 'package:flutter/material.dart';
import 'package:trilhaapp/pages/dados_cadastrais.dart';
import 'package:trilhaapp/pages/pagina1.dart';
import 'package:trilhaapp/pages/pagina2.dart';
import 'package:trilhaapp/pages/pagina3.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int posicaoPagina = 0;
  PageController controller = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Main Page'),
        ),
        drawer: Drawer(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 30),
                InkWell(
                  child: Container(
                      padding: EdgeInsets.symmetric(vertical: 5),
                      width: double.infinity,
                      child: Text('Dados cadastrais')),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DadosCadastraisPage(
                                  texto: 'Dados cadastrais',
                                  dados: [
                                    'nome',
                                    'endereço',
                                    'telefone',
                                  ],
                                )));
                  },
                ),
                Divider(),
                SizedBox(height: 10),
                InkWell(
                  child: Container(
                      padding: EdgeInsets.symmetric(vertical: 5),
                      width: double.infinity,
                      child: Text('Termos de uso e privacidade')),
                  onTap: () {},
                ),
                Divider(),
                SizedBox(height: 10),
                InkWell(
                  child: Container(
                      padding: EdgeInsets.symmetric(vertical: 5),
                      width: double.infinity,
                      child: Text('Configurações')),
                  onTap: () {},
                ),
              ],
            ),
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: PageView(
                controller: controller,
                onPageChanged: (value) {
                  setState(() {
                    posicaoPagina = value;
                  });
                },
                children: [
                  Pagina1Page(),
                  Pagina2Page(),
                  Pagina3Page(),
                ],
              ),
            ),
            BottomNavigationBar(
              onTap: (value) {
                controller.jumpToPage(value);
              },
              currentIndex: posicaoPagina,
              items: [
                BottomNavigationBarItem(label: 'Pag1', icon: Icon(Icons.home)),
                BottomNavigationBarItem(label: 'Pag2', icon: Icon(Icons.add)),
                BottomNavigationBarItem(
                    label: 'Pag3', icon: Icon(Icons.person)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
